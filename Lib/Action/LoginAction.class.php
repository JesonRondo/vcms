<?php
class LoginAction extends Action {
    private $codes;

    function _initialize() {
        session_start();
        import('@.Util.Util');
        import('@.Helper.UserHelper');

        $this->codes = C('codes');
    }

    function index() {
        if (isset($_SESSION['username'])) { // logined
            $index_page = C('index_page');
            header("Location: $index_page");
            return;
        }

        $ls_username = cookie('ls_username');
        $ls_username = $ls_username ? $ls_username : '';

        $ls_avatar = UserHelper::getAvatar($ls_username);
        
        $this->assign('ls_username', $ls_username);
        $this->assign('ls_avatar', $ls_avatar);

        if (count($_POST) === 0) { // init login
            $this->display();
            return;
        }

        // ckeck login
        $pp = $_POST['pp'];
        $pwd = md5($_POST['pwd']);

        if ($pp === '' || $pwd === '') {
            $this->assign('error', 'UserName or PassWord Empty!');
        } else if (UserHelper::isAccess($pp, $pwd)) {
            cookie('ls_username', $pp, 365 * 24 * 60 * 60);
            
            $_SESSION['username'] = $pp;
            $index_page = C('index_page');
            header("Location: $index_page");
            return;
        } else {
            $this->assign('error', 'UserName or PassWord Error!');
        }
        $this->display();
    }

    function logout() {
        unset($_SESSION['username']);
        $login_page = C('login_page');
        header("Location: $login_page");
    }

    function chpwd() {
        if (isset($_SESSION['username'])) {
            $username = $_SESSION['username'];
            $data = $_REQUEST;

            $needed_params = array('opwd', 'npwd');

            if (!Util::check_params($data, $needed_params)) {
                $ret_code = 10001;
                $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
            }

            $ret_code = UserHelper::changePwd($username, md5($data['opwd']), md5($data['npwd']));
            $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
        } else {
            $ret_code = 10101;
            $this->ajaxReturn(null, $this->codes[$ret_code], $ret_code);
        }
    }
}