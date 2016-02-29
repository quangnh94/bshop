var image = {};

image.init = function () {
    $('#file-upload').on('change', function (e) {
        e.preventDefault();
        var ext = $('#file-upload').val().split('.').pop().toLowerCase();
        if ($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            $('#image-alert').text('Vui lòng up file hình ảnh').css('color', '#a94442').show();
            return false;
        } else {
            $('#image-alert').hide();
        }

        var files = null;
        var data_form = null;

        files = e.target.files;
        data_form = new FormData();
        $.each(files, function (key, value) {
            data_form.append('file', value);
        });

        $.ajax({
            url: baseUrl + 'image/upload',
            type: "POST",
            data: {id: 1, key: data_form},
            processData: false,
//            contentType: false,
            success: function (result) {
                if (result.success) {

                }
            }
        });
    });
};

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
