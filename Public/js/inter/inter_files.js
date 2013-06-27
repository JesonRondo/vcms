define(function(require, exports, module) {
    var $ = require('jquery');
    require('ajaxupload');

    var refreshFilebox = function() {
        $filebox = $('#filebox');
        $.ajax({
            url: '/upload/get',
            data: null,
            success: function(json) {
                if (json.status === 0) {
                    var files = json.data;
                    var $list = [];
                    for (var i = 0, len = files.length; i < len; i++) {
                        var match = /\.([\w]*)/.exec(files);
                        var ext = match && match[1] ? match[1] : '';
                        switch(ext) {
                            case 'jpg':
                            case 'jpeg':
                            case 'gif':
                            case 'png':
                                $list.push('<li><a href="javascript:;" class="filebox_item">');
                                $list.push('<img src="' + files[i] + '" />');
                                $list.push('<span class="filebox_del" data-file="' + files[i] + '"></span>');
                                $list.push('</a></li>');
                                break;
                            default:
                                break;
                        }
                    }
                    $filebox.html($list.join(''));
                }
            }
        });
    };

    var initEvent = function() {
        // upload btn
        var upload = new AjaxUpload($('#upload_btn'), {
            action: '/upload',
            onSubmit: function(file, extension) {
                // uploading
            },
            onComplete: function(file, response) {
                // uploaded
                refreshFilebox();
            }
        });

        // del btn
        $('#filebox').on('click', '.filebox_del', function() {
            var $this = $(this);
            if ($this.hasClass('filebox_deling')) {
                var file = $this.attr('data-file');
                $.ajax({
                    url: '/upload/del',
                    data: {filename: file},
                    success: function(json) {
                        if (json.status === 0) {
                            $this.parent().parent().remove();   // remove this item
                        }
                    }
                });
            } else {
                $this.addClass('filebox_deling');
            }
        }).on('mouseleave', '.filebox_item', function() {
            $(this).find('.filebox_deling').removeClass('filebox_deling');
        });
    };

    exports.init = function() {
        refreshFilebox();
        initEvent();
    };
});