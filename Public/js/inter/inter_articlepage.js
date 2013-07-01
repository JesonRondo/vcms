define(function(require, exports, module) {
    var $ = require('jquery');

    // use editor
    var use_editor = false;

    var did = '';

    var line_fields = ['title', 'author', 'extra1', 'extra2', 'extra3', 'extra4', 'extra5'];

    var editor;

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
        openEditBox: function(method, vid) { // method: add, edit (when method === edit has vid param)
            var methods = ['add', 'edit'];

            if (method === undefined && $.inArray(method, methods) === -1)
                method = 'add';

            require.async('/tpl/mbox/article_editbox.html', function(tpl) {
                $('#page').append(tpl);
                $('#article_editbox').addClass('d_box_show');

                // event
                $('#article_editbox_close_btn').off('click').on('click', articleCtrl.closeEditBox);
                $('#article_editbox_cancel_btn').off('click').on('click', articleCtrl.closeEditBox);

                if (use_editor) {
                    // load editor
                    require.async('ueditor_config', function() {
                        require.async('ueditor_all', function() {
                            editor = new UE.ui.Editor();
                            var id = 'myEditor' + parseInt(Math.random() * 10000, 10);
                            var content = '';
                    
                            switch(method) {
                                case 'add':
                                    $('#editor').html('<textarea name="text" id="' + id + '">' + content + '</textarea>');
                                    editor.render(id);

                                    $('#article_editbox_ok_btn').off('click').on('click', function() {
                                        articleCtrl.addSubmit();
                                    });
                                    break;
                                case 'edit':
                                    $.ajax({
                                        url: '/v/get_article',
                                        data: {
                                            vid: vid
                                        },
                                        success: function(json) {
                                            if (json.status === 0) {
                                                var data = json.data;

                                                $('#title').val(data.title);
                                                $('#author').val(data.author);
                                                $('#summary').val(data.summary);
                                                $('#extra1').val(data.extra1);
                                                $('#extra2').val(data.extra2);
                                                $('#extra3').val(data.extra3);
                                                $('#extra4').val(data.extra4);
                                                $('#extra5').val(data.extra5);

                                                content = data.text;
                                                $('#editor').html('<textarea name="text" id="' + id + '">' + content + '</textarea>');
                                                editor.render(id);

                                                $('#article_editbox_ok_btn').off('click').on('click', function() {
                                                    articleCtrl.editSubmit(vid);
                                                });
                                            }
                                        }
                                    });
                                    break;
                            }
                        });
                    }); // load editor end
                } else {
                    var id = 'text';
                    var content = '';
            
                    switch(method) {
                        case 'add':
                            $('#editor').html('<textarea name="text" class="m_code_editor m_term" id="' + id + '">' + content + '</textarea>');
                            
                            $('#article_editbox_ok_btn').off('click').on('click', function() {
                                articleCtrl.addSubmit();
                            });
                            break;
                        case 'edit':
                            $.ajax({
                                url: '/v/get_article',
                                data: {
                                    vid: vid
                                },
                                success: function(json) {
                                    if (json.status === 0) {
                                        var data = json.data;

                                        $('#title').val(data.title);
                                        $('#author').val(data.author);
                                        $('#summary').val(data.summary);
                                        $('#extra1').val(data.extra1);
                                        $('#extra2').val(data.extra2);
                                        $('#extra3').val(data.extra3);
                                        $('#extra4').val(data.extra4);
                                        $('#extra5').val(data.extra5);

                                        content = data.text;
                                        $('#editor').html('<textarea name="text" class="m_code_editor m_term" id="' + id + '">' + content + '</textarea>');
                                        
                                        $('#article_editbox_ok_btn').off('click').on('click', function() {
                                            articleCtrl.editSubmit(vid);
                                        });
                                    }
                                }
                            });
                            break;
                    }
                }
            });
        },
        closeEditBox: function() {
            var $editbox = $('#article_editbox');
            if ($editbox.length === 0) return;

            $editbox.addClass('d_box_close');
            setTimeout(function() {
                $editbox.remove();
            }, 400);
        },
        addSubmit: function() {
            var data = {};
            
            data['did'] = did;
            data['title'] = $('#title').val();
            data['author'] = $('#author').val();
            data['summary'] = $('#summary').val();
            data['text'] = use_editor ? editor.getContent() : $('#text').val();
            data['extra1'] = $('#extra1').val();
            data['extra2'] = $('#extra2').val();
            data['extra3'] = $('#extra3').val();
            data['extra4'] = $('#extra4').val();
            data['extra5'] = $('#extra5').val();

            // params check
            if (data['title'] === '') {
                $('#title').addClass('m_text_error').focus();
                return false;
            }

            $.ajax({
                url: '/v/add_article',
                data: data,
                type: 'POST',
                success: function(json) {
                    if (json.status === 0) {
                        articleCtrl.closeEditBox();
                        initPage();
                    }
                }
            });
        },
        editSubmit: function(vid) {
            var data = {};
            
            data['vid'] = vid;
            data['title'] = $('#title').val();
            data['author'] = $('#author').val();
            data['summary'] = $('#summary').val();
            data['text'] = use_editor ? editor.getContent() : $('#text').val();
            data['extra1'] = $('#extra1').val();
            data['extra2'] = $('#extra2').val();
            data['extra3'] = $('#extra3').val();
            data['extra4'] = $('#extra4').val();
            data['extra5'] = $('#extra5').val();

            // params check
            if (data['title'] === '') {
                $('#title').addClass('m_text_error').focus();
                return false;
            }

            $.ajax({
                url: '/v/edit_article',
                data: data,
                type: 'POST',
                success: function(json) {
                    if (json.status === 0) {
                        articleCtrl.closeEditBox();
                        initPage();
                    }
                }
            });
        }
    };

    var btnEvent = function() {
        $('#add_btn').off('click').on('click', function() {
            articleCtrl.openEditBox();
        });

        $('#info_rows').off('click')
            .on('click', '.s_edit', function() {
                var vid = $(this).parent().attr('data-vid');
                articleCtrl.openEditBox('edit', vid);
            })
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