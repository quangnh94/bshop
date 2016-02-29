<% if(typeof data != 'undefined'){ %>
<div class="box-manager-images">
    <div class="box box-danger" style="border-radius: 0px;">
        <div class="box-header with-border">
            <h3 class="box-title">Upload hình ảnh</h3>
        </div>
        <div class="box-body" item-image="check-image">
            <label for="file-upload" class="custom-file-upload">
                <i class="fa fa-cloud-upload"></i> Upload ảnh
            </label>
            <input id="file-upload" type="file" multiple="true" accept="image/*"/>
        </div><!-- /.box-body -->
    </div><!-- /.box -->
</div>
<div class="row">
    <% $.each(data, function(key, val){ %>
    <div class="col-sm-6 col-md-4" auth-id='<%= val.id %>' auth-data-token='<%= val.token  %>'>
        <div class="thumbnail">
            <img style="width: 206px; height: 160px;" src="<%= pathOther + val.images_router %>" alt="Ảnh đẹp :))">
            <div class="caption" style="text-align: center">
                <a onclick="image.remove('<%= val.id %>');" class="btn btn-danger" role="button"><i class="fa fa-trash"></i> Xóa ảnh</a>
            </div>
        </div>
    </div>
    <% }); %>
</div>
<% } %>