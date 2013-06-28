define(function(require, exports, module) {
    var $ = require('jquery');

    var openAttachmentBox = function() {
        var $attachmentlist = $('#attachmentlist');
        $.ajax({
            url: '/upload/get',
            success: function(json) {
                if (json.status === 0) {
                    var data = json.data;
                    var files = data.files;
                    var len = files.length;

                    if (len <= 0) return;
                    
                    var $list = [];
                    var upload_www = data.upload_www;
                    var preview_index = data.preview_index;
                    for (var i = 0; i < len; i++) {
                        $list.push('<li><a href="javascript:;" class="attachmentlist_item" data-path="' + upload_www + files[i] + '">');
                        $list.push('<img src="' + preview_index + files[i] + '" />');
                        $list.push('</a></li>');
                    }
                    $list = $list.join('');
                    $attachmentlist.html($list);
                    $attachmentlist.css('width', len * 100);
                }
            }
        });

        $('#attachmentbox').addClass('attachmentbox_open');
    };

    var menuEvent = function() {
        // add animate transition
        $('#menu').addClass('menu_animate');

        // opening
        $('#menu_open').on('click', function() {
            var $this = $(this);
            
            if ($this.hasClass('opening')) return;

            $this.addClass('opening');

            $('#menu').addClass('menu_show');

        });

        // menu close event
        $(document).on('click', function(e) {
            if (e.target.id !== 'menu_open' && $('#menu_open').hasClass('opening')) {
                $('#menu').removeClass('menu_show');
                $('#menu_open').removeClass('opening');
            }
        });

        // user info btn
        var $user_menu = $('#user_menu');
        $('#user_home').on('click', function() {
            if (!$user_menu.hasClass('user_menu_show'))
                $user_menu.addClass('user_menu_show')
                    .removeClass('user_menu_close');
        }).on('mouseleave', function() {
            if ($user_menu.hasClass('user_menu_show'))
                $user_menu.removeClass('user_menu_show')
                    .addClass('user_menu_close');
        }).on('click', '.user_menu_item', function() {
            var func = $(this).attr('data-fun');
            switch(func) {
                case 'attachment':
                    openAttachmentBox();
                    break;
                default:
                    break;
            }
        });

        // attachment box
        var $attachmentbox = $('#attachmentbox');
        var $attachmentlist = $('#attachmentlist');
        $('#attachmentbox_close').on('click', function() {
            $attachmentbox.removeClass('attachmentbox_open').removeClass('attachmentbox_showinfo');
            $attachmentlist.html('');
        });
        $attachmentlist.on('click', '.attachmentlist_item', function() {
            var $this = $(this);
            if ($this.hasClass('attachmentlist_item_select')) {
                return;
            } else {
                $attachmentlist.find('.attachmentlist_item_select').removeClass('attachmentlist_item_select');
                $this.addClass('attachmentlist_item_select');
            }

            if (!$attachmentbox.hasClass('attachmentbox_showinfo'))
                $attachmentbox.addClass('attachmentbox_showinfo');

            var path = $this.attr('data-path');
            var src = $this.find('img').attr('src');
            
            var img = new Image();
            img.src = src;

            $('#attachmentbox_info_path').html(path);
            $('#attachmentbox_info_size').html(img.width + ' * ' + img.height);
        });
    };

    exports.init = function() {
        menuEvent();
    };
});