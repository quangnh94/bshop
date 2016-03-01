var items = {};

items.init = function () {
    $('#form-item').submit(function (e) {
        var imgs = $('.box-body[item-image=check-image]').find('img').length;
        if (imgs <= 0) {
            $('#image-alert').text('Thêm ảnh sản phẩm của bạn').css('color', '#a94442').show();
            return false;
        }
    });
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
                        $('<img />', {
                            class: 'imageThumb',
                            src: pathOther + result.data.router,
                            title: 'Ảnh upload'
                        }).insertAfter('#box-images-preview');
                    }
                }
            });
        });
    } else {
        alert("Trình duyệt không hỗ trợ");
    }
};