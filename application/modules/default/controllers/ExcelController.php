<?php

class ExcelController extends Core_Controller_Action {

    public function init() {
        parent::init();
    }

    public function indexAction() {
        $this->view->message = $this->getMessage();
    }

    public function saveAction() {
        $time= strtotime(date('Y-m-d H:i:s'));
        if (isset($_FILES['excel']) && isset($_FILES['excel']['name']) && $_FILES['excel']['name'] != '') {

            $item = $_FILES['excel']['name'];
            if (isset($item) && $item != "") {
                $extension = @explode(".", $item);
                $extension = $extension[count($extension) - 1];
                
                $item = $this->_getParam('type').'_'.$time.'.' . $extension;
                $path = UPLOAD . "/public/upload_excel/" . $item;
                move_uploaded_file($_FILES['excel']['tmp_name'], $path);
                if ($this->_getParam('type') == 'dtxd') {
                    $mapper = new Default_Model_Dutoan();
                    $duToanId=$mapper->insert(array('file_name'=>$item,'quyet_dinh'=> $this->_getParam('quyet_dinh', '')));
                    $this->importExcelForDtxd('upload_excel/' . $item,$duToanId);
                } else {
                    $mapper = new Default_Model_Thietbi();
                    $thietBiId=$mapper->insert(array('file_name'=>$item,'quyet_dinh'=> $this->_getParam('quyet_dinh', '')));
                    $this->importExcelForThietBi('upload_excel/' . $item,$thietBiId);
                }
            }
            Core::message()->addSuccess('Lưu thành công');
        }

        $this->_helper->redirector('index', 'excel', 'default');
    }

    private function importExcelForDtxd($file_name,$duToanId) {

        $excel = new Zend_Excel();
        $excel->setOutputEncoding('UTF-8');
        $excel->read($file_name);
        
//        $cellValue = $excel->sheets[0]['cells'];//[7][7]->getCalculatedValue();
//        echo '<pre>';
//        var_dump($cellValue);
//        echo '</pre>';
//        exit;

        $this->saveDuToanChiTiet($excel->sheets[0], $duToanId);

    }
    
    private function importExcelForThietBi($file_name,$thietBiId) {

        $excel = new Zend_Excel();
        $excel->setOutputEncoding('UTF-8');
        $excel->read($file_name);

        $this->saveThietBiChiTiet($excel->sheets[0], $thietBiId);

    }

    private function saveDuToanChiTiet($sheet, $duToanId) {
        $mapper = new Default_Model_Dutoanchitiet();
        
        $x = 7;
        while ($x <= $sheet['numRows']) {
            if(!isset($sheet['cells'][$x])){
                $x++;
                continue;
            }
            $ky_hieu=iconv(mb_detect_encoding($sheet['cells'][$x][2], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][2]);
            $doi_tuong=iconv(mb_detect_encoding($sheet['cells'][$x][3], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][3]);
            $don_vi=iconv(mb_detect_encoding($sheet['cells'][$x][4], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][4]);
            $don_gia=iconv(mb_detect_encoding($sheet['cells'][$x][10], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][10]);
            $khoi_luong=iconv(mb_detect_encoding($sheet['cells'][$x][9], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][9]);
            $thanh_tien=iconv(mb_detect_encoding($sheet['cells'][$x][11], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][11]);
            $thanh_tien= str_replace(",", "", $thanh_tien);
            $khoi_luong= str_replace(",", "", $khoi_luong);
            $don_gia= str_replace(",", "", $don_gia);
            if(!is_numeric($thanh_tien)){
                $thanh_tien=0;
            }
            if(!is_numeric($khoi_luong)){
                $khoi_luong=0;
            }
            if(!is_numeric($don_gia)){
                $don_gia=0;
            }
            

            if(trim($ky_hieu)!=""){
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

            if(isset($sheet['cells'][$x][2])){
                $ten_vttb=iconv(mb_detect_encoding($sheet['cells'][$x][2], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][2]);
                $don_vi=iconv(mb_detect_encoding($sheet['cells'][$x][4], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][4]);
                $don_gia=iconv(mb_detect_encoding($sheet['cells'][$x][6], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][6]);
                $so_luong=iconv(mb_detect_encoding($sheet['cells'][$x][5], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][5]);
                $thanh_tien=iconv(mb_detect_encoding($sheet['cells'][$x][7], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][7]);

                $thanh_tien= str_replace(",", "", $thanh_tien);
                $so_luong= str_replace(",", "", $so_luong);
                $don_gia= str_replace(",", "", $don_gia);
                if(!is_numeric($thanh_tien)){
                    $thanh_tien=0;
                }
                if(!is_numeric($so_luong)){
                    $so_luong=0;
                }
                if(!is_numeric($don_gia)){
                    $don_gia=0;
                }
                
                $dac_tinh_ky_thuat=iconv(mb_detect_encoding($sheet['cells'][$x][3], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][3]);
                for($i=$x+1;$i<=$sheet['numRows'];$i++){
                    if(!isset($sheet['cells'][$i][2])){
                        $dac_tinh_ky_thuat.="\n".iconv(mb_detect_encoding($sheet['cells'][$i][3], mb_detect_order(), true), "UTF-8", $sheet['cells'][$i][3]);
                    }
                    else{
                        break;
                    }
                }


                if(trim($ten_vttb)!=""){
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
