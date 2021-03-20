<%-- 
    Document   : ShoppingCart
    Created on : Mar 11, 2021, 12:38:49 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="ShoppingCart.css" rel="stylesheet"/>
        <title>JSP Page</title>
    </head>
    <%@include file="../Share/header.jsp" %>
    <body>
        <h3 id="title">Shopping Cart</h3>
        <div id="main">
            <div id="cart-container">
                <table class="table" id="item">
                    <tr><td colspan="2">Product</td><td>Price</td><td>Quantity</td><td>Total</td></tr>
                    <tr><td id="productImage"><img src="testing1.jpg"/></td><td>Macmillan-Uk<br/>Hidden in Plain Sight</td><td>RM10.00</td><td>3</td><td>RM30.00</td></tr>
                    <tr><td id="productImage"><img src="testing1.jpg"/></td><td>Macmillan-Uk<br/>Hidden in Plain Sight</td><td>RM10.00</td><td>3</td><td>RM30.00</td></tr>
                </table>
            </div>
            <div id="checkout-container">
                <div id="checkout">
                    <div class="input-group mb-3" id="discountCode">
                        <label class="form-label">ADD A DISCOUNT CODE</label>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" aria-describedby="button-addon2">
                            <button class="btn btn-outline-secondary" type="button" id="button-addon2">ADD</button>
                        </div>
                    </div>
                    <div class="row" id="orderValue">
                        <p class="col-md-4">Order Value</p>
                        <p class="col-md-4 offset-md-4" style="text-align: right;">RM60.00</p>
                    </div>
                    <div class="row" id="deliveryAmount">
                        <p class="col-md-4">Delivery</p>
                        <p class="col-md-4 offset-md-4" style="text-align: right;">RM20.00</p>
                    </div>
                    <div class="row" id="totalAmount">
                        <p class="col-md-4">Total</p>
                        <p class="col-md-4 offset-md-4" style="text-align: right;">RM80.00</p>
                    </div>
                    <div>
                        <button type="button" class="btn btn-dark" style="width: 100%;">CONTINUE TO CHECK OUT</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <%@include file="../Share/footer.html" %>
</html>
