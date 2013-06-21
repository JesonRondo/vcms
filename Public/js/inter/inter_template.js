define(function(require, exports, module) {
    var $ = require('jquery');

    var editor;

    var templateCtrl = {
        editSubmit: function(filename) {
            var data = {
                filename: filename,
                content: editor.getContent()
            };
            $.ajax({
                url: '/tpl/editfile',
                data: data,
                type: 'POST',
                success: function(json) {
                    if (json.status === 0) {
                        templateCtrl.closeEditBox();
                    }
                }
            });
        },
        addFileSubmit: function() {
            var data = {};
            data['filename'] = $('#filename').val();
            // params check
            if (data['filename'] === '') {
                $('#filename').addClass('m_text_error').focus();
                return false;
            }

            $.ajax({
                url: '/tpl/makefile',
                data: data,
                success: function(json) {
                    if (json.status === 0) {
                        templateCtrl.closeFileNameEditBox();
                        initPage();
                    } else if (json.status === 10006) { // file exist
                        $('#filename').addClass('m_text_error').focus();
                    }
                }
            });
        },
        openFileNamebox: function() {
            require.async('/tpl/mbox/filename_editbox.html', function(tpl) {
                $('#page').append(tpl);
                $('#filename_editbox').addClass('d_box_show');

                // event
                $('#filename_editbox_close_btn').off('click').on('click', templateCtrl.closeFileNameEditBox);
                $('#filename_editbox_cancel_btn').off('click').on('click', templateCtrl.closeFileNameEditBox);

                $('#filename_editbox_ok_btn').off('click').on('click', function() {
                    templateCtrl.addFileSubmit();
                });
            });
        },
        closeFileNameEditBox: function() {
            var $editbox = $('#filename_editbox');
            if ($editbox.length === 0) return;

            $editbox.addClass('d_box_close');
            setTimeout(function() {
                $editbox.remove();
            }, 400);
        },
        openEditBox: function(filename) {
            require.async('/tpl/mbox/tpl_editbox.html', function(tpl) {
                $('#page').append(tpl);
                $('#filename').html(filename);
                $('#tpl_editbox').addClass('d_box_show');

                // event
                $('#tpl_editbox_close_btn').off('click').on('click', templateCtrl.closeEditBox);
                $('#tpl_editbox_cancel_btn').off('click').on('click', templateCtrl.closeEditBox);

                // load editor
                require.async('ueditor_config', function() {
                    require.async('ueditor_all', function() {
                        editor = new UE.ui.Editor();
                        var id = 'myEditor' + parseInt(Math.random() * 10000, 10);
                        var content = '';
                
                        $.ajax({
                            url: '/tpl/getfile',
                            data: {
                                filename: filename
                            },
                            success: function(json) {
                                if (json.status === 0) {
                                    var content = json.data;
                                    $('#editor').html('<textarea name="text" id="' + id + '">' + content + '</textarea>');
                                    editor.render(id);

                                    $('#tpl_editbox_ok_btn').off('click').on('click', function() {
                                        templateCtrl.editSubmit(filename);
                                    });
                                }
                            }
                        });
                    });
                });
            });
        },
        closeEditBox: function() {
            var $editbox = $('#tpl_editbox');
            if ($editbox.length === 0) return;

            $editbox.addClass('d_box_close');
            setTimeout(function() {
                $editbox.remove();
            }, 400);
        }
    };

    var PanelFunc = {
        btnDisWord: {
            'del_btn'       : 'Del',
            'del_btn_alarm' : 'Sure'
        },
        editFunc: function() {
            var $this = $(this);
            if ($this.hasClass('m_btn_disable')) {
                return;
            } else {
                var filename = $('.cate_list_select').eq(0).attr('data-filename');
                PanelFunc.restoreDelStatus();
                templateCtrl.openEditBox(filename);
            }
        },
        deleteStatus: function() {
            var $this = $(this);
            if ($this.hasClass('m_btn_disable')) {
                return;
            } else if ($this.hasClass('m_btn_alarm')) {
                var $this = $('.cate_list_alarm').eq(0);
            
                $.ajax({
                    url: '/tpl/delfile',
                    data: {
                        filename: $this.attr('data-filename')
                    },
                    success: function(json) {
                        if (json.status === 0) {
                            $this.addClass('cate_list_close');
                            setTimeout(function() {
                                $this.remove();
                                PanelFunc.restoreDelStatus();
                                $('#edit_btn, #del_btn').addClass('m_btn_disable');
                            }, 500);
                        }
                    }
                });
            } else {
                $this.addClass('m_btn_alarm').html(PanelFunc.btnDisWord['del_btn_alarm']);
                var $cate_list_cur = $('.cate_list_select').eq(0);
                $cate_list_cur.addClass('cate_list_alarm');
            }
        },
        resetDelBtn: function() {
            $('#del_btn').removeClass('m_btn_alarm').html(PanelFunc.btnDisWord['del_btn']);
        },
        restoreDelStatus: function() {
            this.resetDelBtn();
            $('.cate_list_alarm').removeClass('cate_list_alarm');
        }
    };

    var listEvent = function() {
        $('#list_box').off('click').on('click', '.cate_list', function(e) {
            var $this = $(this);
            templateCtrl.closeFileNameEditBox();

            if ($this.hasClass('cate_list_select')) {
                return;
            } else {
                $('.cate_list_select').removeClass('cate_list_select');
                $this.addClass('cate_list_select');
                $('#edit_btn, #del_btn').removeClass('m_btn_disable');
                PanelFunc.restoreDelStatus();
            }
        });
    };

    var btnEvent = function() {
        $('#add_btn').off('click').on('click', templateCtrl.openFileNamebox);
        $('#edit_btn').off('click').on('click', PanelFunc.editFunc);
        $('#del_btn').off('click').on('click', PanelFunc.deleteStatus);
    };

    var initPage = function() {
        $.ajax({
            url: '/tpl/getfiles',
            data: null,
            success: function(json) {
                if (json.status === 0) {
                    var $list = [];
                    var data = json.data;
                    for (var i in data) {
                        $list.push('<p class="cate_list" data-filename="' + data[i] + '">' + data[i] + '</p>');
                    }
                    $list = $list.join('');
                    $('#list_box').html($list);

                    PanelFunc.restoreDelStatus();
                    $('#edit_btn, #del_btn').addClass('m_btn_disable');
                }
            }
        });
    };

    var initEvent = function() {
        btnEvent();
        listEvent();
    };

    exports.init = function() {
        initPage();
        initEvent();
    };
});