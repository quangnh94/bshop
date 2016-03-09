<% if(typeof data != 'undefined'){ %>
<tr property-auth='<%= data.id %>'>
    <td class="text-center vertical-middle"><i onclick="property.removeP('<%= data.id %>')" style="cursor: pointer"  class="fa fa-trash"></i></td>
    <td class="text-center vertical-middle bold-text"><%= typeof data.property_name != 'undefined' ? data.property_name : ''  %></td>
    <td class="text-center vertical-middle">
        <% if(data.active == 1){ %>
        <span class="label label-success auth-check-pop">Hoạt động</span>
        <% }else { %>
        <span class="label label-danger auth-check-pop">Tạm khóa</span>
        <% } %>
    </td>
    <td class="text-center vertical-middle bold-text">
        <button onclick="property.Pedit('<%= data.id %>', 'value')" style="width: 80px;" type="button"><i class="fa fa-pencil"></i> Sửa</button>
    </td>
</tr>
<% } %>