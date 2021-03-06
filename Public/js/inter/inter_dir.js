define(function(require, exports, module) {
    var $ = require('jquery');
    var page_type = null;

    var EditBox = {
        keys: {}, // map key to $option array index
        $option: [], // option cache
        addDirSubmit: function() {
            var form = {
                belong: $('#belong').val(),
                input_dir: $.trim($('#input_dir').val()),
                input_dir_alias: $.trim($('#input_dir_alias').val())
            };

            // params check
            $('#dir_editbox').find('.m_text_error').removeClass('m_text_error');
            for (var k in form) {
                if (form[k] === '') {
                    $('#' + k).addClass('m_text_error').focus();
                    return false;
                }
            }

            $.ajax({
                url: '/dir/add',
                data: {
                    parent      : form.belong,
                    name        : form.input_dir,
                    name_alias  : form.input_dir_alias,
                    type        : page_type
                },
                success: function(json) {
                    if (json.status === 0) {
                        EditBox.closeEditBox();
                        reloadList();
                        $('#edit_btn, #del_btn').addClass('m_btn_disable');
                    }
                }
            });
        },
        editDirSubmit: function() {
            var form = {
                did: $('.cate_list_select').eq(0).attr('data-id'),
                input_dir: $.trim($('#input_dir').val()),
                input_dir_alias: $.trim($('#input_dir_alias').val())
            };

            // params check
            $('#dir_editbox').find('.m_text_error').removeClass('m_text_error');
            for (var k in form) {
                if (form[k] === '') {
                    $('#' + k).addClass('m_text_error').focus();
                    return false;
                }
            }

            $.ajax({
                url: '/dir/edit',
                data: {
                    did         : form.did,
                    name        : form.input_dir,
                    name_alias  : form.input_dir_alias,
                    type        : page_type
                },
                success: function(json) {
                    if (json.status === 0) {
                        EditBox.closeEditBox();
                        reloadList();
                        $('#edit_btn, #del_btn').addClass('m_btn_disable');
                    }
                }
            });
        },
        closeEditBox: function() {
            var $dir_editbox = $('#dir_editbox');
            if ($dir_editbox.length === 0) return;

            $dir_editbox.addClass('d_box_close');
            setTimeout(function() {
                $dir_editbox.remove();
            }, 400);
        },
        openEditBox: function(method) { // method: add, edit
            var methods = ['add', 'edit'];
            if (method === undefined && $.inArray(method, methods) === -1)
                method = 'add';

            require.async('/tpl/mbox/dir_editbox.html', function(tpl) {
                $('#page').append(tpl);
                $('#dir_editbox').addClass('d_box_show');
                $('#belong').html(EditBox.$options.join(''));

                // auto select
                var $select = $('.cate_list_select').eq(0);
                if ($select.length !== 0) {
                    var id = $select.attr('data-id');
                    $('#belong').val(id);
                }

                switch(method) {
                    case 'add':
                        $('#belong').removeAttr('disabled');
                        $('#dir_editbox_ok_btn').on('click', EditBox.addDirSubmit);
                        break;
                    case 'edit':
                        $('#belong').attr('disabled', 'true');
                        try {
                            $.ajax({
                                url: '/dir/get',
                                data: {
                                    did: id,
                                    type: page_type
                                },
                                success: function(json) {
                                    if (json.status === 0) {
                                        $('#input_dir').val(json.data.name);
                                        $('#input_dir_alias').val(json.data.name_alias);
                                    }
                                }
                            });               
                        } catch (e) {
                            
                        }

                        $('#dir_editbox_ok_btn').on('click', EditBox.editDirSubmit);
                        break;
                }
                $('#dir_editbox_close_btn').on('click', EditBox.closeEditBox);
                $('#dir_editbox_cancel_btn').on('click', EditBox.closeEditBox);
            });
        }
    };

    var PanelFunc = {
        btnDisWord: {
            'del_btn'       : 'Del',
            'del_btn_alarm' : 'Sure'
        },
        addFunc: function() {
            PanelFunc.restoreDelStatus();
            EditBox.openEditBox('add');
        },
        editFunc: function() {
            var $this = $(this);
            if ($this.hasClass('m_btn_disable')) {
                return;
            } else {
                PanelFunc.restoreDelStatus();
                EditBox.openEditBox('edit');
            }
        },
        deleteStatus: function() {
            var $this = $(this);
            if ($this.hasClass('m_btn_disable')) {
                return;
            } else if ($this.hasClass('m_btn_alarm')) {
                var $this = $('.cate_list_alarm:not([data-id=0])');
                var del_nodes = [];
                $this.each(function() {
                    var data_id = $(this).attr('data-id');
                    del_nodes.push(data_id);
                    EditBox.$options[EditBox.keys[data_id]] = undefined;
                });

                $.ajax({
                    url: '/dir/del',
                    data: {
                        dids: del_nodes.join(','),
                        type: page_type
                    },
                    success: function(json) {
                        if (json.status === 0) {
                            $this.addClass('cate_list_close');
                            setTimeout(function() {
                                $this.remove();
                                PanelFunc.restoreDelStatus();
                                $('#edit_btn, #del_btn').addClass('m_btn_disable');
                            }, 500);
                        }
                    }
                });
            } else {
                $this.addClass('m_btn_alarm').html(PanelFunc.btnDisWord['del_btn_alarm']);
                var $cate_list_cur = $('.cate_list_select').eq(0);
                var arr_del_nodes = [];

                arr_del_nodes.push($cate_list_cur.attr('data-id'));
                $cate_list_cur.addClass('cate_list_alarm');

                do {
                    $cate_list_cur = $cate_list_cur.next();
                    if ($cate_list_cur.length !== 0 && $.inArray($cate_list_cur.attr('data-parent'), arr_del_nodes) !== -1) {
                        arr_del_nodes.push($cate_list_cur.attr('data-id'));
                        $cate_list_cur.addClass('cate_list_alarm');
                    } else {
                        break;
                    }
                } while (true);
            }
        },
        resetDelBtn: function() {
            $('#del_btn').removeClass('m_btn_alarm').html(PanelFunc.btnDisWord['del_btn']);
        },
        restoreDelStatus: function() {
            this.resetDelBtn();
            $('.cate_list_alarm').removeClass('cate_list_alarm');
        }
    };

    var btnEvent = function() {
        $('#add_btn').off('click').on('click', PanelFunc.addFunc);
        $('#edit_btn').off('click').on('click', PanelFunc.editFunc);
        $('#del_btn').off('click').on('click', PanelFunc.deleteStatus);
    };

    var listEvent = function() {
        $('#cate_list_box').off('click').on('click', '.cate_list', function(e) {
            var $this = $(this);

            if (e.ctrlKey !== true) { // enter detail
                var dir_id = $this.attr('data-id');
                var ohash = location.hash;
                location.hash = ohash + '_' + dir_id;
            } else {
                EditBox.closeEditBox();
                if ($this.hasClass('cate_list_select')) {
                    return;
                } else {
                    $('.cate_list_select').removeClass('cate_list_select');
                    $this.addClass('cate_list_select');
                    $('#edit_btn, #del_btn').removeClass('m_btn_disable');
                    PanelFunc.restoreDelStatus();
                }
            }
        });
    };

    var reloadList = function() {
        $.ajax({
            url: '/dir/get',
            data: {type: page_type},
            success: function(json) {
                if (json.status === 0) {
                    var $list = '';
                    EditBox.keys = {};
                    EditBox.$options = [];
                    for (var i in json.data) {
                        $list += '<p class="cate_list" data-id="' + json.data[i].did + '" data-parent="' + json.data[i].parent + '">' + json.data[i].dis_name + '</p>';
                        // reset
                        EditBox.keys[json.data[i].did] = i;
                        EditBox.$options[i] = '<option value="' + json.data[i].did + '">' + json.data[i].dis_name + '</option>';
                    }
                    $('#cate_list_box').html($list);
                }
            }
        });
    };

    var initData = function() {
        reloadList();
    };

    var initEvent = function() {
        listEvent();
        btnEvent();
    };

    exports.init = function(type) {
        if (type === undefined || type === '')
            page_type = 'info';
        else
            page_type = type;
        
        initData();
        initEvent();
    };
});
