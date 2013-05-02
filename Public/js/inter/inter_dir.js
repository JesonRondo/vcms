define(function(require, exports, module) {
    var $ = require('jquery');

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

            $('#dir_editbox_close_btn').on('click', closeEditBox);
            $('#dir_editbox_cancel_btn').on('click', closeEditBox);
        });
    };

    var listEvent = function() {
        $('.cate_list').off('click').on('click', function() {
            closeEditBox();
            if ($(this).hasClass('cate_list_select')) {
                return;
            } else {
                $('.cate_list_select').removeClass('cate_list_select');
                $(this).addClass('cate_list_select');
            }
        });
    };

    var btnEvent = function() {
        $('#add_btn').off('click').on('click', openEditBox);
        $('#edit_btn').off('click').on('click', openEditBox);
    };

    exports.initEvent = function() {
        listEvent();
        btnEvent();
    };
});