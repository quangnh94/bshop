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
                popup.msg('Chọn sản phẩm thành công. Vui lòng kiểm tra giỏ hàng của bạn.');
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
                var length = Object.keys(result.data).length;
                result.sizeData = length;
                popup.open('popup-viewcart', 'GIỎ HÀNG CỦA BẠN', tmpl('/order/checkout.tpl', result), [], 'modal-lg');
            }
        }
    });
};

order.calcuWithQty = function (ud, sell_price, id) {
    var obj = $('tr[auth-current-id=' + id + '] input[name=qtybutton]');
    var drawl = $('tr[auth-current-id=' + id + '] .text-price-total');
    var total = parseFloat($('.total_price_cart').attr('total-hide'));

    switch (ud) {
        case 'up' :
            var add = parseInt(obj.val()) + 1;
            obj.val(add);
            var odd = parseFloat(sell_price) * add;
            total += parseFloat(sell_price);
            drawl.text(format(odd) + ' VNĐ');
            break;
        case 'down' :
            var rmv = parseInt(obj.val()) - 1;
            if (rmv == 0) {
                return false;
            }
            obj.val(rmv);
            var odd = parseFloat(sell_price) * rmv;
            total -= parseFloat(sell_price);
            drawl.text(format(odd) + ' VNĐ');
            break;
    }

    $('.total_price_cart').attr('total-hide', total);
    $('.total_price_cart span').text(format(total));


};
