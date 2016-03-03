<form id="form-item" action="" method="post" enctype="multipart/form-data">
    <div class="form-group" style="margin-bottom: 24px;">
        <label class="control-label">Tên danh mục</label>
        <input type="text" id="category_name" class="form-control" name="category_name" placeholder="Tên danh mục">
        <div class="help-block-cate" style="display: none; color: red"></div>
    </div>
    <div class="form-group" style="margin-bottom: 24px;">
        <label class="control-label">Cấp danh mục</label>
        <select class="form-control" name="parent_id">
            <option value="0">-- Danh mục cha</option>
            <% $.each(data, function(key, val){ %>
                <% if(val.parent_id == 0){ %>
                    <option value="<%= val.id %>">-- <%= val.category_name %></option>
                    <% $.each(data, function(key1, val1){ %>
                        <% if(val.id == val1.parent_id){ %>
                           <option value="<%= val1.id %>">-- -- <%= val1.category_name %></option>
                           <% $.each(data, function(key2, val2){ %>
                                <% if(val2.parent_id == val1.id){ %>
                                    <option value="<%= val2.id %>">-- -- -- <%= val2.category_name %></option>
                                <% } %>
                           <% }); %>
                        <% } %>
                    <% }); %>
                <% } %>
            <% }); %>
        </select>
    </div>
    <div class="form-group">
        <label>
            <input type="checkbox" id="active" name="active"> Trạng thái danh mục
        </label>
    </div>
</form>