<?php

class DtxdController extends Core_Controller_Action {

    public function init() {
        parent::init();
    }

    public function indexAction() {
        if(is_numeric($this->_getParam('du_toan_id'))){
            $row=Core_Db_Table::getDefaultAdapter()->fetchRow("select file_name from du_toan where id='".$this->_getParam('du_toan_id')."'");
            $file_name=$row['file_name'];
            $this->download("upload_excel",$file_name);
        }
        
        $keyword = $this->_getParam('keyword', '');
        $keyword = trim($keyword);
        $type = $this->_getParam('type', 'doi_tuong');
        if ($keyword != '') {
            $where = "where $type like '%$keyword%'";
            if ($type == 'don_gia') {
                if (is_numeric(str_replace(".", "", $keyword))) {
                    $where = "where $type ='".str_replace(".", "", $keyword)."'";
                } else {
                    $where = '1=0';
                }
            }
        } else {
            $where = '';
        }
        $sql = "select * from du_toan join du_toan_chi_tiet on du_toan_chi_tiet.du_toan_id=du_toan.id $where";
        $rows = Core_Db_Table::getDefaultAdapter()->fetchAll($sql);

        $this->view->items = $rows;
        $this->view->keyword = $keyword;
        $this->view->type = $type;
    }


}
