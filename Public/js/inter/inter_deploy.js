define(function(require, exports, module) {
    var $ = require('jquery');

    var initEvent = function() {
        $('#deploy_btn').on('click', function() {
            $term = $('#term');
            $term.val('Waiting...');
            $.ajax({
                url: '/deploy',
                data: null,
                success: function(json) {
                    var data = json.data;
                    if (json.status === 0) {
                        $term.val('');
                        for (var i = 0, len = data.length; i < len; i++) {
                            $term.val($term.val() + data[i].dep_path + ' ............ ' + (data[i].st ? '[ok]' : '[failed]') + '\n');
                        }
                    } else {
                        $term.val('error: ' + json.status);
                    }
                }
            });
        });
        
        $('#outer_btn').on('click', function() {
            $term = $('#term');
            $term.val('Waiting...');
            $.ajax({
                url: '/deploy/runsh',
                data: null,
                success: function(json) {
                    var data = json.data;
                    if (json.status === 0) {
                        $term.val(json.data + '\nLook result after a while.');
                    } else {
                        $term.val('error: ' + json.status);
                    }
                }
            });
        });
    };

    exports.init = function() {
        initEvent();
    };
});
