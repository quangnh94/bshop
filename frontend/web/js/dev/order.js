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
                var length = Object.keys(result.data).length;
                $('.ajax-cart-quantity').text(length);
            }
        }
    });
};

order.viewCart = function () {
    $.ajax({
        url: baseUrl + 'order/viewcart',
        type: "POST",
        headers: {
            csrfToken: $("meta[name='csrf-token']").attr('content'),
            auth: 'quang.nh94@gmail.com',
            code: '01216392457'
        },
        success: function (result) {
            if (result.success) {
                popup.open('popup-viewcart', 'ĐƠN HÀNG CỦA BẠN', tmpl('/order/checkout.tpl', result), [], 'modal-lg');
            }
        }
    });
};
