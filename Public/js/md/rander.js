define(function(require, exports, module) {
    var $ = require('jquery');

    var sildeContain = function(t, f) {
        require.async(t, function(tpl) {
            var $opage = $('#page');

            if ($opage.length > 0) {
                $opage.fadeOut(100, function() {
                    $(this).remove();
                    $('#main').append(tpl);
                    $('#page').addClass('page_show');

                    if (typeof f === 'function') f();
                });
            } else {
                $('#main').append(tpl);
                $('#page').addClass('page_show');

                if (typeof f === 'function') f();
            }
        });
    };

    var randerPage = function(hash) {
        switch (hash) {
            case '#index':
                sildeContain('/tpl/index.html');
                break;
            case '#files':
                sildeContain('/tpl/files.html', function() {
                    require.async('inter_files', function(inter_files) {
                        inter_files.init();
                    });
                });
                break;
            case '#settings':
                sildeContain('/tpl/settings.html', function() {
                    require.async('inter_settings', function(inter_settings) {
                        inter_settings.init();
                    });
                });
                break;
            case '#deploy':
                sildeContain('/tpl/deploy.html', function() {
                    require.async('inter_deploy', function(inter_deploy) {
                        inter_deploy.init();
                    });
                });
                break;
            case '#template':
                sildeContain('/tpl/template.html', function() {
                    require.async('inter_template', function(inter_template) {
                        inter_template.init();
                    });
                });
                break;
            case '#dir_info':
                sildeContain('/tpl/dir_info.html', function() {
                    require.async('inter_dir', function(inter_dir) {
                        inter_dir.init('info');
                    });
                });
                break;
            case '#dir_article':
                sildeContain('/tpl/dir_article.html', function() {
                    require.async('inter_dir', function(inter_dir) {
                        inter_dir.init('article');
                    });
                });
                break;
            case '':
                location.hash = '#index';
                break;
            default:
                // detail
                if (hash.indexOf('#dir_info_') === 0 && !isNaN(hash.substr(10))) {
                    var info_id = hash.substr(10);
                    sildeContain('/tpl/info.html', function() {
                        require.async('inter_infopage', function(inter_infopage) {
                            inter_infopage.init(info_id);
                        });
                    });
                }

                if (hash.indexOf('#dir_article_') === 0 && !isNaN(hash.substr(13))) {
                    var article_id = hash.substr(13);
                    sildeContain('/tpl/info.html', function() {
                        require.async('inter_articlepage', function(inter_articlepage) {
                            inter_articlepage.init(article_id);
                        });
                    });
                }

                break;
        }
    };

    var clearPlugin = function() {
        // upload plugin
        var $upload = $('#upload');
        if ($upload.length !== 0) {
            $upload.parent().remove();
        }
    };

    exports.paint = function(hash) {
        clearPlugin();
        randerPage(hash);
    };

    exports.loadPage = function(tpl, cb) {
        sildeContain(tpl, cb);
    };
});
