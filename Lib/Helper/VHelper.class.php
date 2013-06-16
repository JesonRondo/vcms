<?php
class VHelper {
    public static function get_info($id, $type = null) {
        $filter['did'] = $id;

        $m1 = M('dir_info');
        $ret1 = $m1->where($filter)->select();

        // check id
        if (!$ret1) return 10004;
        $ret1 = $ret1[0];

        if ($type === 'columns') {
            // info alias
            $m2 = M('v_info_alias');
            $ret2 = $m2->where($filter)->select();
            if (!$ret2) {
                $m2->data($filter)->add();
                $ret2 = $m2->where($filter)->select();
            }
            $ret2 = $ret2[0];
            unset($ret2['id']);
            unset($ret2['did']);
            $column_len = $ret2['len'];
            unset($ret2['len']);

            $data['column'] = $ret2;
            $data['column_len'] = (int)$column_len;
        } else if ($type === 'rows') {
            // info details
            $m3 = M('v_info');
            $filter['status'] = 0;
            $ret3 = $m3->where($filter)->select();
            if (!$ret3) $ret3 = array();

            $data['rows'] = $ret3;
        } else {
            $data['name'] = $ret1['name'];

            // info alias
            $m2 = M('v_info_alias');
            $ret2 = $m2->where($filter)->select();
            if (!$ret2) {
                $m2->data($filter)->add();
                $ret2 = $m2->where($filter)->select();
            }
            $ret2 = $ret2[0];
            unset($ret2['id']);
            unset($ret2['did']);
            $column_len = $ret2['len'];
            unset($ret2['len']);

            $data['column'] = $ret2;
            $data['column_len'] = (int)$column_len;

            // info details
            $m3 = M('v_info');
            $filter['status'] = 0;
            $ret3 = $m3->where($filter)->select();
            if (!$ret3) $ret3 = array();

            $data['rows'] = $ret3;
        }

        return $data;
    }

    public static function edit_alias($data) {
        $filter['did'] = $data['id'];
        unset($data['id']);

        $m = M('v_info_alias');
        $ret = $m->where($filter)->select();

        if (!$ret) return 10004;

        $ret = $m->where($filter)->data($data)->save();

        if (!$ret) return 10003;
        
        return 0;
    }

    public static function add_info($data) {
        $m = M('v_info');
        $data['status'] = 0;

        $id = $m->data($data)->add();

        if (!$id) return 10003;

        return 0;
    }

    public static function del_info($id) {
        $m = M('v_info');
        $filter['vid'] = $id;
        $data['status'] = 1;

        $ret = $m->where($filter)->data($data)->save();
        return 0;
    }
}
?>
