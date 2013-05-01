define(function(require, exports, module) {
    var $ = require('jquery');

    var sildeContain = function(tpl) {
        var $opage = $('#page');

        if ($opage.length > 0) {
            $opage.fadeOut(100, function() {
                $(this).remove();
                $('#main').append(tpl);
                $('#page').addClass('page_show');
            });
        } else {
            $('#main').append(tpl);
            $('#page').addClass('page_show');
        }
    };

    var randerPage = {
        '#index': function() {
            var tpl = require.async('/tpl/index.html', function(tpl) {
                sildeContain(tpl);
            });
        },
        '#files': function() {
            var tpl = require.async('/tpl/files.html', function(tpl) {
                sildeContain(tpl);
            });
        },
        '#settings': function() {
            var tpl = require.async('/tpl/settings.html', function(tpl) {
                sildeContain(tpl);
            });
        }
    };

    exports.paint = function(hash) {
        if (randerPage[hash] !== undefined) {
            randerPage[hash]();
        } else { // not exist, point to index
            location.hash = '#index';
        }
    };
});