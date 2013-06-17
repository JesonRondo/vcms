<?php
class VAction extends Action {
    private $codes;

    function _initialize() {
        import('@.Util.Util');
        import('@.Helper.VHelper');

        $this->codes = C('codes');
    }

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

    public function add_info() {
        $data = $_REQUEST;
        $needed_params = array('did');

        if (!Util::check_params($data, $needed_params)) {
            $ret_code = 10001;
            $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
        }

        $code = VHelper::add_info($data);
        $this->ajaxReturn(null, $this->codes[$code], $code);
    }

    public function del_info() {
        $data = $_REQUEST;
        $needed_params = array('vid');

        if (!Util::check_params($data, $needed_params)) {
            $ret_code = 10001;
            $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
        }

        $code = VHelper::del_info($data['vid']);
        $this->ajaxReturn(null, $this->codes[$code], $code);
    }

    public function edit_info() {
        $data = $_REQUEST;
        $needed_params = array('vid');

        if (!Util::check_params($data, $needed_params)) {
            $ret_code = 10001;
            $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
        }

        $code = VHelper::edit_info($data);
        $this->ajaxReturn(null, $this->codes[$code], $code);
    }

    public function get_sinfo() {
        $data = $_REQUEST;
        $needed_params = array('vid');

        if (!Util::check_params($data, $needed_params)) {
            $ret_code = 10001;
            $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
        }

        $data = VHelper::get_sinfo($data['vid']);

        if (gettype($data) === 'integer') { // error code
            $code = $data;
            $this->ajaxReturn(null, $this->codes[$code], $code);
        }

        $this->ajaxReturn($data, $this->codes[0], 0);
    }

    public function exchange_info() {
        $data = $_REQUEST;
        $needed_params = array('vid1', 'vid2');

        if (!Util::check_params($data, $needed_params)) {
            $ret_code = 10001;
            $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
        }

        $code = VHelper::exchange_info($data['vid1'], $data['vid2']);
        $this->ajaxReturn(null, $this->codes[$code], $code);
    }
}
