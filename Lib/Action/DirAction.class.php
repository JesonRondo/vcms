<?php
class DirAction extends Action {
    function _initialize() {
        import('@.Helper.DirHelper');
    }

    private $codes = array(
        0 => 'ok',
        10001 => 'error params',
        10002 => 'parent not exist',
        10003 => 'db control error',
    );

    public function add() {
        $data = $_REQUEST;
        $needed_params = ['name', 'name_alias', 'parent'];

        if (!DirHelper::check_params($data, $needed_params)) {
            $ret_code = 10001;
            $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
        }

        $data['children'] = '';

        $ret_code = DirHelper::add_dir_info($data);

        if (isset($this->codes[$ret_code])) {   // error code
            $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
        }

        $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
    }

    public function get() {
        import('@.Util.Util');

        $origin_info = DirHelper::get_dir_info();
        $origin_info = Util::pushNodeToTree($origin_info);

        $this->ajaxReturn($origin_info, $this->codes[0], 0);
    }
}