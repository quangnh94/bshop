var order = {};

order.init = function () {

};

order.addCart = function (id) {
    var color = $('.prop-color li').hasClass('has-check-prop');
    var size = $('.prop-size li').hasClass('has-check-prop');

    if (!color || !size) {
        alert("Vui lòng chọn thuộc tính sản phẩm");
        return false;
    }

    var data = {
        color: $('.prop-color').find('.has-check-prop').attr('value-prop'),
        size: $('.prop-size').find('.has-check-prop').attr('value-prop'),
        quantity: $('.sing-pro-qty').val(),
        id: id
    };

    $.ajax({
        url: baseUrl + 'order/addcart',
        type: "POST",
        data: data,
        headers: {
            csrfToken: $("meta[name='csrf-token']").attr('content'),
            auth: 'quang.nh94@gmail.com',
            code: '01216392457'
        },
        success: function (result) {
            if (result.success) {

            }
        }
    });
};

