<% if(typeof data != 'undefined'){ %>
<tr property-auth='<%= data.id %>'>
    <td class="text-center vertical-middle"><i onclick="property.removeP('<%= data.id %>')" style="cursor: pointer"  class="fa fa-trash"></i></td>
    <td class="text-center vertical-middle bold-text"><%= typeof data.property_name != 'undefined' ? data.property_name : ''  %></td>
    <td class="text-center vertical-middle">
        <% if(data.active == 1){ %>
        <span class="label label-success">Hoạt động</span>
        <% }else { %>
        <span class="label label-danger">Tạm khóa</span>
        <% } %>
    </td>
    <td class="text-center vertical-middle bold-text">
        <button onclick="" style="width: 80px;" type="button"><i class="fa fa-pencil"></i> Sửa</button>
        <button style="width: 80px;" onclick="" type="button"><i class="fa fa-usb"></i> Giá trị</button>
    </td>
</tr>
<% } %>