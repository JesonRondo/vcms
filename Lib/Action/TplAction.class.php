<?php
class TplAction extends Action {
    private $codes;

    function _initialize() {
        import('@.Util.Util');
        import('@.Helper.TplHelper');

        $this->codes = C('codes');
    }

    public function getFiles() {
        $files = TplHelper::getFiles();
        $this->ajaxReturn($files, $this->codes[0], 0);
    }

    public function getFile() {
        $data = $_REQUEST;
        $needed_params = array('filename');

        if (!Util::check_params($data, $needed_params)) {
            $code = 10001;
            $this->ajaxReturn(null, $this->codes[$code], $code);
        }

        $con = TplHelper::getFile($data['filename']);
        $this->ajaxReturn($con, $this->codes[0], 0);
    }

    public function makeFile() {
        $data = $_REQUEST;
        $needed_params = array('filename');

        if (!Util::check_params($data, $needed_params)) {
            $code = 10001;
            $this->ajaxReturn(null, $this->codes[$code], $code);
        }

        $code = TplHelper::makeFile($data['filename']);
        $this->ajaxReturn(null, $this->codes[$code], $code);
    }

    public function delFile() {
        $data = $_REQUEST;
        $needed_params = array('filename');

        if (!Util::check_params($data, $needed_params)) {
            $code = 10001;
            $this->ajaxReturn(null, $this->codes[$code], $code);
        }

        $code = TplHelper::delFile($data['filename']);
        $this->ajaxReturn(null, $this->codes[$code], $code);
    }

    public function editFile() {
        $data = $_REQUEST;
        $needed_params = array('filename', 'content');

        if (!Util::check_params($data, $needed_params)) {
            $code = 10001;
            $this->ajaxReturn(null, $this->codes[$code], $code);
        }

        $code = TplHelper::editFile($data['filename'], $data['content']);
        $this->ajaxReturn(null, $this->codes[$code], $code);
    }
}