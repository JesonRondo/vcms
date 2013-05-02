define(function(require, exports, module) {
    var $ = require('jquery');

    var sildeContain = function(tpl, cb) {
        var $opage = $('#page');

        if ($opage.length > 0) {
            $opage.fadeOut(100, function() {
                $(this).remove();
                $('#main').append(tpl);
                $('#page').addClass('page_show');

                if (typeof cb === 'function') cb();
            });
        } else {
            $('#main').append(tpl);
            $('#page').addClass('page_show');

            if (typeof cb === 'function') cb();
        }
    };

    var randerPage = function(hash) {
        switch (hash) {
            case '#index':
                require.async('/tpl/index.html', function(tpl) {
                    sildeContain(tpl);
                });
                break;
            case '#files':
                require.async('/tpl/files.html', function(tpl) {
                    sildeContain(tpl);
                });
                break;
            case '#settings':
                require.async('/tpl/settings.html', function(tpl) {
                    sildeContain(tpl);
                });
                break;
            case '#dir_info':
                require.async('/tpl/dir_info.html', function(tpl) {
                    sildeContain(tpl, function() {
                        require.async('inter_dir', function(inter_dir) {
                            inter_dir.initEvent();
                        });
                    });
                });
                break;
            case '#dir_article':
                require.async('/tpl/dir_article.html', function(tpl) {
                    sildeContain(tpl, function() {
                        require.async('inter_dir', function(inter_dir) {
                            inter_dir.initEvent();
                        });
                    });
                });
                break;
            default:
                location.hash = '#index';
                break;
        }
    };

    exports.paint = function(hash) {
        randerPage(hash);
    };
});