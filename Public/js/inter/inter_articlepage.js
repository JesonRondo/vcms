define(function(require, exports, module) {
    var $ = require('jquery');

    var did = '';

    var line_fields = ['title', 'author'];

    var articleCtrl = {
        exchange: function(id1, id2) {
            $.ajax({
                url: '/v/exchange_article',
                data: {
                    vid1: id1,
                    vid2: id2
                },
                success: function(json) {
                    if (json.status === 0) {
                        articleCtrl.closeEditBox();
                        initPage();
                    }
                }
            });
        },
        del: function(vid) {
            $.ajax({
                url: '/v/del_article',
                data: {vid: vid},
                success: function(json) {
                    if (json.status === 0) {
                        articleCtrl.closeEditBox();
                        initPage();
                    }
                }
            });
        },
        closeEditBox: function() {

        }
    };

    var btnEvent = function() {
        $('#info_rows').off('click')
            .on('click', '.s_up', function() {
                var $thisNode = $(this).parent();

                var id1 = $thisNode.attr('data-vid');
                var id2 = $thisNode.parent().prev().find('td').eq(1).attr('data-vid');

                articleCtrl.exchange(id1, id2);
            })
            .on('click', '.s_down', function() {
                var $thisNode = $(this).parent();

                var id1 = $thisNode.attr('data-vid');
                var id2 = $thisNode.parent().next().find('td').eq(1).attr('data-vid');

                articleCtrl.exchange(id1, id2);
            })
            .on('click', '.s_del', function() {
                var $this = $(this);
                if (!$this.hasClass('s_deling')) {
                    $this.addClass('s_deling').html('Sure?');
                    setTimeout(function() {
                        $this.removeClass('s_deling').html('delete');
                    }, 2500);
                } else {
                    var vid = $this.parent().attr('data-vid');
                    articleCtrl.del(vid);
                }
            });
    };

    var initPage = function() {
        $.ajax({
            url: '/v/get_articles',
            data: {id: did},
            success: function(json) {
                if (json.status === 0) {
                    var data = json.data;
                    $('#info_tit').html(data.name);

                    var len = line_fields.length;

                    // tablehead
                    var $column = [];
                    $column.push('<tr>');
                    $column.push('<th>ID</th>');
                    $column.push('<th>Control</th>');
                    for (var i = 0; i < len; i++) {
                        $column.push('<th>' + line_fields[i] + '</th>');
                    }
                    $column.push('</tr>');
                    $column = $column.join('');
                    $('#info_column').html($column);

                    // tablebody
                    var $rows = [];
                    var rows = data.rows;
                    for (var i = 0, l = rows.length; i < l; i++) {
                        $rows.push('<tr>');
                        $rows.push('<td>' + rows[i]['vid'] + '</td>');
                        $rows.push('<td data-vid="' + rows[i]['vid'] + '">')
                        $rows.push('<a href="javascript:;" class="infotable_ctrlbtn s_edit">edit</a>')
                        $rows.push('<a href="javascript:;" class="infotable_ctrlbtn s_del">delete</a>')
                        $rows.push('<a href="javascript:;" class="infotable_ctrlbtn s_up" ' + (i === 0 ? 'style="visibility:hidden"' : '') + '>▲</a>')
                        $rows.push('<a href="javascript:;" class="infotable_ctrlbtn s_down" ' + (i === l - 1 ? 'style="visibility:hidden"' : '') + '>▼</a>')
                        $rows.push('</td>');
                        for (var j = 0; j < len; j++) {
                            $rows.push('<td>' + rows[i][line_fields[j]] + '</td>');
                        }
                        $rows.push('</tr>');
                    }
                    $rows = $rows.join('');
                    $('#info_rows').html($rows);
                }
            }
        });
    };

    var initEvent = function() {
        btnEvent();
    };

    exports.init = function(id) {
        did = id;

        initPage();
        initEvent();
    };
});