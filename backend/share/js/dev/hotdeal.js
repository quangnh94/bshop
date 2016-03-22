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

};