<?php
class UploadHelper {
	public static function uploadFile($filename, $destination) {
		if (move_uploaded_file($filename, $destination)) {
            return 0;
        } else {
            return 10009;
        }
	}

	public static function getFiles() {
		$handler = opendir(C('upload_folder'));
        while (($filename = readdir($handler)) !== false) {
            if ($filename !== '.' && $filename !== '..') {
                $files[] = C('preview_index') . $filename; 
            }
        }
        closedir($handler);
        rsort($files);
        return $files === null ? array() : $files;
    }

    public static function delFile($filename) {
    	$file = C('upload_folder') . $filename;

        if (!file_exists($file))
            return 10007;

        try {
            $flag = unlink($file);
        } catch(Exception $e) {
            return 10008;
        }
        return $flag ? 0 : 10008;
    }
}
?>
