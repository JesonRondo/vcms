<?php
return array(
    // codes
    'codes' => array(
    	0 => 'ok',
        10000 => 'unknow error',
        10001 => 'error params',
        10002 => 'parent not exist',
        10003 => 'db control error',
        10004 => 'this node not exist',
        10005 => 'this record not exist',
        10006 => 'file exist',
        10007 => 'file not exist',
        10008 => 'file control failed',
        10009 => 'upload file failed',
        10100 => 'user or password error',
        10101 => 'unlogin',
    ),

    // template folder
    'tpl_folder' => APP_PATH . 'Templates/',

    // deploy folder
    'deploy_folder' => APP_PATH . 'Public/' . 'vicbeta/',

    // upload folder
    'upload_folder' => APP_PATH . 'Public/' . 'vicbeta/upload/',
    'preview_index' => '/vicbeta/upload/',
    'upload_www' => 'http://vicbeta.com/upload/',

    // page
    'index_page' => 'http://zombie.com',
    'login_page' => 'http://zombie.com/login',
);
?>