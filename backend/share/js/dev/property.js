var property = {};

property.show = function (id) {
    $.ajax({
        url: baseUrl + 'items/genprop',
        type: "POST",
        data: {id: id},
        success: function (result) {
            if (result.success) {
                result.id = id;
                popup.open('property-popup', 'Thuộc tính sản phẩm', tmpl('/property/property.tpl', result), [
                    {
                        title: '<span><i class="fa fa-random"></i> Hủy bỏ<span>',
                        style: 'btn btn-danger',
                        fn: function () {
                            popup.close('property-popup');
                        }
                    }
                ]);
            }
        }
    });
};

property.addprop = function () {
    var data = {
        active: $('input[name=active]').is(':checked') ? 1 : 0,
        item_id: $('div.id-xyz').attr('item-id'),
        property_name: $('input[name=property_name]').val(),
        id: property.idP != null ? property.idP : ''
    };

    $.ajax({
        url: baseUrl + 'items/addprop',
        type: "POST",
        data: data,
        success: function (result) {
            if (result.success) {
                if (property.idP == null) {
                    var html = tmpl('/property/proptr.tpl', result);
                    $('.property_xyz').append(html);
                    $('input[name=property_name]').val('');
                    $('input[name=active]').prop('checked', false);
                } else {
                    var id = property.idP;
                    $('.add-button-pop').show();
                    $('.edit-button-pop').hide();
                    $('input[name=property_name]').val('');
                    $('input[name=active]').prop('checked', false);
                    $('tr[property-auth=' + id + ']').css('background', '#dff0d8');
                    $('tr[property-auth=' + id + '] .auth-text-pop').text(result.data.property_name);
                    if ($('tr[property-auth=' + id + '] .auth-check-pop')) {
                        
                    }
                    setTimeout(function () {
                        $('tr[property-auth=' + id + ']').css('background', '#fff');
                    }, 2000);
                    property.idP = null;
                }
            }
        }
    });
};

property.valid = function () {

};

property.removeP = function (id) {
    var cf = confirm("Chắc chắn muốn xóa thuộc tính này ?");
    if (cf) {
        $.ajax({
            url: baseUrl + 'items/premove',
            type: "POST",
            data: {id: id},
            success: function (result) {
                if (result.success) {
                    var key = $('tr[property-auth=' + id + ']').css('background', '#f2dede');
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

property.idP = null;
property.Pedit = function (id, current) {
    property.idP = id;
    $.ajax({
        url: baseUrl + 'items/getp',
        type: "POST",
        data: {id: id},
        success: function (result) {
            if (result.success) {
                $('.add-button-pop').hide();
                $('.edit-button-pop').show();
                $('input[name=property_name]').val(result.data.property_name);
                if (result.data.active == 1) {
                    $('input[name=active]').prop('checked', 'checked');
                } else {
                    $('input[name=active]').prop('checked', false);
                }
            }
        }
    });
};