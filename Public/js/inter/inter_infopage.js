define(function(require, exports, module) {
    var $ = require('jquery');

    var did = '';

    var InfoBox = {
        delInfo: function(vid) {
            $.ajax({
                url: '/v/del_info',
                data: {vid: vid},
                success: function(json) {
                    if (json.status === 0) {
                        InfoBox.closeEditBox();
                        initPage();
                    }
                }
            });
        },
        exchangeInfo: function(id1, id2) {
            $.ajax({
                url: '/v/exchange_info',
                data: {
                    vid1: id1,
                    vid2: id2
                },
                success: function(json) {
                    if (json.status === 0) {
                        InfoBox.closeEditBox();
                        initPage();
                    }
                }
            });
        },
        addSubmit: function() {
            var $inputs = $('#info_edit_form').find('.m_text');
            var data = {};
            // empty str
            for (var i = 0; i < 30; i++) {
                data['field' + (i + 1)] = '';
            }
            $inputs.each(function(i) {
                var val = $(this).val();
                data['field' + (i + 1)] = val;
            });

            data['did'] = did;

            $.ajax({
                url: '/v/add_info',
                data: data,
                success: function(json) {
                    if (json.status === 0) {
                        InfoBox.closeEditBox();
                        initPage();
                    }
                }
            });
        },
        editSubmit: function(vid) {
            var $inputs = $('#info_edit_form').find('.m_text');
            var data = {};
            // empty str
            for (var i = 0; i < 30; i++) {
                data['field' + (i + 1)] = '';
            }
            $inputs.each(function(i) {
                var val = $(this).val();
                data['field' + (i + 1)] = val;
            });

            data['vid'] = vid;

            $.ajax({
                url: '/v/edit_info',
                data: data,
                success: function(json) {
                    if (json.status === 0) {
                        InfoBox.closeEditBox();
                        initPage();
                    }
                }
            });
        },
        openEditBox: function(method, vid) { // method: add, edit (when method === edit has vid param)
            var methods = ['add', 'edit'];
            if (method === undefined && $.inArray(method, methods) === -1)
                method = 'add';

            require.async('/tpl/mbox/info_editbox.html', function(tpl) {
                $('#page').append(tpl);
                $('#info_editbox').addClass('d_box_show');

                // event
                $('#info_editbox_close_btn').off('click').on('click', InfoBox.closeEditBox);
                $('#info_editbox_cancel_btn').off('click').on('click', InfoBox.closeEditBox);

                $.ajax({
                    url: '/v/get_info',
                    data: {
                        id  : did,
                        type: 'columns'
                    },
                    success: function(json) {
                        if (json.status === 0) {
                            var data = json.data;
                            var columns = data.column;
                            var len = data.column_len;

                            var $form = [];
                            switch(method) {
                                case 'add':
                                    for (var i = 1; i <= len; i++) {
                                        $form.push('<label class="m_label">' + columns['field' + i] + '</label>');
                                        $form.push('<input type="text" id="field' + i + '" class="m_text m_text_full" placeholder="' + columns['field' + i] + '" />');
                                    }
                                    $form = $form.join('');
                                    $('#info_edit_form').html($form);
                                    $('#info_editbox_ok_btn').off('click').on('click', InfoBox.addSubmit);
                                    break;
                                case 'edit':
                                    $.ajax({
                                        url: '/v/get_sinfo',
                                        data: {
                                            vid: vid
                                        },
                                        success: function(json) {
                                            if (json.status === 0) {
                                                var sinfo = json.data;
                                                for (var i = 1; i <= len; i++) {
                                                    $form.push('<label class="m_label">' + columns['field' + i] + '</label>');
                                                    $form.push('<input type="text" id="field' + i + '" class="m_text m_text_full" placeholder="' + columns['field' + i] + '" value="' + sinfo['field' + i] + '" />');
                                                }
                                                $form = $form.join('');
                                                $('#info_edit_form').html($form);
                                                $('#info_editbox_ok_btn').off('click').on('click', function() {
                                                    InfoBox.editSubmit(vid);
                                                });
                                            }
                                        }
                                    });
                                    break;
                            }
                        }
                    }
                });
            });
        },
        closeEditBox: function() {
            var $editbox = $('#info_editbox');
            if ($editbox.length === 0) return;

            $editbox.addClass('d_box_close');
            setTimeout(function() {
                $editbox.remove();
            }, 400);
        }
    };

    var AliasBox = {
        openEditBox: function() {
            require.async('/tpl/mbox/alias_editbox.html', function(tpl) {
                $('#page').append(tpl);
                $('#alias_editbox').addClass('d_box_show');

                // event
                $('#alias_editbox_close_btn').off('click').on('click', AliasBox.closeEditBox);
                $('#alias_editbox_cancel_btn').off('click').on('click', AliasBox.closeEditBox);

                $.ajax({
                    url: '/v/get_info',
                    data: {
                        id  : did,
                        type: 'columns'
                    },
                    success: function(json) {
                        if (json.status === 0) {
                            var data = json.data;
                            var columns = data.column;

                            $('#len').val(data.column_len);
                            for (var k in columns) {
                                $('#' + k).val(columns[k]);
                            }
                            $('#alias_editbox_ok_btn').off('click').on('click', AliasBox.submitEditBox);
                        }
                    }
                });
            });
        },
        submitEditBox: function() {
            var data = {};
            var field_num = 30;

            data['id'] = did;
            data['len'] = $('#len').val();

            for (var i = 0; i < field_num; i++) {
                var k = 'field' + (i + 1);
                data[k] = $('#' + k).val();
            }

            $.ajax({
                url: '/v/edit_alias',
                data: data,
                success: function(json) {
                    if (json.status === 0) {
                        AliasBox.closeEditBox();
                        initPage();
                    }
                }
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
        $('#info_tit').off('click').on('click', AliasBox.openEditBox);
        $('#add_btn').off('click').on('click', function() {
            InfoBox.openEditBox();
        });

        $('#info_rows').off('click')
            .on('click', '.s_edit', function() {
                var vid = $(this).parent().attr('data-vid');
                InfoBox.openEditBox('edit', vid);
            })
            .on('click', '.s_up', function() {
                var $thisNode = $(this).parent();

                var id1 = $thisNode.attr('data-vid');
                var id2 = $thisNode.parent().prev().find('td').eq(1).attr('data-vid');

                InfoBox.exchangeInfo(id1, id2);
            })
            .on('click', '.s_down', function() {
                var $thisNode = $(this).parent();

                var id1 = $thisNode.attr('data-vid');
                var id2 = $thisNode.parent().next().find('td').eq(1).attr('data-vid');

                InfoBox.exchangeInfo(id1, id2);
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
                    InfoBox.delInfo(vid);
                }
            });
    };

    var initPage = function() {
        $.ajax({
            url: '/v/get_info',
            data: {id: did},
            success: function(json) {
                if (json.status === 0) {
                    var data = json.data;
                    $('#info_tit').html(data.name);

                    var len = data.column_len;
                    if (len > 30) len = 30; // max 30

                    // tablehead
                    var $column = [];
                    $column.push('<tr>');
                    $column.push('<th>ID</th>');
                    $column.push('<th>Control</th>');
                    var column = data.column;
                    for (var i = 0; i < len; i++) {
                        $column.push('<th>' + column['field' + (i + 1)] + '</th>');
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
                            $rows.push('<td>' + rows[i]['field' + (j + 1)] + '</td>');
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