define(function(require, exports, module) {
    var router = require('router');
    var com_e  = require('com_e');
    var nav    = require('nav');

    router.start();
    com_e.init();
    nav.init();
});