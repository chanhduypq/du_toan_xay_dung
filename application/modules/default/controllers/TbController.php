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
        $keyword = $this->_getParam('keyword', '');
        $keyword = trim($keyword);
        $type = $this->_getParam('type', 'dac_tinh_ky_thuat');
        $model = new Default_Model_Thietbichitiet();
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
