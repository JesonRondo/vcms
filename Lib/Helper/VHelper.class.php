<?php
class VHelper {
    public static function get_info($id) {
        $filter = array(
            'did' => $id
        );

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
        $colume_len = $ret2['len'];
        unset($ret2['len']);

        $data = array(
            'name' => $ret1['name'],
            'colume' => $ret2,
            'colume_len' => (int)$colume_len,
        );

        return $data;
    }
}
?>
