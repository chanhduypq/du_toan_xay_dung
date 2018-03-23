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
                $item = 'data_'.$time.'.' . $extension;
                $path = UPLOAD . "/public/upload_excel/" . $item;
                move_uploaded_file($_FILES['excel']['tmp_name'], $path);

                
                $mapper=new Default_Model_Dutoan();
                $duToanId=$mapper->insert(array('file_name'=>$item));
                
                $this->importExcel('upload_excel/' . $item,$duToanId);
                @unlink($path);
            }
            Core::message()->addSuccess('Lưu thành công');
        }

        $this->_helper->redirector('index', 'excel', 'default');
    }

    private function importExcel($file_name,$duToanId) {

        $excel = new Zend_Excel();
        $excel->setOutputEncoding('UTF-8');
        $excel->read($file_name);

        $this->saveDuToanChiTiet($excel->sheets[0], $duToanId);

    }

    private function saveDuToanChiTiet($sheet, $duToanId) {
        $mapper = new Default_Model_Dutoanchitiet();
        
        $x = 7;
        while ($x <= $sheet['numRows']) {

            $ky_hieu=iconv(mb_detect_encoding($sheet['cells'][$x][2], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][2]);
            $doi_tuong=iconv(mb_detect_encoding($sheet['cells'][$x][3], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][3]);
            $don_vi=iconv(mb_detect_encoding($sheet['cells'][$x][4], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][4]);
            $don_gia=iconv(mb_detect_encoding($sheet['cells'][$x][5], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][5]);
            $khoi_luong=iconv(mb_detect_encoding($sheet['cells'][$x][6], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][6]);
            $thanh_tien=iconv(mb_detect_encoding($sheet['cells'][$x][7], mb_detect_order(), true), "UTF-8", $sheet['cells'][$x][7]);
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

}
