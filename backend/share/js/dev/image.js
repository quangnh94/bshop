var image = {};

image.init = function() {
    /* Bắt sự kiến hover của ảnh thì tạo nút remove ! */
    $('#box-images-preview').on('mouseenter', '.imageThumb', function() {

    }).on('mouseleave', '.imageThumb', function() {

    });
};

image.load = function(id, type) {
    $.ajax({
        url: baseUrl + 'image/get',
        type: "POST",
        data: {token: id, type: type},
        success: function(result) {
            if (result.success) {
                popup.open('imanager-popup', 'Quản lý hình ảnh', tmpl('/images/manager.tpl', result), [
                    {
                        title: '<span><i class="fa fa-reply-all"></i> Ẩn xuống<span>',
                        style: 'btn btn-primary',
                        fn: function() {
                            popup.close('imanager-popup');
                        }
                    }
                ]);

                $('#file-upload-img').on('change', function(e) {
                    e.preventDefault();
                    var ext = $('#file-upload-img').val().split('.').pop().toLowerCase();
                    if ($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
                        $('#image-alert-img').text('Vui lòng up file hình ảnh').css('color', '#a94442').show();
                        return false;
                    } else {
                        $('#image-alert-img').hide();
                    }

                    var files = null;
                    var data_form = null;

                    files = e.target.files;
                    data_form = new FormData();
                    $.each(files, function(key, value) {
                        data_form.append('file', value);
                    });
                    data_form.append('token', id);

                    $.ajax({
                        url: baseUrl + 'image/upload',
                        type: "POST",
                        data: data_form,
                        processData: false,
                        contentType: false,
                        success: function(resp) {
                            if (resp.success) {
                                var template = tmpl('/images/box-image.tpl', resp);
                                $('.multi-image:last-child').append(template);
                            }
                        }
                    });
                });
            }
        }
    });
};

image.remove = function(id) {
    var r = confirm("Bạn chắc chắn muốn xóa ảnh này ?");
    if (r) {
        $.ajax({
            url: baseUrl + 'image/remove',
            type: "POST",
            data: {id: id},
            success: function(result) {
                if (result.success) {
                    $('div[auth-id=' + id + ']').remove();
                }
            }
        });
    }
};

image.render = function(token) {
    setTimeout(function() {
        $.ajax({
            url: baseUrl + 'image/get',
            type: "POST",
            data: {token: token},
            success: function(resp) {
                if (resp.success) {
                    $.each(resp.data, function() {
                        var html = '<div auth-id="' + this.id + '" class="image-each float-left"><span onclick="image.remove(\'' + this.id + '\')" class="remove-img"></span><img class="imageThumb" src="' + pathOther + this.images_router + '" title="Ảnh upload"/></div>';
                        $('#box-images-preview').append(html);
                    });
                    $('#box-images-preview').append('<div class="both"></div>');
                }
            }
        });
    }, 300);
};