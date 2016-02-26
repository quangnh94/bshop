var textutils = {};

Number.prototype.toMoney = function (decimals, decimal_sep, thousands_sep) {
    var n = this,
            c = isNaN(decimals) ? 2 : Math.abs(decimals), //if decimal is zero we must take it, it means user does not want to show any decimal
            d = decimal_sep || '.', //if no decimal separator is passed we use the dot as default decimal separator (we MUST use a decimal separator)

            t = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep, //if you don't want to use a thousands separator you can pass empty string as thousands_sep value

            sign = (n < 0) ? '-' : '',
            //extracting the absolute value of the integer part of the number and converting to string
            i = parseInt(n = Math.abs(n).toFixed(c)) + '',
            j = ((j = i.length) > 3) ? j % 3 : 0;
    return sign + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '');
};

textutils.drawAlias = function (obj) {
    $("input[data-alias=alias]").val(textutils.createAlias($(obj).val()));
};

textutils.createAlias = function (str) {
    if (str === null || str === '')
        return '';
    return textutils.removeDiacritical(str).replace(/\W/g, "-").toLowerCase();
};

textutils.removeDiacritical = function (str) {
    str = str.replace(/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/g, "a");
    str = str.replace(/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/g, "e");
    str = str.replace(/(ì|í|ị|ỉ|ĩ)/g, "i");
    str = str.replace(/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/g, "o");
    str = str.replace(/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/g, "u");
    str = str.replace(/(ỳ|ý|ỵ|ỷ|ỹ)/g, "y");
    str = str.replace(/(đ)/g, "d");
    str = str.replace(/(À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)/g, "A");
    str = str.replace(/(È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)/g, "E");
    str = str.replace(/(Ì|Í|Ị|Ỉ|Ĩ)/g, "I");
    str = str.replace(/(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)/g, "O");
    str = str.replace(/(Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)/g, "U");
    str = str.replace(/(Ỳ|Ý|Ỵ|Ỷ|Ỹ)/g, "Y");
    str = str.replace(/(Đ)/g, "D");
    return str;
};

textutils.hashParam = function () {
    var urlParams;
    var match,
            pl = /\+/g, // Regex for replacing addition symbol with a space
            search = /([^&=]+)=?([^&]*)/g,
            decode = function (s) {
                return decodeURIComponent(s.replace(pl, " "));
            },
            query = $(location).attr("hash").replace('#', '').split("?")[1];
    if (typeof query == 'undefined') {
        return {};
    }
    urlParams = {};
    while (match = search.exec(query))
        urlParams[decode(match[1])] = decode(match[2]);
    return urlParams;
};

textutils.getsParams = function () {
    var urlParams;
    var match,
            pl = /\+/g, // Regex for replacing addition symbol with a space
            search = /([^&=]+)=?([^&]*)/g,
            decode = function (s) {
                return decodeURIComponent(s.replace(pl, " "));
            },
            query = $(location).attr('search').split("?");
    if (typeof query == 'undefined')
        return {};
    urlParams = {};
    while (match = search.exec(query))
        urlParams[decode(match[1])] = decode(match[2]);
    return urlParams;
};

textutils.queryParam = function () {
    var urlParams;
    var match,
            pl = /\+/g, // Regex for replacing addition symbol with a space
            search = /([^&=]+)=?([^&]*)/g,
            decode = function (s) {
                return decodeURIComponent(s.replace(pl, " "));
            },
            query = window.location.search.substring(1);
    urlParams = {};
    while (match = search.exec(query))
        urlParams[decode(match[1])] = decode(match[2]);
    return urlParams;
};

textutils.buildQuery = function (params) {
    var queryString = "";
    $.each(params, function (key, val) {
        if (typeof val != 'undefined' && val != null && val != "") {
            if (i === 1)
                queryString += "?";
            else
                queryString += "&";
            queryString += key + "=" + val;
            i++;
        }
    });
    return queryString == "" ? "?" : queryString;
};

textutils.formatTime = function (time, format) {
    var months = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
    time = parseFloat(time * 1000);
    var a = new Date(time);
    var year = a.getFullYear();
    var month = months[a.getMonth()];
    var day = a.getDate();
    var hour = a.getHours();
    var minute = a.getMinutes();
    var second = a.getSeconds();
    var time = "";
    if (format === 'day') {
        time = day + "/" + month + "/" + year;
    } else if (format === 'hour') {
        time = hour + ":" + minute + " " + day + "/" + month + "/" + year;
    } else if (format === 'time') {
        time = day + "/" + month + "/" + year + " " + hour + ":" + minute + ":" + second;
    } else {
        time = hour + ":" + minute + ":" + second + " " + day + "/" + month + "/" + year;
    }
    return time;
};

textutils.percentFormat = function (startPrice, sellPrice) {
    var percent = 0;
    if (startPrice > sellPrice)
        percent = (startPrice - sellPrice) / startPrice;

    percent *= 100;
    percent = Math.ceil(percent);
    return percent.toMoney(0, ',', '.');
};

textutils.ucfirst = function (str) {
    str += '';
    var f = str.charAt(0)
            .toUpperCase();
    return f + str.substr(1);
};

textutils.timeConverter = function (time) {
    var a = new Date(time);
    var months = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
    var year = a.getFullYear();
    var month = months[a.getMonth()];
    var date = a.getDate();
    var hour = a.getHours();
    var min = a.getMinutes();
    var sec = a.getSeconds();
    var time = +hour + ':' + min + ' - ' + date + '/' + month + '/' + year;
    return time;
};

textutils.getQueryVariable = function () {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (m, key, value) {
        vars[key] = value;
    });
    return vars;
};
textutils.getUrlParameter = function (sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam)
        {
            return sParameterName[1];
        }
    }
}
textutils.formatPriceVND = function (num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
};

textutils.formatNumber = function (number) {
    var number = number.toFixed(2) + '';
    var x = number.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
};

textutils.imagesThumb = function (image, width) {
    var date = $('.box-info').attr('date-data');
    return "https://static8.zamba.vn/thumb_w/" + width + "/muare/phodocu/" + date + '/' + image;
};

textutils.setCookie = function (name, value, days) {
    var expires;
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toGMTString();
    }
    else {
        expires = "";
    }
    document.cookie = name + "=" + value + expires + "; path=/";
};

textutils.getCookie = function (c_name) {
    if (document.cookie.length > 0) {
        c_start = document.cookie.indexOf(c_name + "=");
        if (c_start != -1) {
            c_start = c_start + c_name.length + 1;
            c_end = document.cookie.indexOf(";", c_start);
            if (c_end == -1) {
                c_end = document.cookie.length;
            }
            return unescape(document.cookie.substring(c_start, c_end));
        }
    }
    return "";
};

textutils.readCookieObj = function (name) {
    var result = document.cookie.match(new RegExp(name + '=([^;]+)'));
    result && (result = JSON.parse(result[1]));
    return result;
}

textutils.removeCookie = function (name) {
    document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
};

var delay = (function () {
    var timer = 0;
    return function (callback, ms) {
        clearTimeout(timer);
        timer = setTimeout(callback, ms);
    };
})();

textutils.suggestData = function (id) {
    var autocomplete;
    autocomplete = new google.maps.places.Autocomplete((document.getElementById(id)), {types: ['geocode']});

    directionsService = new google.maps.DirectionsService();
};
textutils.getLocation = function () {
    var address = $('.rd-title').attr('address-location');
    return address;
};

textutils.getAuth = function () {
    var auth = $('.time-thread').attr('auth-profile');
    return auth;
};

