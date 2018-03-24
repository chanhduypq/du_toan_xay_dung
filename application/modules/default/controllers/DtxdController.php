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
        $model = new Default_Model_Dutoanchitiet();
        $rows = $model->fetchAll();
        $this->view->items = $rows;
    }


}
