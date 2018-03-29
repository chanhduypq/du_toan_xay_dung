<?php

class ThongkeController extends Core_Controller_Action {

    public function init() {
        parent::init();
        $this->view->headTitle('Thống kê', true);
    }

    public function indexAction() {
        
        $tu_ngay_quyet_dinh = $this->_getParam('tu_ngay_quyet_dinh', '');
        if ($tu_ngay_quyet_dinh != "") {
            list($d, $m, $y) = explode("/", $tu_ngay_quyet_dinh);
            $tu_ngay_quyet_dinh = "$y-$m-$d";
        }

        $den_ngay_quyet_dinh = $this->_getParam('den_ngay_quyet_dinh', '');
        if ($den_ngay_quyet_dinh != "") {
            list($d, $m, $y) = explode("/", $den_ngay_quyet_dinh);
            $den_ngay_quyet_dinh = "$y-$m-$d";
        }
        
        $where='1=1';
        if($tu_ngay_quyet_dinh!=''){
            $where.=" and ngay_quyet_dinh >= '$tu_ngay_quyet_dinh'";
        }
        if($den_ngay_quyet_dinh!=''){
            $where.=" and ngay_quyet_dinh <= '$den_ngay_quyet_dinh'";
        }
        
        $sql = "select * from du_toan join user on user.id=du_toan.user_id where $where";
        $rows= Core_Db_Table::getDefaultAdapter()->fetchAll($sql);
        $this->view->items = $rows;
        $this->view->tu_ngay_quyet_dinh = $this->_getParam('tu_ngay_quyet_dinh', '');
        $this->view->den_ngay_quyet_dinh = $this->_getParam('den_ngay_quyet_dinh', '');
        
        if($this->_getParam('excel', '0')=='1'){
            $filename = "Webinfopen.xls"; // File Name
            // Download file
            header("Content-Disposition: attachment; filename=\"$filename\"");
            header("Content-Type: application/vnd.ms-excel");
//            header('Content-Type: text/html; charset=utf-8');
            $flag = false;
            $header=array(
                'Số quyết định',
                'Ngày tháng',
                'Nội dung dự toán',
                'Giá trị dự toán',
                'Người phụ trách',
            );
            foreach ($rows as $row){
                if (!$flag) {
                    // display field/column names as first row
                    echo implode("\t", $header) . "\r\n";
                    $flag = true;
                }
                $values['so_quyet_dinh'] = $row['so_quyet_dinh'];
                list($date, $time) = explode(" ", $row['ngay_quyet_dinh']);
                list($y, $m, $d) = explode("-", $date);
                $values['ngay_quyet_dinh'] = "$d/$m/$y";
                $values['noi_dung_quyet_dinh'] = $row['noi_dung_quyet_dinh'];
                $values['tong_tien'] = number_format($row['tong_tien'], 0, ",", ".");
                $values['nguoi_phu_trach'] = $row['danh_xung'] . ' ' . $row['full_name'];
                echo implode("\t", array_values($values)) . "\r\n";
            }
            exit;
        }
    }
    public function resultAction() {
        $tu_ngay_quyet_dinh = $this->_getParam('tu_ngay_quyet_dinh', '');
        if ($tu_ngay_quyet_dinh != "") {
            list($d, $m, $y) = explode("/", $tu_ngay_quyet_dinh);
            $tu_ngay_quyet_dinh = "$y-$m-$d";
        }

        $den_ngay_quyet_dinh = $this->_getParam('den_ngay_quyet_dinh', '');
        if ($den_ngay_quyet_dinh != "") {
            list($d, $m, $y) = explode("/", $den_ngay_quyet_dinh);
            $den_ngay_quyet_dinh = "$y-$m-$d";
        }
        
        $where='1=1';
        if($tu_ngay_quyet_dinh!=''){
            $where.=" and ngay_quyet_dinh >= '$tu_ngay_quyet_dinh'";
        }
        if($den_ngay_quyet_dinh!=''){
            $where.=" and ngay_quyet_din <= '$den_ngay_quyet_dinh'";
        }
        
        $sql = "select * from du_toan join user on user.id=du_toan.user_id";
        $rows= Core_Db_Table::getDefaultAdapter()->fetchAll($sql);
        $this->view->items = $rows;
        $this->view->tu_ngay_quyet_dinh = $this->_getParam('tu_ngay_quyet_dinh', '');
        $this->view->den_ngay_quyet_dinh = $this->_getParam('den_ngay_quyet_dinh', '');
    }


}
