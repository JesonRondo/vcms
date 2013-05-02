seajs.config({
    plugins: ['shim', 'text'],
    shim: {
        'jquery': {
            src: 'lib/jquery.min.js',
            exports: 'jQuery'
        }
    },
    alias: {
        'router': 'md/router.js',
        'rander': 'md/rander.js',
        'nav'   : 'md/nav.js',
        'com_e' : 'md/common_event.js',

        'inter_dir': 'inter/inter_dir'
    }
});