define(function(require, exports, module) {
    var $ = require('jquery');

    var initPasswordFunc = function() {
        $('#set_pwd_btn').on('click', function() {
            var $oldpwd = $('#set_pwd');
            var $newpwd = $('#set_npwd');
            var $rnewpwd = $('#set_rnpwd');

            var oldpwd = $oldpwd.removeClass('m_text_error').val();
            var newpwd = $newpwd.removeClass('m_text_error').val();
            var rnewpwd = $rnewpwd.removeClass('m_text_error').val();

            if (oldpwd === '') {
                $oldpwd.addClass('m_text_error').focus();
                return;
            }
            if (newpwd === '') {
                $newpwd.addClass('m_text_error').focus();
                return;
            }
            if (rnewpwd === '' || (newpwd !== rnewpwd)) {
                $rnewpwd.addClass('m_text_error').focus();
                return;
            }

            $.ajax({
                url: '/login/chpwd',
                data: {
                    opwd: oldpwd,
                    npwd: newpwd
                },
                type: 'POST',
                success: function(json) {
                    var code = json.status;
                    switch(code) {
                        case 10100:
                            $oldpwd.addClass('m_text_error').focus();
                            break;
                        case 0:
                            location.href = '/login/logout';
                            break;
                    }
                }
            });
        });
    };

    var initFunc = function() {
        initPasswordFunc();
    };

    exports.init = function() {
        initFunc();
    };
});