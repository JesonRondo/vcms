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
        $this->assign('infos', VHelper::get_all_infos());

        foreach ($files as $k => $v) {
            if (strpos($v, '~') === 0) { // article
                $vpath = substr($v, 1);
                $tpl_paths[$k] = C('tpl_folder') . $v;
                $dep_paths[$k] = C('deploy_folder') . $vpath;

                $tpl_content = file_get_contents($tpl_paths[$k]);
                preg_match('/-{5}([^-]*)-{5}/', $tpl_content, $matches);
                if ($matches[1]) {
                    parse_str(trim($matches[1]), $tpl_param);
                    $tpl_dids = explode(',', $tpl_param['did']);

                    for ($i = 0, $len = count($tpl_dids); $i < $len; $i++) {
                        $articles = VHelper::get_articles($tpl_dids[$i]);
                        $articles = $articles['rows'];

                        for ($j = 0, $l = count($articles); $j < $l; $j++) {
                            $article = $articles[$j];
                            $this->assign('article', $article);
                            // default
                            // $output[] = $this->publish2static($tpl_paths[$k], $dep_paths[$k] . $article['vid'] . '.html');
                            // custom
                            $output[] = $this->publish2static($tpl_paths[$k], $dep_paths[$k] . $article['extra1'] . '.html');
                        }

                    }
                }
            } else if (strpos($v, '+') === 0) { // multipage
                $vpath = substr($v, 1);
                $tpl_paths[$k] = C('tpl_folder') . $v;
                $dep_paths[$k] = C('deploy_folder') . $vpath;

                $tpl_content = file_get_contents($tpl_paths[$k]);
                preg_match('/-{5}([^-]*)-{5}/', $tpl_content, $matches);
                if ($matches[1]) {
                    $tpl_params = explode('
', $matches[1]);
                    $tpl_param = array();
                    for ($i = 0, $len = count($tpl_params); $i < $len; $i++) {
                        if ($tpl_params[$i] === '') continue;
                        parse_str($tpl_params[$i], $temp_tpl_param);
                        $tpl_param = array_merge_recursive($tpl_param, $temp_tpl_param);
                    }
                    $tpl_dids = explode(',', $tpl_param['did']);
                    $per_page_len = (int)$tpl_param['per_page_len'];

                    for ($i = 0, $len = count($tpl_dids); $i < $len; $i++) {
                        $articles = VHelper::get_articles($tpl_dids[$i]);
                        $articles = $articles['rows'];

                        $this->assign('did', $tpl_dids[$i]);
                        $this->assign('articles', $articles);
                        $this->assign('per_page_len', $per_page_len);

                        for ($n = 0, $current_page = 0, $nlen = count($articles); $n < $nlen; $n += $per_page_len) {
                            $current_page++;
                            $this->assign('offset', $n);
                            $this->assign('current_page', $current_page);
                            $this->assign('total_page', ceil($nlen / $per_page_len));
                            $output[] = $this->publish2static($tpl_paths[$k], "{$dep_paths[$k]}{$tpl_dids[$i]}_{$current_page}.html");
                        }
                    }
                }
            } else { // page
                $tpl_paths[$k] = C('tpl_folder') . $v;
                $dep_paths[$k] = C('deploy_folder') . $v;

                $output[] = $this->publish2static($tpl_paths[$k], $dep_paths[$k]);
            }
        }

        $this->ajaxReturn($output, $this->codes[0], 0);
    }

    function publish2static($tpl_path, $dep_path) {
        $content = $this->fetch($tpl_path);
        $content = str_replace('<?zphp', '<?php', $content);
        $content = preg_replace('/-{5}([^-]*)-{5}\n/', '', $content);
        $dep_path = str_replace('$', '/', $dep_path);

        $dep_file_folder = substr($dep_path, 0, strripos($dep_path, '/') + 1);
        if (!is_dir($dep_file_folder)) {
            mkdir($dep_file_folder, 0777, true);
        }

        $st = file_put_contents($dep_path, $content) ? true : false;

        return array(
            'tpl_path' => $tpl_path,
            'dep_path' => $dep_path,
            'dep_file_folder' => $dep_file_folder,
            'st' => $st,
        );
    }

    function runsh() {
        $shell = C('APP_ROOT') . 'Shell/do.sh';
        $log = C('LOG_ROOT') . 'vcms_deploy.log';
        $cmd = "/bin/sh {$shell} >> {$log} 2>&1 &";
        exec($cmd);
        
        $this->ajaxReturn($cmd, $this->codes[0], 0);
    }
}
?>
