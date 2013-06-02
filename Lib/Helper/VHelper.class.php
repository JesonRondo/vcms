<?php
class VHelper {
    public static function get_info($id) {
        $filter['did'] = $id;

        $m1 = M('dir_info');
        $ret1 = $m1->where($filter)->select();

        // check id
        if (!$ret1) return 10004;
        $ret1 = $ret1[0];

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

        // info details
        $m3 = M('v_info');
        $filter['status'] = 0;
        $ret3 = $m3->where($filter)->select();
        if (!$ret3) $ret3 = array();

        $data = array(
            'name' => $ret1['name'],
            'column' => $ret2,
            'column_len' => (int)$column_len,
            'rows'  => $ret3
        );
        return $data;
    }
}
?>
