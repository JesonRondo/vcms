define(function(require, exports, module) {
    var $ = require('jquery');

    var EditBox = {
        $option: '', // option cache
        addDirSubmit: function() {
            var form = {
                belong: $('#belong').val(),
                input_dir: $('#input_dir').val(),
                input_dir_alias: $('#input_dir_alias').val()
            };

            // params check
            $('#dir_editbox').find('.m_text_error').removeClass('m_text_error');
            for (var k in form) {
                if (form[k] === '') {
                    $('#' + k).addClass('m_text_error').focus();
                    return false;
                }
            }

            var url = '/dir/add';
            $.ajax({
                url: url,
                data: {
                    parent      : form.belong,
                    name        : form.input_dir,
                    name_alias  : form.input_dir_alias
                },
                success: function(json) {
                    if (json.status === 0) {
                        EditBox.closeEditBox();
                        reloadList();
                    }
                }
            });
        },
        closeEditBox: function() {
            var $dir_editbox = $('#dir_editbox');
            if ($dir_editbox.length === 0) return;

            $dir_editbox.addClass('d_box_close');
            setTimeout(function() {
                $dir_editbox.remove();
            }, 100);
        },
        openEditBox: function() {
            require.async('/tpl/mbox/dir_editbox.html', function(tpl) {
                $('#page').append(tpl);
                $('#dir_editbox').addClass('d_box_show');
                $('#belong').html(EditBox.$options);

                $('#dir_editbox_ok_btn').on('click', EditBox.addDirSubmit);
                $('#dir_editbox_close_btn').on('click', EditBox.closeEditBox);
                $('#dir_editbox_cancel_btn').on('click', EditBox.closeEditBox);
            });
        }
    };

    var PanelFunc = {
        btnDisWord: {
            'del_btn'       : 'Del',
            'del_btn_alarm' : 'Sure'
        },
        addFunc: function() {
            PanelFunc.restoreDelStatus();
            EditBox.openEditBox();
        },
        editFunc: function() {
            var $this = $(this);
            if ($this.hasClass('m_btn_disable')) {
                return;
            } else {
                PanelFunc.restoreDelStatus();
                EditBox.openEditBox();
            }
        },
        deleteStatus: function() {
            var $this = $(this);
            if ($this.hasClass('m_btn_disable')) {
                return;
            } else if ($this.hasClass('m_btn_alarm')) {
                var $this = $('.cate_list_alarm');
                $this.addClass('cate_list_close');
                setTimeout(function() {
                    $this.remove();
                    PanelFunc.restoreDelStatus();
                    $('#edit_btn, #del_btn').addClass('m_btn_disable');
                }, 500);
            } else {
                $this.addClass('m_btn_alarm').html(PanelFunc.btnDisWord['del_btn_alarm']);
                var $cate_list_cur = $('.cate_list_select').eq(0);
                var s_parent = $cate_list_cur.addClass('cate_list_alarm').attr('data-parent');
                do {
                    $cate_list_cur = $cate_list_cur.next();
                    if ($cate_list_cur.length > 0 
                     && $cate_list_cur.attr('data-parent') !== s_parent) {
                        $cate_list_cur.addClass('cate_list_alarm');
                    } else {
                        break;
                    }
                } while (true);
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

    var btnEvent = function() {
        $('#add_btn').off('click').on('click', PanelFunc.addFunc);
        $('#edit_btn').off('click').on('click', PanelFunc.editFunc);
        $('#del_btn').off('click').on('click', PanelFunc.deleteStatus);
    };

    var listEvent = function() {
        $('#cate_list_box').off('click').on('click', '.cate_list', function() {
            EditBox.closeEditBox();
            if ($(this).hasClass('cate_list_select')) {
                return;
            } else {
                $('.cate_list_select').removeClass('cate_list_select');
                $(this).addClass('cate_list_select');
                $('#edit_btn, #del_btn').removeClass('m_btn_disable');
                PanelFunc.restoreDelStatus();
            }
        });
    };

    var reloadList = function() {
        var url = '/dir/get';
        $.ajax({
            url: url,
            data: null,
            success: function(json) {
                if (json.status === 0) {
                    var $list = '';
                    EditBox.$options = '';
                    for (var i in json.data) {
                        $list += '<p class="cate_list" data-id="' + json.data[i].did + '" data-parent="' + json.data[i].parent + '">' + json.data[i].dis_name + '</p>';
                        EditBox.$options += '<option value="' + json.data[i].did + '">' + json.data[i].dis_name + '</option>';
                    }
                    $('#cate_list_box').html($list);
                }
            }
        });
    };

    exports.initData = function() {
        reloadList();
    };

    exports.initEvent = function() {
        listEvent();
        btnEvent();
    };
});
