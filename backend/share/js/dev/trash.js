/**
 * Hiển thị ảnh luôn với trên JS - Trường hợp này không thể sử dụng ảnh với CKEDITOR - ITEMS
 */
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

