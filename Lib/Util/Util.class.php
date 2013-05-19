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
            if (isset($index_ary[$children[$i]]))
                $new_ary = Util::pushChildren($new_ary, $children[$i], $index_ary, $flag . '&nbsp;&nbsp;|-- ');
        }

        return $new_ary;
    }

    /**
     * add id to id str
     */
    public static function addIdToIdstr($idstr, $id) {
        if ($idstr !== '') {
            $id_ary = split(',', $idstr);
        } else {
            $id_ary = array();
        }
        array_push($id_ary, $id);
        $id_ary = array_unique($id_ary);
        sort($id_ary);

        return join(',', $id_ary);
    }

    /**
     * del id from id str
     */
    public static function delIdFromIdstr($idstr, $id) {
        if ($idstr !== '') {
            $id_ary = split(',', $idstr);
        } else {
            $id_ary = array();
        }
        for ($i = 0, $len = count($id_ary); $i < $len; $i++) {
            if ($id_ary[$i] == $id) {
                unset($id_ary[$i]);
                break;
            }
        }

        return join(',', $id_ary);
    }
}
?>
