define(function(require, exports, module) {
    var $ = require('jquery');

    var speed = 150;

    var initOpenSlide = function() {
        $('#nav').on('click', '.nav_h1', function() {
            var $subnav = $(this).siblings().eq(0);
            if ($subnav.length !== 0) {
                if ($subnav.hasClass('nav_subnav_show')) {
                    $subnav.removeClass('nav_subnav_show');
                    setTimeout(function() {
                        $subnav.stop().slideUp(speed);
                    }, speed);
                } else {
                    $subnav.stop().slideDown(speed, function() {
                        $subnav.addClass('nav_subnav_show');
                    });
                }
            }
        });
    };

    exports.init = function() {
        initOpenSlide();
    };
});