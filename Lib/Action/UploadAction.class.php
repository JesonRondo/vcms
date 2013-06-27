<?php
class UploadAction extends Action {
    private $codes;

    function _initialize() {
        import('@.Util.Util');
        import('@.Helper.UploadHelper');

        $this->codes = C('codes');
    }

    /**
     * upload function
     */
    public function index() {
        $filename = basename($_FILES['userfile']['name']);
        $type = substr($filename, strrpos($filename, '.'));

        $uploadfile = date('YmdHis') . rand(1000, 9999) . $type;
        $uploadfolder = C('upload_folder');
        $path = $uploadfolder . $uploadfile;
        $src = C('preview_index') . $uploadfile;

        if (!is_dir($uploadfolder)) {
            mkdir($uploadfolder, 0777, true);
        }

        $code = UploadHelper::uploadFile($_FILES['userfile']['tmp_name'], $path);
        $this->ajaxReturn(null, $this->codes[$code], $code);
    }

    /**
     * get files on server
     */
    public function get() {
        $files = UploadHelper::getFiles();
        $this->ajaxReturn($files, $this->codes[0], 0);
    }

    /**
     * del file on server
     */
    public function del() {
        $data = $_REQUEST;
        $needed_params = array('filename');

        if (!Util::check_params($data, $needed_params)) {
            $code = 10001;
            $this->ajaxReturn(null, $this->codes[$code], $code);
        }

        $code = UploadHelper::delFile($data['filename']);
        $this->ajaxReturn($files, $this->codes[0], 0);
    }
}
?>