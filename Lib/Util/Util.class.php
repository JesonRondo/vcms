<?php
class Util {
    /**
     * built tree
     */
    public static function pushNodeToTree($nodes) {
        for ($i = count($nodes) - 1; $i >= 0; $i--) {
            $index_ary[$nodes[$i]['did']] = $nodes[$i];
        }
        $new_ary = array();
        $new_ary = Util::pushChildren($new_ary, $index_ary['0']['did'], $index_ary);
        
        return $new_ary;
    }

    public static function pushChildren($new_ary, $cur_index, $index_ary, $flag = '') {
        $index_ary[$cur_index]['dis_name'] = $flag . $index_ary[$cur_index]['name'];
        array_push($new_ary, $index_ary[$cur_index]);
        
        $children = $index_ary[$cur_index]['children'];
        if ($children === '') {
            $children = array();
        } else {
            $children = split(',', $children);
        }

        for ($i = 0, $len = count($children); $i < $len; $i++) {
            $new_ary = Util::pushChildren($new_ary, $children[$i], $index_ary, $flag . '&nbsp;&nbsp;|-- ');
        }

        return $new_ary;
    }
}
?>