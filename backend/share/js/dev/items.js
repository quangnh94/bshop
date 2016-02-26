var items = {};

items.init = function () {
    $('#form-item').submit(function (e) {
        var imgs = $('.box-body[item-image=check-image]').find('img').length;
        if (imgs <= 0) {
            $('#image-alert').text('Thêm ảnh sản phẩm của bạn').css('color', '#a94442').show();
        }
    });
    $("#items-content").wysihtml5();

    var files = [];
    var data_form = null;

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
            $.each(e.target.files, function (i, val) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('<img />', {
                        class: 'imageThumb',
                        src: e.target.result,
                        title: e.target.name
                    }).insertAfter('#box-images-preview');
                };
                reader.readAsDataURL(val);
            });

            files.push(e.target.files);
            data_form = new FormData();
            $.each(files, function (key, value) {
                $.each(value, function (index, file) {
                    data_form.append('file ' + key, file);
                });
            });

            $.ajax({
                url: baseUrl + 'items/upload',
                type: "POST",
                data: data_form,
                processData: false,
                contentType: false,
                success: function (result) {

                }
            });
        });
    } else {
        alert("Trình duyệt không hỗ trợ");
    }
};