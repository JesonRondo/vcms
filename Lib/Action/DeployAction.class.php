<?php
class DeployAction extends Action {
    private $codes;

    function _initialize() {
        import('@.Helper.TplHelper');
        import('@.Helper.VHelper');

        $this->codes = C('codes');
    }

    function index() {
        $files = TplHelper::getFiles();
        foreach ($files as $k => $v) {
            $tpl_paths[] = C('tpl_folder') . $v;
            $dep_paths[] = C('deploy_folder') . $v;
        }

        $this->assign('infos', VHelper::get_all_infos());

        for ($i = 0, $len = count($tpl_paths); $i < $len; $i++) {
            $output[] = $this->publish2static($tpl_paths[$i], $dep_paths[$i]);
        }

        $this->ajaxReturn($output, $this->codes[0], 0);
    }

    function publish2static($tpl_path, $dep_path) {
        $content = $this->fetch($tpl_path);
        $dep_path = str_replace('$', '/', $dep_path);

        $dep_file_folder = substr($dep_path, 0, strripos($dep_path, '/') + 1);
        if (!is_dir($dep_file_folder)) {
            mkdir($dep_file_folder, 0777);
        }

        $st = file_put_contents($dep_path, $content) ? true : false;

        return array(
            'tpl_path' => $tpl_path,
            'dep_path' => $dep_path,
            'dep_file_folder'=> $dep_file_folder,
            'st' => $st,
        );
    }
}
?>
