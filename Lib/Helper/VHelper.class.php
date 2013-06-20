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

    public static function edit_info($data) {
        $m = M('v_info');

        $filter['vid'] = $data['vid'];
        unset($data['vid']);

        $ret = $m->where($filter)->data($data)->save();
        return 0;
    }

    public static function get_sinfo($vid) {
        $m = M('v_info');
        $filter['vid'] = $vid;

        $ret = $m->where($filter)->select();

        if (!$ret) return 10004;
        return $ret[0];
    }

    public static function exchange_info($id1, $id2) {
        $m = M('v_info');
        $f1['vid'] = $id1;
        $f2['vid'] = $id2;

        $r1 = $m->where($f1)->select();
        $r2 = $m->where($f2)->select();

        if (!($r1 && $r2)) return 10004;

        $data1 = $r1[0];
        $data2 = $r2[0];
        unset($data1['vid']);
        unset($data2['vid']);

        $r1 = $m->where($f1)->data($data2)->save();
        $r2 = $m->where($f2)->data($data1)->save();

        if (!($r1 && $r2)) return 10003;
        return 0;
    }

    public static function get_articles($did) {
        // column
        $filter['did'] = $did;

        $m1 = M('dir_article');
        $ret1 = $m1->where($filter)->select();

        if (!$ret1) return 10004;
        $ret1 = $ret1[0];

        // records
        $filter['status'] = 0;

        $m2 = M('v_article');
        $ret2 = $m2->where($filter)->select();

        if (!$ret2) $ret2 = array();

        $ret['name'] = $ret1['name'];
        $ret['rows'] = $ret2;

        return $ret;
    }

    public static function get_article($vid) {
        $filter['vid'] = $vid;
        $filter['status'] = 0;

        $m = M('v_article');
        $ret = $m->where($filter)->select();

        // check id
        if (!$ret) return 10005;
        return $ret[0];
    }

    public static function exchange_article($id1, $id2) {
        $m = M('v_article');
        $f1['vid'] = $id1;
        $f2['vid'] = $id2;

        $r1 = $m->where($f1)->select();
        $r2 = $m->where($f2)->select();

        if (!($r1 && $r2)) return 10004;

        $data1 = $r1[0];
        $data2 = $r2[0];
        unset($data1['vid']);
        unset($data2['vid']);

        $r1 = $m->where($f1)->data($data2)->save();
        $r2 = $m->where($f2)->data($data1)->save();

        if (!($r1 && $r2)) return 10003;
        return 0;
    }

    public static function del_article($id) {
        $m = M('v_article');
        $filter['vid'] = $id;
        $data['status'] = 1;

        $ret = $m->where($filter)->data($data)->save();
        return 0;
    }

    public static function add_article($data) {
        $m = M('v_article');
        $data['status'] = 0;
        $time = Date('Y-m-d H:i:s', time());
        $data['createtime'] = $time;
        $data['updatetime'] = $time;

        $id = $m->data($data)->add();

        if (!$id) return 10003;

        return 0;
    }

    public static function edit_article($data) {
        $m = M('v_article');

        $filter['vid'] = $data['vid'];
        unset($data['vid']);

        $ret = $m->where($filter)->data($data)->save();
        return 0;
    }
}
?>
