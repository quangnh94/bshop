<div class="table-responsive">
    <table class="table table-bordered" id="cart-summary">
        <thead>
            <tr>
                <th class="cart-product"></th>
                <th class="cart-description">Chi tiết sản phẩm</th>
                <th class="cart-unit text-center">Đơn giá</th>
                <th class="cart_quantity text-center" style="width: 150px;">Số lượng</th>
                <th class="cart-total text-center">Tổng tiền</th>
            </tr>
        </thead>
        <tbody>
            <% if(typeof data != 'undefined' && sizeData > 0){ %>
            <% var total_price = 0; %>
            <% $.each(data , function(key, val){ %>
            <tr auth-current-id='<%= val.item_id %>'>
                <td class="cart-product">
                    <a target="_blank" href="<%= component.buildUrl(val.item_id, val.name, 'san-pham') %>"><img alt="Blouse" src="<%= baseUrl + 'uploads/' + val.images  %>"></a>
                </td>
                <td class="cart-description">
                    <p class="product-name"><a target="_blank" href="<%= component.buildUrl(val.item_id, val.name, 'san-pham') %>"><%= typeof val.name != 'undefined' ?  val.name : '' %></a></p>
                    <small>
                        <% var prop =  JSON.parse(val.property) %>
                        <% $.each(prop, function(k , v){ %>
                        <p><%= capitalizeFirstLetter(k) %> : <%= v %></p>
                        <% }); %>
                    </small>
                </td>
                <td class="cart-unit ">
                    <ul class="price text-center">
                        <li class="price">Giá gốc : <%= format(val.root_price) %> VNĐ</li>
                        <li class="price" root-price-check=''>Giá bán : <%= format(val.sell_price) %> VNĐ</li>
                    </ul>
                </td>
                <td class="cart_quantity text-center">
                    <div class="cart-plus-minus-button">
                        <input class="cart-plus-minus" type="text" name="qtybutton" value="<%= typeof val.quantity != 'undefined' ? val.quantity : 0 %>">
                        <div class="dec qtybutton" onclick="order.calcuWithQty('down', '<%= val.sell_price %>', '<%= val.item_id %>');">-</div><div class="inc qtybutton" onclick="order.calcuWithQty('up', '<%= val.sell_price %>', '<%= val.item_id %>');">+</div></div>
                </td>
                <td class="cart-total">
                    <span class="price text-center">
                        <p class="text-price-total">
                            <% var cal = parseFloat(val.sell_price * val.quantity); %>
                            <% total_price += cal; %>
                            <%= format(cal) %> VNĐ
                        </p>
                    </span>
                </td>
            </tr>
            <% }); %>
            <% } else { %>
            <tr class="text-center">
                <td colspan="5">Giỏ hàng trống. Vui lòng mua hàng trong cửa hàng.</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
<% if(typeof data != 'undefined' && sizeData > 0){ %>
<div class="check-out-form">
    <div class="float-left"></div>
    <div class="float-right">
        <p class="total_price_cart" total-hide='<%= total_price %>'>Tổng tiền : <span><%= format(total_price) %></span> VNĐ</p>
        <a href="" class="button-check-out-cart">Đặt hàng và thanh toán</a>
    </div>
    <div style="clear: both"></div>
</div>
<% } %>
