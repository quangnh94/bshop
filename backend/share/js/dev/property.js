var property = {};

property.show = function (id, type) {
    var data = {
        id: id,
        type: type
    };

    $.ajax({
        url: baseUrl + 'items/genprop',
        type: "POST",
        data: data,
        success: function (result) {
            if (result.success) {
                result.id = id;
                if (typeof type != 'undefined') {
                    popup.open('vproperty-popup', 'Giá trị thuộc tính sản phẩm', tmpl('/property/property_v.tpl', result), [
                        {
                            title: '<span><i class="fa fa-random"></i> Hủy bỏ<span>',
                            style: 'btn btn-danger',
                            fn: function () {
                                popup.close('vproperty-popup');
                            }
                        }
                    ]);
                } else {
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
        }
    });
};

property.addprop = function (type) {
    var data = {
        active: $('input[name=active]').is(':checked') ? 1 : 0,
        property_name: $('input[name=property_name]').val(),
        id: property.idP != null ? property.idP : '',
    };

    if (typeof type != 'undefined') {
        data.parent_id = $('div.id-zyx').attr('item-id');
        data.property_name = $('.vprop_data input[name=property_name]').val();
        data.active = $('.vprop_data input[name=active]').is(':checked') ? 1 : 0;
    } else {
        data.item_id = $('div.id-xyz').attr('item-id');
    }

    $.ajax({
        url: baseUrl + 'items/addprop',
        type: "POST",
        data: data,
        success: function (result) {
            if (result.success) {
                if (property.idP == null) {
                    if (typeof type == 'undefined') {
                        var html = tmpl('/property/proptr.tpl', result);
                        $('.property_xyz').append(html);
                        $('input[name=property_name]').val('');
                        $('input[name=active]').prop('checked', false);
                    } else {
                        var html = tmpl('/property/proptr_v.tpl', result);
                        $('.property_zyx').append(html);
                        $('.vprop_data input[name=property_name]').val('');
                        $('.vprop_data input[name=active]').prop('checked', false);
                    }
                } else {
                    var id = property.idP;
                    $('.add-button-pop').show();
                    $('.edit-button-pop').hide();
                    $('input[name=property_name]').val('');
                    $('input[name=active]').prop('checked', false);
                    $('tr[property-auth=' + id + ']').css('background', '#dff0d8');
                    $('tr[property-auth=' + id + '] .auth-text-pop').text(result.data.property_name);
                    if (result.data.active == 1) {
                        $('tr[property-auth=' + id + '] .auth-check-pop').removeClass('label label-danger').addClass('label label-success').text("Hoạt động");
                    } else {
                        $('tr[property-auth=' + id + '] .auth-check-pop').removeClass('label label-success').addClass('label label-danger').text("Tạm khóa");
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
property.Pedit = function (id, type) {
    property.idP = id;
    $.ajax({
        url: baseUrl + 'items/getp',
        type: "POST",
        data: {id: id},
        success: function (result) {
            if (result.success) {
                $('.add-button-pop').hide();
                $('.edit-button-pop').show();
                if (typeof type == 'undefined') {
                    $('input[name=property_name]').val(result.data.property_name);
                    if (result.data.active == 1) {
                        $('input[name=active]').prop('checked', 'checked');
                    } else {
                        $('input[name=active]').prop('checked', false);
                    }
                } else {
                    $('.vprop_data input[name=property_name]').val(result.data.property_name);
                    if (result.data.active == 1) {
                        $('.vprop_data input[name=active]').prop('checked', 'checked');
                    } else {
                        $('.vprop_data input[name=active]').prop('checked', false);
                    }
                }
            }
        }
    });
};

property.valid = function () {
    
};