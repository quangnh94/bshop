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
            <% if(typeof data != 'undefined' && data != ''){ %>
            <% $.each(data , function(key, val){ %>
            <tr>
                <td class="cart-product">
                    <a href="#"><img alt="Blouse" src="<%= baseUrl + 'uploads/' + val.images  %>"></a>
                </td>
                <td class="cart-description">
                    <p class="product-name"><a href="#"><%= typeof val.name != 'undefined' ?  val.name : '' %></a></p>
                    <small><a href="#">Size : S, Color : Orange</a></small>
                </td>
                <td class="cart-unit ">
                    <ul class="price text-center">
                        <li class="price">$16.51</li>
                    </ul>
                </td>
                <td class="cart_quantity text-center">
                    <div class="cart-plus-minus-button">
                        <input class="cart-plus-minus" type="text" name="qtybutton" value="<%= typeof val.quantity != 'undefined' ? val.quantity : 0 %>">
                        <div class="dec qtybutton">-</div><div class="inc qtybutton">+</div></div>
                </td>
                <td class="cart-total">
                    <span class="price text-center">$16.51</span>
                </td>
            </tr>
            <% }); %>
            <% } %>
        </tbody>
    </table>
</div>
