<?php
class DeployAction extends Action {
    private $codes;

    function _initialize() {
        import('@.Helper.TplHelper');

        $this->codes = C('codes');
    }

    function index() {
        $files = TplHelper::getFiles();
        foreach ($files as $k => $v) {
            $tpl_paths[] = C('tpl_folder') . $v;
            $dep_paths[] = C('deploy_folder') . $v;
        }

        for ($i = 0, $len = count($tpl_paths); $i < $len; $i++) {
            $output[] = $this->publish2static($tpl_paths[$i], $dep_paths[$i]);
        }

        dump($output);
    }

    function publish2static($tpl_path, $dep_path) {
        $content = $this->fetch($tpl_path);
        $st = file_put_contents($dep_path, $content);

        return array(
            'tpl_path' => $tpl_path,
            'dep_path' => $dep_path,
            'st' => $st,
        );
    }
}
?>
