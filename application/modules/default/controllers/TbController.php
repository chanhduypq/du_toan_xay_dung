<?php

class TbController extends Core_Controller_Action {

    public function init() {
        parent::init();
    }

    public function indexAction() {
        if(is_numeric($this->_getParam('thiet_bi_id'))){
            $row=Core_Db_Table::getDefaultAdapter()->fetchRow("select file_name from thiet_bi where id='".$this->_getParam('thiet_bi_id')."'");
            $file_name=$row['file_name'];
            $this->download("upload_excel",$file_name);
        }
        $model = new Default_Model_Thietbichitiet();
        $rows = $model->fetchAll();
        $this->view->items = $rows;
    }


}
