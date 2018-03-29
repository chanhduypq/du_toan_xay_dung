<?php

class ExcelController extends Core_Controller_Action {

    public function init() {
        parent::init();
    }

    public function indexAction() {
        $this->view->message = $this->getMessage();        
    }

    public function saveAction() {
        $error = '';
        if (trim($this->_getParam('so_quyet_dinh', '')) == '') {
            $error .= 'Vui lòng nhập số quyết định.<br>';
        }
        if (trim($this->_getParam('ngay_quyet_dinh', '')) == '') {
            $error .= 'Vui lòng nhập ngày quyết định.<br>';
        }
        if (!isset($_FILES['excel']) || !isset($_FILES['excel']['name']) || $_FILES['excel']['name'] == '') {
            $error .= 'Vui lòng chọn file excel.<br>';
        }
        if (!isset($_FILES['pdf']) || !isset($_FILES['pdf']['name']) || $_FILES['pdf']['name'] == '') {
            $error .= 'Vui lòng chọn file pdf.<br>';
        }
        if ($error != '') {
            Core::message()->addSuccess($error);
            $this->_helper->redirector('index', 'excel', 'default');
            exit;
        }

        if ($this->exists()) {
            $this->delete();
        }
        
        $this->add();

        Core::message()->addSuccess('Lưu thành công');
        $this->_helper->redirector('index', 'excel', 'default');
    }

    private function delete() {
        if ($this->_getParam('type') == 'dtxd') {
            $table_name = 'du_toan';
        } else {
            $table_name = 'thiet_bi';
        }
        $row = Core_Db_Table::getDefaultAdapter()->fetchRow("select * from $table_name where so_quyet_dinh='" . $this->_getParam('so_quyet_dinh') . "'");
        $id = $row['id'];
        Core_Db_Table::getDefaultAdapter()->delete($table_name, "id=$id");
        Core_Db_Table::getDefaultAdapter()->delete($table_name . "_chi_tiet", $table_name . "_id=$id");
        @unlink("uploads/" . $row['path']."/excel.xls");
        @unlink("uploads/" . $row['path']."/pdf.pdf");
        rmdir("uploads/" . $row['path']);
    }

    private function add() {
        $time = strtotime(date('Y-m-d H:i:s'));
        $path = UPLOAD . "/public/uploads/" . $this->_getParam('type') . "_" . $time;
        mkdir($path);
        $item = $_FILES['excel']['name'];
        $extension = @explode(".", $item);
        $extension = $extension[count($extension) - 1];
        if (strtolower($extension) != 'xls') {
            Core::message()->addSuccess('Vui lòng upload file excel theo định dạng 2003');
            $this->_helper->redirector('index', 'excel', 'default');
            exit;
        }
        $item = 'excel.' . $extension;
        move_uploaded_file($_FILES['excel']['tmp_name'], $path . "/" . $item);
        if ($this->_getParam('type') == 'dtxd') {
            $mapper = new Default_Model_Dutoan();
            $id = $mapper->insert(array(
                                        'path' => $this->_getParam('type') . "_" . $time, 
                                        'so_quyet_dinh' => $this->_getParam('so_quyet_dinh', ''), 
                                        'ngay_quyet_dinh' => $this->_getParam('ngay_quyet_dinh', ''), 
                                        'noi_dung_quyet_dinh' => $this->_getParam('noi_dung_quyet_dinh', ''),
                                        'user_id'=> $this->getUserId(),
                                ));
            if ($this->importExcelForDtxd('uploads/' . $this->_getParam('type') . "_" . $time . "/" . $item, $id) == FALSE) {
                Core::message()->addSuccess('Vui lòng upload file excel theo định dạng 2003');
                $this->_helper->redirector('index', 'excel', 'default');
                exit;
            }
        } else {
            $mapper = new Default_Model_Thietbi();
            $id = $mapper->insert(array(
                                        'path' => $this->_getParam('type') . "_" . $time, 
                                        'so_quyet_dinh' => $this->_getParam('so_quyet_dinh', ''), 
                                        'ngay_quyet_dinh' => $this->_getParam('ngay_quyet_dinh', ''), 
                                        'noi_dung_quyet_dinh' => $this->_getParam('noi_dung_quyet_dinh', ''),
                                        'user_id'=> $this->getUserId(),
                                ));
            if ($this->importExcelForThietBi('uploads/' . $this->_getParam('type') . "_" . $time . "/" . $item, $id) == FALSE) {
                Core::message()->addSuccess('Vui lòng upload file excel theo định dạng 2003');
                $this->_helper->redirector('index', 'excel', 'default');
                exit;
            }
        }

        move_uploaded_file($_FILES['pdf']['tmp_name'], $path . "/pdf.pdf");
    }

    private function exists() {
        if ($this->_getParam('type') == 'dtxd') {
            $table_name = 'du_toan';
        } else {
            $table_name = 'thiet_bi';
        }
        $count = Core_Db_Table::getDefaultAdapter()->fetchOne("select count(*) as count from $table_name where so_quyet_dinh='".$this->_getParam('so_quyet_dinh')."'");
        return $count != 0;
    }

    private function importExcelForDtxd($file_name, $duToanId) {

        $excel = new Zend_Excel();
        $excel->setOutputEncoding('UTF-8');
        $bool = $excel->read($file_name);
        if (!$bool) {
            return FALSE;
        }

//        $cellValue = $excel->sheets[0]['cells'];//[7][7]->getCalculatedValue();
//        echo '<pre>';
//        var_dump($cellValue);
//        echo '</pre>';
//        exit;

        $this->saveDuToanChiTiet($excel->sheets[0], $duToanId);
        return true;
    }

    private function importExcelForThietBi($file_name, $thietBiId) {

        $excel = new Zend_Excel();
        $excel->setOutputEncoding('UTF-8');
        $bool = $excel->read($file_name);
        if (!$bool) {
            return FALSE;
        }

        $this->saveThietBiChiTiet($excel->sheets[0], $thietBiId);
        return true;
    }

    private function saveDuToanChiTiet($sheet, $duToanId) {
        $mapper = new Default_Model_Dutoanchitiet();

        $x = 7;
        while ($x <= $sheet['numRows']) {
            if (!isset($sheet['cells'][$x])) {
                $x++;
                continue;
            }
            $ky_hieu = iconv(mb_detect_encoding($sheet['cells'][$x][2], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][2]);
            $doi_tuong = iconv(mb_detect_encoding($sheet['cells'][$x][3], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][3]);
            $don_vi = iconv(mb_detect_encoding($sheet['cells'][$x][4], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][4]);
            $don_gia = iconv(mb_detect_encoding($sheet['cells'][$x][10], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][10]);
            $khoi_luong = iconv(mb_detect_encoding($sheet['cells'][$x][9], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][9]);
            $thanh_tien = iconv(mb_detect_encoding($sheet['cells'][$x][11], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][11]);
            $thanh_tien = str_replace(",", "", $thanh_tien);
            $khoi_luong = str_replace(",", "", $khoi_luong);
            $don_gia = str_replace(",", "", $don_gia);
            if (!is_numeric($thanh_tien)) {
                $thanh_tien = 0;
            }
            if (!is_numeric($khoi_luong)) {
                $khoi_luong = 0;
            }
            if (!is_numeric($don_gia)) {
                $don_gia = 0;
            }


            if (trim($ky_hieu) != "") {
                $mapper->insert(array(
                    'du_toan_id' => $duToanId,
                    'ky_hieu' => $ky_hieu,
                    'doi_tuong' => $doi_tuong,
                    'don_vi' => $don_vi,
                    'don_gia' => $don_gia,
                    'khoi_luong' => $khoi_luong,
                    'thanh_tien' => $thanh_tien,
                ));
            }

            $x ++;
        }
    }

    private function saveThietBiChiTiet($sheet, $thietBiId) {
        $mapper = new Default_Model_Thietbichitiet();

        $x = 6;
        while ($x <= $sheet['numRows']) {

            if (isset($sheet['cells'][$x][2])) {
                $ten_vttb = iconv(mb_detect_encoding($sheet['cells'][$x][2], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][2]);
                $don_vi = iconv(mb_detect_encoding($sheet['cells'][$x][4], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][4]);
                $don_gia = iconv(mb_detect_encoding($sheet['cells'][$x][6], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][6]);
                $so_luong = iconv(mb_detect_encoding($sheet['cells'][$x][5], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][5]);
                $thanh_tien = iconv(mb_detect_encoding($sheet['cells'][$x][7], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][7]);

                $thanh_tien = str_replace(",", "", $thanh_tien);
                $so_luong = str_replace(",", "", $so_luong);
                $don_gia = str_replace(",", "", $don_gia);
                if (!is_numeric($thanh_tien)) {
                    $thanh_tien = 0;
                }
                if (!is_numeric($so_luong)) {
                    $so_luong = 0;
                }
                if (!is_numeric($don_gia)) {
                    $don_gia = 0;
                }

                $dac_tinh_ky_thuat = iconv(mb_detect_encoding($sheet['cells'][$x][3], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][3]);
                for ($i = $x + 1; $i <= $sheet['numRows']; $i++) {
                    if (!isset($sheet['cells'][$i][2])) {
                        $dac_tinh_ky_thuat .= "\n" . iconv(mb_detect_encoding($sheet['cells'][$i][3], mb_detect_order(), true), "UTF-8", $sheet['cells'][$i][3]);
                    } else {
                        break;
                    }
                }


                if (trim($ten_vttb) != "") {
                    $mapper->insert(array(
                        'thiet_bi_id' => $thietBiId,
                        'ten_vttb' => $ten_vttb,
                        'dac_tinh_ky_thuat' => $dac_tinh_ky_thuat,
                        'don_vi' => $don_vi,
                        'don_gia' => $don_gia,
                        'so_luong' => $so_luong,
                        'thanh_tien' => $thanh_tien,
                    ));
                }
            }

            $x ++;
        }
    }

}
