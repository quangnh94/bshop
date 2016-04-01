var hotdeal = {};

hotdeal.init = function () {
    if (textutils.getCookie('save_hotdeal') != "") {
        var value = textutils.getCookie('save_hotdeal');
        $('select[name=hotdeal-choice]').val(value);
        hotdeal.resovel(value);
    }

    $('select[name=hotdeal-choice]').on('change', function () {
        var value = $(this).val();
        textutils.setCookie('save_hotdeal', value, 1);
        hotdeal.resovel(value);
    });
};

hotdeal.resovel = function (value) {
    if (value == 0) {
        $('.main-hotdeal').html('<p class="padding-global">Để bắt đầu , hãy chọn hotdeal box muốn chỉnh sửa. Hoặc tạo hotdeal box mới.</p>');
        return false;
    }
    $.ajax({
        url: baseUrl + 'hotdeal/get',
        type: "POST",
        data: {id: value},
        success: function (result) {
            if (result.success) {
                var html = tmpl('/hotdeal/box.tpl', result);
                $('.main-hotdeal').html(html);
            }
        }
    });
};

hotdeal.remove = function (id) {
    var result = confirm("Bạn có chắc chắn muốn xóa hotdeal box này ?");
    if (result) {
        $.ajax({
            url: baseUrl + 'hotdeal/remove',
            type: "POST",
            data: {id: id},
            success: function (result) {
                if (result.success) {
                    popup.msg(result.message);
                    $('select[name=hotdeal-choice]').val(0);
                    $('.main-hotdeal').html('<p class="padding-global">Để bắt đầu , hãy chọn hotdeal box muốn chỉnh sửa. Hoặc tạo hotdeal box mới.</p>');
                    textutils.removeCookie('save_hotdeal');
                    location.reload();
                }
            }
        });
    }
};

hotdeal.removeItem = function () {
    //Tạm chưa viết
};

hotdeal.searchBox = function () {
    popup.open('hotdeal-search', 'Tìm kiếm sản phẩm', tmpl('/hotdeal/box-search.tpl'), [
        {
            title: '<span><i class="fa fa-pencil"></i> Chọn sản phẩm<span>',
            style: 'btn btn-success',
            fn: function () {
                var data = $('#search-box-hotdeal input[name=checkdata]');
                var check = 0;
                var list_id = [];
                $.each(data, function () {
                    if ($(this).is(":checked")) {
                        check++;
                        var id = $(this).parents('tr').attr('auth-hotdeal-id');
                        list_id.push(id);
                    }
                });

                if (check <= 0) {
                    alert("Vui lòng chọn sản phẩm");
                    return false;
                }

                var ids = list_id.join();
                $('#hotdeal-items').val(function (i, val) {
                    return val + (!val ? '' : ', ') + ids;
                });
                popup.close('hotdeal-search');
            }
        },
        {
            title: '<span><i class="fa fa-random"></i> Hủy bỏ<span>',
            style: 'btn btn-danger',
            fn: function () {
                popup.close('hotdeal-search');
            }
        }
    ]);
};

hotdeal.drawlSearch = function () {
    var data = {
        item_ids: $('#search-box-hotdeal input[name=item_ids]').val(),
        item_name: $('#search-box-hotdeal input[name=item_name]').val()
    };

    $.ajax({
        url: baseUrl + 'hotdeal/searchbox',
        type: "POST",
        data: data,
        beforeSend: function (xhr) {

        },
        complete: function (jqXHR, textStatus) {

        },
        success: function (result) {
            if (result.success) {
                var html = tmpl('/hotdeal/table-box.tpl', result);
                $('#search-box-hotdeal .table-box-place').html(html);
            } else {
                alert("Không tìm thấy dữ liệu tương ứng");
            }
        }
    });
};