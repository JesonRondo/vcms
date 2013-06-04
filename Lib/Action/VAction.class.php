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

        if (isset($data['type'])) {
            $data = VHelper::get_info($data['id'], $data['type']);
        } else {
            $data = VHelper::get_info($data['id']);
        }

        if (gettype($data) === 'integer') { // error code
            $code = $data;
            $this->ajaxReturn(null, $this->codes[$code], $code);
        }

        $this->ajaxReturn($data, $this->codes[0], 0);
    }

    public function edit_alias() {
        $data = $_REQUEST;
        $needed_params = array('id', 'len',
           'field1',  'field2',  'field3',  'field4',  'field5',
           'field6',  'field7',  'field8',  'field9',  'field10',
           'field11', 'field12', 'field13', 'field14', 'field15',
           'field16', 'field17', 'field18', 'field19', 'field20',
           'field21', 'field22', 'field23', 'field24', 'field25',
           'field26', 'field27', 'field28', 'field29', 'field30');

        if (!Util::check_params($data, $needed_params)) {
            $ret_code = 10001;
            $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
        }

        $code = VHelper::edit_alias($data);
        $this->ajaxReturn($data, $this->codes[$code], $code);
    }
}
