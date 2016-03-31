var search = {};

search.init = function (_id) {
    search.drawlByParams(_id);
    $(_id + ' button[action=submit-search]').click(function () {
        var params = base64.encode(JSON.stringify(search.getDataByForm(_id)));
        window.location.href = window.location.pathname + '?params=' + params;
    });

    $(_id + " button[action=reset]").click(function () {
        window.location.href = window.location.pathname;
    });
};

search.drawlByParams = function (_id) {
    var query = textutils.queryParam();
    if (typeof query.params == undefined || query.params == null || query.params == "") {
        return false;
    }
    var params = JSON.parse(base64.b64_to_utf8(query.params));
    var html = '<li><a href="javascript:;" class="btn-clear cursor-pointer">Tìm kiếm</a></li>';
    $.each(params, function (_key, _val) {
        $(_id + " [name=" + _key + "]").val(_val);
        var preText = $(_id + " [name=" + _key + "]").attr("placeholder");
        if ($(_id + " [name=" + _key + "]").prop("tagName") == 'SELECT') {
            if (_val >= 0) {
                html += '<li for="cat-1" class="cursor-pointer"><a href="javascript:;" class="btn-remove"><span class="value">' + preText + ' ' + $(_id + " [name=" + _key + "] option[value=" + _val + "]").text().toLowerCase() + '</span></a></li>';
            }
        } else {
            html += '<li for="cat-1" class="cursor-pointer"><a href="javascript:;" class="btn-remove"><span class="value">' + preText + ' ' + _val + '</span></a></li>';
        }
    });
    $("#search-view  ul").html(html);
    $("#search-view").fadeIn();
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