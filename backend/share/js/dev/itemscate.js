var itemscate = {};

itemscate.init = function () {

};

itemscate.add = function () {
    $.ajax({
        url: baseUrl + 'itemcategory/getcate',
        type: "POST",
        success: function (result) {
            if (result.success) {
                popup.open('category-item-popup', 'Thêm mới danh mục', tmpl('/itemscategory/add.tpl', result), [
                    {
                        title: '<span><i class="fa fa-plus"></i> Thêm mới<span>',
                        style: 'btn btn-success',
                        fn: function () {
                            var category_name = $('input[name=category_name]').val();
                            if (category_name == '') {
                                $('.help-block-cate').show().text('Tên danh mục vui lòng không để trống');
                                return false;
                            } else
                                $('.help-block-cate').hide();

                            var data = {
                                category_name: category_name,
                                active: $('input[name=active]').is(':checked') ? 1 : 0,
                                parent_id: $('select[name=parent_id]').val()
                            };
                            $.ajax({
                                url: baseUrl + 'itemcategory/addnew',
                                type: "POST",
                                data: data,
                                success: function (resp) {
                                    if (resp.success) {

                                    }
                                }
                            });
                        }
                    },
                    {
                        title: '<span><i class="fa fa-reply-all"></i> Ẩn xuống<span>',
                        style: 'btn btn-primary',
                        fn: function () {
                            popup.close('category-item-popup');
                        }
                    }
                ]);
            }
        }
    });
};

itemscate.remove = function (id) {
    var resp = confirm("Chắc chắn muốn xóa danh mục này ?");
    if (resp) {
        $.ajax({
            url: baseUrl + 'itemcategory/remove',
            type: "POST",
            data: {id: id},
            success: function (result) {
                if (result.success) {

                }
            }
        });
    }
};

itemscate.changeActive = function (id) {
    $.ajax({
        url: baseUrl + 'itemcategory/changeactive',
        type: "POST",
        data: {id: id},
        success: function (result) {
            if (result.success) {
                if (result.data.active == 0) {
                    $('div[auth-id=' + id + '] i[auth-check=ck]').removeClass().addClass('fa fa-circle-o').css('color', 'white');
                } else {
                    $('div[auth-id=' + id + '] i[auth-check=ck]').removeClass().addClass('fa fa-check-circle').css('color', 'greenyellow');
                }
            }
        }
    });
};

$(function () {
    var $parent = $(".main-lvl-parent"),
            $level1 = $(".main-lvl-1"),
            $level2 = $(".main-lvl-2");


    $(".alert", $level1).draggable({
        containment: "document",
        helper: "clone",
        cursor: "move"
    });

    $parent.droppable({
        accept: ".main-lvl-1 > .alert",
        drop: function (event, ui) {
            var $drag = ui.draggable;
            $($parent).append($drag[0].outerHTML);
        }
    });
});