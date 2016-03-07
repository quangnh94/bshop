var itemscate = {};

itemscate.init = function (id) {
    if (typeof id != 'undefined') {
        console.log(typeof id);
        setTimeout(function () {
            $.each($('option'), function () {
                if ($(this).val() == id)
                    $(this).remove();
            });

        }, 50);
    } else {
        $('input').keyup(function () {
            var event = $(this);
            delay(function () {
                var rep = confirm("Chắc chắn muốn thay đổi đường dẫn của danh mục này ?");
                if (rep) {
                    var id = $(event).attr('auth-category');
                    var val = $(event).val();
                    if (val == '') {
                        popup.msg('Đường dẫn không được để trống');
                        return false;
                    }
                    $.ajax({
                        url: baseUrl + 'itemcategory/changelink',
                        type: "POST",
                        data: {id: id, value: val},
                        success: function (result) {
                            if (result.success) {
                                $(event).parent().parent().css('background', '#dff0d8');
                                setTimeout(function () {
                                    $(event).parent().parent().css('background', '#fff');
                                }, 2000);

                            }
                        }
                    });
                }
            }, 1000);
        });
    }
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
                    var key = $('tr[data-key=' + id + ']').css('background', '#f2dede');
                    setTimeout(function () {
                        key.fadeOut('slow', function () {
                            if ($('table tbody').find('tr').length == 0) {
                                $('table tbody').append('<tr><td colspan="6"><div class="empty"><span style="color:red">Không tồn tại dữ liệu tương ứng, vui lòng thử lại</span></div></td></tr>');
                            }
                        }).remove();
                    }, 2000);
                } else {
                    popup.msg(result.message);
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
