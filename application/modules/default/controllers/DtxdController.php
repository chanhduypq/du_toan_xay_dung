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
        $model = new Default_Model_Dutoanchitiet();
        if ($keyword != '') {
            $where = "$type like '%$keyword%'";
            $rows = $model->fetchAll($where);
        } else {
            $where = '';
            $rows = $model->fetchAll();
        }
        
        $this->view->items = $rows;
        $this->view->keyword = $keyword;
        $this->view->type = $type;
    }


}
