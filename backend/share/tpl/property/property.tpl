<div class="box">
    <div class="box-header"></div><!-- /.box-header -->
    <div class="box-body no-padding id-xyz" item-id="<%= id %>">
        <table class="table table-striped table-bordered">
            <tbody class="property_xyz">
                <tr>
                    <th style="width: 10px"></th>
                    <th class="text-center">Tên thuộc tính</th>
                    <th class="text-center">Trạng thái</th>
                    <th class="text-center">Chức năng</th>
                </tr>
                <tr>
                    <td class="text-center vertical-middle"><i class="fa fa-paperclip"></i></td>
                    <td class="text-center vertical-middle"><input type="text" class="form-control" value="" placeholder="Tên thuộc tính" name="property_name" /></td>
                    <td class="text-center vertical-middle"><input type="checkbox" name="active"/></td>
                    <th class="text-center vertical-middle">
                        <button class="add-button-pop" onclick="property.addprop();" style="width: 80px;" type="button"><i class="fa fa-cloud-upload"></i> Thêm</button>
                        <button class="edit-button-pop" onclick="property.addprop();" style="width: 80px; display: none" type="button"><i class="fa fa-pencil"></i> Sửa</button>
                    </th>
                </tr>
                <% if(typeof data != 'undefined'){ %>
                <% $.each(data, function(){ %>
                <tr property-auth='<%= this.id %>'>
                    <td class="text-center vertical-middle"><i onclick="property.removeP('<%= this.id %>')" style="cursor: pointer" class="fa fa-trash"></i></td>
                    <td class="text-center vertical-middle bold-text auth-text-pop"><%= typeof this.property_name != 'undefined' ? this.property_name : ''  %></td>
                    <td class="text-center vertical-middle">
                        <% if(this.active == 1){ %>
                        <span class="label label-success auth-check-pop">Hoạt động</span>
                        <% }else { %>
                        <span class="label label-danger">Tạm khóa</span>
                        <% } %>
                    </td>
                    <td class="text-center vertical-middle bold-text">
                        <button style="width: 80px;" onclick="property.Pedit('<%= this.id %>', this)" type="button"><i class="fa fa-pencil"></i> Sửa</button>
                        <button style="width: 80px;" onclick="property.Vprop('<%= this.id %>')" type="button"><i class="fa fa-usb"></i> Giá trị</button>
                    </td>
                </tr>
                <% }); %>
                <% } %>
            </tbody>
        </table>
    </div>
</div>