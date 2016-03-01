<div class="col-sm-6 col-md-4">
    <div class="thumbnail" auth-id='<%= data.id %>'>
        <img style="width: 206px; height: 160px;" src="<%= pathOther + data.router %>" alt="Ảnh đẹp :))">
        <div class="caption" style="text-align: center">
            <a onclick="image.remove('<%= data.id %>');" class="btn btn-danger" role="button"><i class="fa fa-trash"></i> Xóa ảnh</a>
        </div>
    </div>
</div>