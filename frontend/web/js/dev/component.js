var component = {};

component.buildUrl = function (id, title, action) {
    if (action == 'san-pham') {
        return baseUrl + action + '-' + textutils.createAlias(title) + '-' + id + '.html';
    }
};