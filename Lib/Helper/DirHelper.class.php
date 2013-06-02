<?php
class DirHelper {
    public static function add_dir($type, $data) {
        switch($type) {
            case 'info':
                $m = M('dir_info');
                break;
            case 'article':
                $m = M('dir_article');
                break;
            default:
                return 10003;
                break;
        }

        $parent_filter['did'] = $data['parent'];
        $top_ret = $m->where($parent_filter)->select();

        // check parent
        if (!$top_ret) return 10002;
        $top_ret = $top_ret[0];

        // insert new record
        $id = $m->data($data)->add();
        if (!$id) return 10003;
        
        // updata parent's children
        import('@.Util.Util');

        $update_children['children'] = Util::addIdToIdstr($top_ret['children'], $id);
        $update_ret = $m->where($parent_filter)->data($update_children)->save();

        if (!$update_ret) return 10003;

        return 0;
    }

    public static function get_dir($type, $id = null) {
        switch($type) {
            case 'info':
                $m = M('dir_info');
                break;
            case 'article':
                $m = M('dir_article');
                break;
            default:
                return 10003;
                break;
        }

        $filter['status'] = 0;
        if ($id !== null) {
            $filter['did'] = $id;
        }

        $ret = $m->where($filter)->select();

        return $ret;
    }

    public static function del_dir($type, $dids_str) {
        switch($type) {
            case 'info':
                $m = M('dir_info');
                break;
            case 'article':
                $m = M('dir_article');
                break;
            default:
                return 10003;
                break;
        }

        // except root, unable to delete
        $dids = array_unique(split(',', $dids_str));
        for ($i = 0, $len = count($dids); $i < $len; $i++) {
            if ($dids[$i] == 0) {
                unset($dids[$i]);
                $dids_str = join(',', $dids);
                break;
            }
        }

        $data = array(
            'status' => 1
        );

        $m->where("did in ($dids_str)")->data($data)->save();
        return 0;
    }

    public static function edit_dir($type, $data) {
        switch($type) {
            case 'info':
                $m = M('dir_info');
                break;
            case 'article':
                $m = M('dir_article');
                break;
            default:
                return 10003;
                break;
        }

        // get old
        $old = $m->where(array('did' => $data['did']))->select();
        if (!$old) return 10004;

        // update new
        $m->where(array('did' => $data['did']))->data($data)->save();
        
        return 0;
    }
}
?>
