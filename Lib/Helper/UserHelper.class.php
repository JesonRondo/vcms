<?php
class UserHelper {
    public static function isAccess($pp, $pwd) {
        $data = array(
            'username' => $pp,
            'password' => $pwd
        );
        $ret = M('user')->where($data)->select();
        return $ret ? true : false;
    }

    public static function getAvatar($username, $size = 150) {
    	$default_avatar = '/themes/metro/images/avatar.jpg';
        if ($username) {
            $avatar = 'http://www.gravatar.com/avatar/' . md5(strtolower(trim($username))) . '?d=' . urlencode($default_avatar) . '&s=' . $size;
        } else {
            $avatar = $default_avatar;
        }
        return $avatar;
    }

    public static function changePwd($username, $oldpwd, $newpwd) {
        $filter = array(
            'username' => $username,
            'password' => $oldpwd
        );
        $data = array(
            'password' => $newpwd
        );

        $m = M('user');

        $ret = $m->where($filter)->select();

        if (!$ret) {
            return 10100;
        } else {
            unset($filter['password']);
            $m->where($filter)->data($data)->save();
            return 0;
        }
    }
}