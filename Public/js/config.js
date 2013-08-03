seajs.config({
    plugins: ['shim', 'text'],
    shim: {
        'jquery': {
            src: 'lib/jquery.min.js',
            exports: 'jQuery'
        },
        'ajaxupload': {
            src: 'lib/ajaxupload.js',
            exports: 'ajaxupload'
        }
    },
    alias: {
        'router': 'md/router.js',
        'rander': 'md/rander.js',
        'nav'   : 'md/nav.js',
        'com_e' : 'md/common_event.js',

        'inter_dir'         : 'inter/inter_dir',
        'inter_infopage'    : 'inter/inter_infopage',
        'inter_articlepage' : 'inter/inter_articlepage',
        'inter_template'    : 'inter/inter_template',
        'inter_deploy'      : 'inter/inter_deploy',
        'inter_files'       : 'inter/inter_files',
        'inter_settings'    : 'inter/inter_settings',

        'ueditor_config': '/plugin/ueditor/ueditor.config.js',
        'ueditor_all'   : '/plugin/ueditor/ueditor.all.min.js'
    }
});