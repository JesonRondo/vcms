define(function(require, exports, module) {
    var $ = require('jquery');

    var EditBox = {
        openEditBox: function() {
            require.async('/tpl/mbox/alias_editbox.html', function(tpl) {
                $('#page').append(tpl);
                $('#alias_editbox').addClass('d_box_show');

                // event
                $('#alias_editbox_close_btn').on('click', EditBox.closeEditBox);
                $('#alias_editbox_cancel_btn').on('click', EditBox.closeEditBox);
            });
        },
        closeEditBox: function() {
            var $editbox = $('#alias_editbox');
            if ($editbox.length === 0) return;

            $editbox.addClass('d_box_close');
            setTimeout(function() {
                $editbox.remove();
            }, 400);
        }
    };

    var btnEvent = function() {
        $('#info_tit').off('click').on('click', EditBox.openEditBox);
    };

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

    var initEvent = function() {
        btnEvent();
    };

    exports.init = function(did) {
        initPage(did);

        initEvent();
    };
});