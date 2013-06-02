<?php
class VAction extends Action {
    function _initialize() {
        import('@.Util.Util');
        import('@.Helper.VHelper');
    }

    private $codes = array(
        0 => 'ok',
        10000 => 'unknow error',
        10001 => 'error params',
        10002 => 'parent not exist',
        10003 => 'db control error',
        10004 => 'this node not exist',
    );

    public function get_info() {
        $data = $_REQUEST;
        $needed_params = array('id');

        if (!Util::check_params($data, $needed_params)) {
            $ret_code = 10001;
            $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
        }

        $data = VHelper::get_info($data['id']);

        if (gettype($data) === 'integer') { // error code
            $code = $data;
            $this->ajaxReturn(null, $this->codes[$code], $code);
        }

        $this->ajaxReturn($data, $this->codes[0], 0);
    }
}
