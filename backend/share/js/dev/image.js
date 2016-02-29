var image = {};

image.load = function (id, type) {
    $.ajax({
        url: baseUrl + 'image/get',
        type: "POST",
        data: {token: id, type: type},
        success: function (result) {
            if (result.success) {
                popup.open('imanager-popup', 'Quản lý hình ảnh', tmpl('/images/manager.tpl', result), [
                    {
                        title: '<span><i class="fa fa-reply-all"></i> Ẩn xuống<span>',
                        style: 'btn btn-primary',
                        fn: function () {
                            popup.close('imanager-popup');
                        }
                    }
                ]);
            }
        }
    });
};

image.remove = function (id) {
    var r = confirm("Bạn chắc chắn muốn xóa ảnh này ?");
    if (r) {
        $.ajax({
            url: baseUrl + 'image/remove',
            type: "POST",
            data: {id: id},
            success: function (result) {
                if (result.success) {
                    $('div[auth-id=' + id + ']').remove();
                }
            }
        });
    }
};
