<div class="hot-deal-each">
    <div class="box box-success" style="border-radius: 0px;">
        <div class="box-header with-border">
            <h2 class="box-title bold-text"><%= data.name %></h2>
            <div class="dropdown float-right">
                <button title="Xử lý dealbox" class="btn btn-success dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cog"></i> Xử lý</button>
                <ul class="dropdown-menu dropdown-menu-right">
                    <li><a href="<%= baseUrl %>hotdeal/update?id=<%= data.id %>">Sửa box</a></li>
                    <li><a onclick="hotdeal.remove('<%= data.id %>')">Xóa box</a></li>
                </ul>
            </div>
            <div class="both"></div>
        </div>
        <div class="box-body">
            <div class="row">
                <% $.each(data.items, function(key, val){ %>
                <div class="col-sm-3 col-md-3">
                    <div class="thumbnail">
                        <img style="width: 100%; height: 250px;" src="<%= pathOther + val.images[0] %>" alt="Ảnh sản phẩm">
                        <div class="caption">
                            <h5 class="bold-text" style="display:inline-block; width:200px; white-space: nowrap; overflow:hidden !important; text-overflow: ellipsis;" title="<%= val.item_name %> - Mã sản phẩm : <%= val.id %>"><%= val.item_name %></h5>
                            <p>Giá gốc : <span class="bold-text"><%= format(val.root_price) %> đ</span></p>
                            <p>Giá bán : <span class="bold-text"><%= format(val.sell_price) %> đ</span></p>
                            <p><a href="#" class="btn btn-danger" role="button"><i class="fa fa-trash"></i> Xóa sản phẩm</a></p>
                        </div>
                    </div>
                </div>
                <% }); %>
            </div>
        </div>
    </div>
</div>