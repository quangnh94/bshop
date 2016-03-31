var search = {};

search.init = function (_id) {
    $(_id + ' button[action=submit-search]').click(function () {
        var params = JSON.stringify(search.getDataByForm(_id));
        window.location.href = window.location.pathname + '?params=' + params;
    });
};

search.getDataByForm = function (_id) {
    var data = {};
    $(_id).find('input, select, textarea').each(function () {
        if ($(this).attr('type') === 'checkbox') {
            if ($(this).is(':checked')) {
                data[$(this).attr('name')] = true;
            } else {
                data[$(this).attr('name')] = false;
            }
        } else if ($(this).attr('type') === 'radio') {
            if ($(this).is(':checked')) {
                data[$(this).attr('name')] = $(this).val();
            }
        } else {
            if ($(this).val() !== '' && typeof $(this).attr('name') != 'undefined') {
                if (isNaN($(this).val())) {
                    data[$(this).attr('name')] = $(this).val();
                } else {
                    data[$(this).attr('name')] = parseFloat($(this).val());
                }
            }
        }
    });
    return data;
};