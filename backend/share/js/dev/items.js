var items = {};

items.init = function () {
    $('#form-item').submit(function (e) {
        var imgs = $('.box-body[item-image=check-image]').find('img').length;
        if (imgs <= 0) {
            $('#image-alert').text('Thêm ảnh sản phẩm của bạn').css('color', '#a94442').show();
            return false;
        }
    });

    setTimeout(function () {
        var root = $('#items-root_price').val();
        var sell = $('#items-sell_price').val();
        if (root != '' && sell != '') {
            $('#items-root_price').val(format(root));
            $('#items-sell_price').val(format(sell));
        }
    }, 500);

    $("#items-content").wysihtml5();
    if (window.File && window.FileList && window.FileReader) {
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

            var url = null;
            if ($('#file-upload').attr('type-upload') == 'update') {
                var token = $('.box-body').attr('token-accept');
                data_form.append('token', token);
                url = baseUrl + 'image/upload';
            } else
                url = baseUrl + 'items/upload';

            $.ajax({
                url: url,
                type: "POST",
                data: data_form,
                processData: false,
                contentType: false,
                success: function (result) {
                    if (result.success) {
                        var html = '<div auth-id="' + result.data.id + '" class="image-each float-left"><span onclick="image.remove(\'' + result.data.id + '\')" class="remove-img"></span><img class="imageThumb" src="' + pathOther + result.data.images_router + '" title="Ảnh upload"/></div>';
                        $('#box-images-preview').append(html);
                    }
                }
            });
        });
    } else {
        alert("Trình duyệt không hỗ trợ");
    }
};

items.remove = function (id) {
    var resp = confirm("Bạn chắc chắn muốn xóa sản phẩm này ?");
    if (resp) {
        $.ajax({
            url: baseUrl + 'items/remove',
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
                }
            }
        });
    }

};