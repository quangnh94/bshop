var item = {};

item.init = function () {

};

item.loadProp = function (ids) {
    var ids = JSON.parse(ids);
    setTimeout(function () {
        $.ajax({
            url: baseUrl + 'detail/getpop',
            type: "POST",
            data: ids,
            success: function (result) {
                if (result.success) {
                    $.each(ids, function (k, v) {
                        var html = '';
                        $.each(result.data, function (key, val) {
                            if (val.parent_id == v) {
                                html += '<li value-prop="' + val.property_name + '" onclick="item.checkProp(this)"><a href="#thumbnail_' + val.property_name + '" data-toggle="tab"><span title="' + val.property_name + '" class="label" style="background:' + val.property_name + '">' + val.property_name + '</span></a></li>';
                            }
                        });
                        $('.properties-show[prop-itc=' + v + '] .single-product-prop ul').html(html);
                        $('.properties-show[prop-itc=' + v + '] .prop-color ul li span').text('');
                    });
                }
            }
        });
    }, 100);
};

item.checkProp = function (obj) {
    $(obj).parents('.single-product-prop').find('.ic-check').parent().css('border', '2px solid #ccc');
    $(obj).parents('.single-product-prop').find('.ic-check').remove();
    $(obj).append('<span style="display:block;" class="ic-check"></span>');
    $(obj).css('border', '2px solid #c00').addClass('has-check-prop');

};
