define(function(require, exports, module) {
    var $ = require('jquery');
    var btnDisWord = {
        'del_btn'       : 'Del',
        'del_btn_alarm' : 'Sure'
    };

    var $option = ''; // option cache

    var closeEditBox = function() {
        var $dir_editbox = $('#dir_editbox');
        if ($dir_editbox.length === 0) return;

        $dir_editbox.addClass('d_box_close');
        setTimeout(function() {
            $dir_editbox.remove();
        }, 100);
    };

    var openEditBox = function() {
        var editbox_tpl = require.async('/tpl/mbox/dir_editbox.html', function(tpl) {
            $('#page').append(tpl);
            $('#dir_editbox').addClass('d_box_show');
            $('#belong').html($options);

            $('#dir_editbox_close_btn').on('click', closeEditBox);
            $('#dir_editbox_cancel_btn').on('click', closeEditBox);
        });
    };

    var listEvent = function() {
        $('#cate_list_box').off('click').on('click', '.cate_list', function() {
            closeEditBox();
            if ($(this).hasClass('cate_list_select')) {
                return;
            } else {
                $('.cate_list_select').removeClass('cate_list_select');
                $(this).addClass('cate_list_select');
                $('#edit_btn, #del_btn').removeClass('m_btn_disable');
                restoreDelStatus();
            }
        });
    };

    var addFunc = function() {
        restoreDelStatus();
        openEditBox();
    };

    var editFunc = function() {
        var $this = $(this);
        if ($this.hasClass('m_btn_disable')) {
            return;
        } else {
            restoreDelStatus();
            openEditBox();
        }
    };

    var resetDelBtn = function() {
        $('#del_btn').removeClass('m_btn_alarm').html(btnDisWord['del_btn']);
    };

    var restoreDelStatus = function() {
        resetDelBtn();
        $('.cate_list_alarm').removeClass('cate_list_alarm');
    };

    var deleteStatus = function() {
        var $this = $(this);
        if ($this.hasClass('m_btn_disable')) {
            return;
        } else if ($this.hasClass('m_btn_alarm')) {
            var $this = $('.cate_list_alarm');
            $this.addClass('cate_list_close');
            setTimeout(function() {
                $this.remove();
                restoreDelStatus();
                $('#edit_btn, #del_btn').addClass('m_btn_disable');
            }, 500);
        } else {
            $this.addClass('m_btn_alarm').html(btnDisWord['del_btn_alarm']);
            $('.cate_list_select').addClass('cate_list_alarm');
        }
    };

    var btnEvent = function() {
        $('#add_btn').off('click').on('click', addFunc);
        $('#edit_btn').off('click').on('click', editFunc);
        $('#del_btn').off('click').on('click', deleteStatus);
    };

    var reloadList = function() {
        var url = '/dir/get';
        $.ajax({
            url: url,
            data: null,
            success: function(json) {
                if (json.status === 0) {
                    var $list = '';
                    $options = '';
                    for (var i in json.data) {
                        $list += '<p class="cate_list">' + json.data[i].dis_name + '</p>';
                        $options += '<option value="' + json.data[i].did + '">' + json.data[i].dis_name + '</option>';
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