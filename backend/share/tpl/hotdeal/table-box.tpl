<div class="box">
    <div class="box-header">
        <h3 class="box-title">Kết quả tìm kiếm</h3>
    </div><!-- /.box-header -->
    <div class="box-body no-padding">
        <table class="table table-striped table-bordered">
            <tr>
                <th class=""></th>
                <th class="text-center">Ảnh sản phẩm</th>
                <th class="text-center" style="width: 250px;">Tên sản phẩm</th>
                <th class="text-center">Giá cả</th>
            </tr>
            <% if(typeof data != 'undefined' && data != ''){ %>
            <% $.each(data, function(key, val){ %>
            <tr auth-hotdeal-id="<%= typeof val.id != 'undefined' ? val.id : '' %>">
                <td class="text-center"><input class="vertical-middle" type="checkbox" value="" name="checkdata" /></td>
                <td class="text-center"><img width="60" src="<%= pathOther %>/<%= typeof val.images[0] != 'undefined' ? val.images[0] : ''  %>"/></td>
                <td class="text-center">
                    <p><%= typeof val.item_name != 'undefined' ? val.item_name : ''  %> [ID - <%= typeof val.id != 'undefined' ? val.id : '' %>]</p>
                </td>
                <td class="text-center">
                    <% if(typeof val.root_price != 'undefined'){ %>
                    <p class="text-center"><%= format(val.root_price) %> đ</p>
                    <% } %>
                    <% if(typeof val.sell_price != 'undefined'){ %>
                    <p class="text-center"><%= format(val.sell_price) %> đ</p>
                    <% } %>
                </td>
            </tr>
            <% }); %>
            <% }else { %>
            <tr class="text-center">
                <td style="color: red;" class="text-center" colspan="4">Xin lỗi không tìm thấy dữ liệu tương ứng ! Vui lòng thử lại</td>
            </tr>
            <% } %>
        </table>
    </div><!-- /.box-body -->
</div><!-- /.box -->

