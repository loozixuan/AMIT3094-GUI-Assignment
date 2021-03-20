<%-- 
    Document   : OrderDetails
    Created on : Mar 15, 2021, 11:27:21 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="OrderDetails.css" rel="stylesheet"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../Share/header.jsp" %>
        <h3 class="text-center mt-3">Order Details</h3>
        <div class="row justify-content-start mt-5" id="main">
            <div class="col-md-8" id="orderedProduct">
                <table class="table bg-white text-dark" id="item">
                    <tr><td class="text-center">Product</td><td></td><td>Price</td><td>Quantity</td><td>Total</td></tr>
                    <tr><td id="productImage"><img src="testing1.jpg"/></td><td>Macmillan-Uk<br/>Hidden in Plain Sight</td><td>RM10.00</td><td>3</td><td>RM30.00</td></tr>
                    <tr><td id="productImage"><img src="testing1.jpg"/></td><td>Macmillan-Uk<br/>Hidden in Plain Sight</td><td>RM10.00</td><td>3</td><td>RM30.00</td></tr>
                </table>
            </div>
            <div class="col-md-3 offset-md-1 bg-white text-dark" id="orderCaculation" style="height: 290px;">
                <div class="row mt-3">
                    <p class="col-7">Subtotal</p>
                    <p class="col-5 text-end">RM 100.00</p>
                </div>
                <div class="row">
                    <p class="col-7">Delivery</p>
                    <p class="col-5 text-end">RM 20.00</p>
                </div>
                <div class="row border-bottom border-3">
                    <p class="col-7">Discount <br/>Code: BUY100</p>
                    <p class="col-5 text-end">RM (20.00)</p>
                </div>
                <div class="row border-bottom border-3 mt-3">
                    <p class="col-7">Total</p>
                    <p class="col-5 text-end">RM 100.00</p>
                </div>
                <div class="row justify-content-center">
                    <button type="button" class="col-5 btn btn-danger mt-3">Receive</button>
                </div>
            </div>
        </div>
        <%@include file="../Share/footer.html" %>
    </body>
</html>
