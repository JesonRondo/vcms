<?php
class BaseAction extends Action {
    function _initialize() {
        session_start();
        import('@.Helper.UserHelper');

        if (isset($_SESSION['username'])) { // logined
            $username = $_SESSION['username'];
            $user = array(
                'username'  => $username,
                'avatar'    => UserHelper::getAvatar($username, 20)
            );
            $this->assign('user', $user);
        } else { // unlogin
            $login_page = C('login_page');
            header("Location: $login_page");
        }
    }
}