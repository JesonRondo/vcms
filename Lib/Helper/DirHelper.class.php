<?php
class DirHelper {
    public static function check_params($data, $params_key) {
        foreach($params_key as $k => $v) {
            if (!isset($data[$v])) return false;
        }
        return true;
    }

    public static function add_dir_info($data) {
        $m = M('dir_info');

        $parent_filter['did'] = $data['parent'];
        $top_ret = $m->where($parent_filter)->select();

        // check parent
        if (!$top_ret) return 10002;
        $top_ret = $top_ret[0];

        // insert new record
        $id = $m->data($data)->add();
        if (!$id) return 10003;
        
        // updata parent's children
        if ($top_ret['children'] !== '') {
            $parent_s_children = split(',', $top_ret['children']);
        } else {
            $parent_s_children = array();
        }
        array_push($parent_s_children, $id);
        $update_children['children'] = join(',', $parent_s_children);
        $update_ret = $m->where($parent_filter)->data($update_children)->save();

        if (!$update_ret) return 10003;

        return 0;
    }
}
?>