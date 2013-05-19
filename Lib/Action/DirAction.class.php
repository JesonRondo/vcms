<?php
class DirAction extends Action {
    function _initialize() {
        import('@.Helper.DirHelper');
    }

    private $codes = array(
        0 => 'ok',
        10000 => 'unknow error',
        10001 => 'error params',
        10002 => 'parent not exist',
        10003 => 'db control error',
        10004 => 'this node not exist',
    );

    public function add() {
        $data = $_REQUEST;
        $data['name'] = htmlspecialchars($data['name']);
        $data['name_alias'] = htmlspecialchars($data['name_alias']);
        $needed_params = array('name', 'name_alias', 'parent');

        if (!DirHelper::check_params($data, $needed_params)) {
            $ret_code = 10001;
            $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
        }

        $data['children'] = '';

        $ret_code = DirHelper::add_dir_info($data);

        if (!isset($this->codes[$ret_code])) $ret_code = 10000;

        $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
    }

    public function get() {
        import('@.Util.Util');
        
        if (!isset($_REQUEST['did'])) {
            // fetch all
            $origin_info = DirHelper::get_dir_info();
            $origin_info = Util::pushNodeToTree($origin_info);

            $this->ajaxReturn($origin_info, $this->codes[0], 0);
        } else {
            // fetch did
            $id = htmlspecialchars($_REQUEST['did']);
            $info = DirHelper::get_dir_info($id);
            
            if ($info) {
                $this->ajaxReturn($info[0], $this->codes[0], 0);
            } else {
                $this->ajaxReturn(null, $this->codes[10004], 10004);
            }
        }
    }

    public function del() {
        $data = $_REQUEST;
        $data['dids'] = htmlspecialchars($data['dids']);
        $needed_params = array('dids');

        if (!DirHelper::check_params($data, $needed_params)) {
            $ret_code = 10001;
            $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
        }

        $ret_code = DirHelper::del_dir_info($data['dids']);

        if (!isset($this->codes[$ret_code])) $ret_code = 10000;

        $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
    }

    public function edit() {
        $data = $_REQUEST;
        $data['name'] = htmlspecialchars($data['name']);
        $data['name_alias'] = htmlspecialchars($data['name_alias']);
        unset($data['parent']);
        $needed_params = array('did', 'name', 'name_alias');

        if (!DirHelper::check_params($data, $needed_params)) {
            $ret_code = 10001;
            $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
        }

        $ret_code = DirHelper::edit_dir_info($data);

        if (!isset($this->codes[$ret_code])) $ret_code = 10000;

        $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
    }
}
