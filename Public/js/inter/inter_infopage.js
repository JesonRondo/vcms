define(function(require, exports, module) {
    var $ = require('jquery');

    var initPage = function(did) {
        $.ajax({
            url: '/v/get_info',
            data: {id: did},
            success: function(json) {
                if (json.status === 0) {
                    var data = json.data;
                    $('#info_tit').html(data.name);

                    var len = data.column_len;

                    // tablehead
                    var $column = [];
                    $column.push('<tr>');
                    $column.push('<th>ID</th>');
                    var column = data.column;
                    for (var i = 0; i < len; i++) {
                        $column.push('<th>' + column['field' + (i + 1)] + '</th>');
                    }
                    $column.push('</tr>');
                    $column.join('');
                    $('#info_column').html($column);

                    // tablebody
                    var $rows = [];
                    $rows.push('<tr>');
                    var rows = data.rows;
                    for (var i = 0, l = rows.length; i < l; i++) {
                        $rows.push('<td>' + rows[i]['vid'] + '</td>');
                        for (var j = 0; j < len; j++) {
                            $rows.push('<td>' + rows[i]['field' + (j + 1)] + '</td>');
                        }
                    }
                    $rows.push('</tr>');
                    $column.join('');
                    $('#info_rows').html($rows);
                }
            }
        });
    };

    exports.init = function(did) {
        initPage(did);
    };
});