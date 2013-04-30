define(function(require, exports, module) {
    var $ = require('jquery');

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
    };

    exports.init = function() {
        menuEvent();
    };
});