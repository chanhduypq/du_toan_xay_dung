<?php

class TbController extends Core_Controller_Action {

    public function init() {
        parent::init();
        $this->view->headTitle('Mẫu thiết bị', true);
    }

    public function indexAction() {
        if(is_numeric($this->_getParam('thiet_bi_id'))){
            $row=Core_Db_Table::getDefaultAdapter()->fetchRow("select path from thiet_bi where id='".$this->_getParam('thiet_bi_id')."'");
            $path = $row['path'];
            $this->download("uploads/" . $path,$this->_getParam('file_name'));
        }
        $keyword = $this->_getParam('keyword', '');
        $keyword = trim($keyword);
        $type = $this->_getParam('type', 'dac_tinh_ky_thuat');
        if ($keyword != '') {
            $where = "where $type like '%$keyword%'";
            if ($type == 'don_gia') {
                if (is_numeric(str_replace(".", "", $keyword))) {
                    $where = "where $type ='".str_replace(".", "", $keyword)."'";
                } else {
                    $where = 'where 1=0';
                }
            }
        } else {
            $where = '';
        }
        $sql = "select * from thiet_bi join thiet_bi_chi_tiet on thiet_bi_chi_tiet.thiet_bi_id=thiet_bi.id $where";
        $rows = Core_Db_Table::getDefaultAdapter()->fetchAll($sql);
        $this->view->items = $rows;
        $this->view->keyword = $keyword;
        $this->view->type = $type;
    }


}
