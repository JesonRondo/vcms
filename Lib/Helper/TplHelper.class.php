<?php
class TplHelper {
    public static function getFiles() {
        $handler = opendir(C('tpl_folder'));
        while (($filename = readdir($handler)) !== false) {
            if ($filename !== '.' && $filename !== '..') {
                $files[] = $filename ; 
            }
        }
        closedir($handler);
        return $files === null ? array() : $files;
    }

    public static function getFile($filename) {
        $realname = C('tpl_folder') . $filename;
        if (!file_exists($realname))
            return '';

        $file_handle = fopen($realname, 'r');
        while (!feof($file_handle)) {
           $line[] = fgets($file_handle);
        }
        fclose($file_handle);
        return join('', $line);
    }

    public static function makeFile($filename) {
        $realname = C('tpl_folder') . $filename;

        if (file_exists($realname))
            return 10006;

        try {
            $fp = fopen($realname, 'w+');
            $str = '';
            fputs($fp, $str);
            fclose($fp);
        } catch(Exception $e) {
            return 10008;
        }
        return 0;
    }

    public static function delFile($filename) {
        $realname = C('tpl_folder') . $filename;

        if (!file_exists($realname))
            return 10007;

        try {
            $flag = unlink($realname);
        } catch(Exception $e) {
            return 10008;
        }
        return $flag ? 0 : 10008;
    }

    public static function editFile($filename, $filecontent) {
        $realname = C('tpl_folder') . $filename;

        try {
            $fp = fopen($realname, 'w+');
            $str = $filecontent;
            fputs($fp, $str);
            fclose($fp);
        } catch(Exception $e) {
            return 10008;
        }
        return 0;
    }
}