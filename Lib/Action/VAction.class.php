<?php
class VAction extends Action {
    function _initialize() {
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
        $data = VHelper::get_info('7');

        if (gettype($data) === 'integer') { // error code
            $code = $data;
            $this->ajaxReturn(null, $this->codes[$code], $code);
        }

        $this->ajaxReturn($data, $this->codes[0], 0);
    }
}
