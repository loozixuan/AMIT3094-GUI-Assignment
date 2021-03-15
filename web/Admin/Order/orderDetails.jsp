<%-- 
    Document   : orderDetails
    Created on : Mar 15, 2021, 10:50:02 PM
    Author     : Chrisann Lee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../images/logo-book.png"/>
        <link rel="stylesheet" href="orderDetails.css"/>
        <title>Hobbit Hall</title>
    </head>
    <body>
        <!--Header-->
        <%@ include file="../Share/adminHeader.html" %>
        <!--Sidebar-->
        <%@ include file="../Share/adminSidebar.html" %>
        <div class="content">
            <div class="orderDetail">
                <div class="custInfo">
                    <h3>Order ID - 123456</h3>
                    <div class="banner">Customer Detail</div>
                    <table>
                        <tr><td>Customer ID   :</td><td><input type="text" value="C001"></td></tr>
                        <tr><td>Customer Name :</td><td><input type="text" value="Chris"></td></tr>
                        <tr><td>Email :</td><td><input type="text" value="lee@gmail.com"></td></tr>
                        <tr><td>Phone Number :</td><td><input type="text" value="010-1111111"></td></tr>
                        <tr><td>Address :</td><td><input type="text" value="123 Jalan Ampang"></td></tr>
                    </table>
                    <div class="banner">Order Detail</div>  
                    <table>
                        <tr><td>Order Date  :</td><td><input type="text" value="2020-1-2" style="border:none;width:400px;"></td><td>Order Status :</td><td><input type="text" value="shipping" style="border:none;width:100px;color:red;"></td></tr>      
                        <tr><td></td><td><input type="text" value="" style="border:none;width:400px;"></td><td>Total Payment :</td><td><input type="text" value="RM100" style="border:none;width:100px;"></td></tr>      
                    </table>
                    <table class="product">
                        <tr class="product_detail">
                            <th>Product Code</th>
                            <th>Product Name</th>
                            <th>Product Image</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                        </tr>

                        <tr class="product_detail2">
                            <td>P001</td>
                            <td>Lean In</td>
                            <td class="img"><img src="../../Client/Share/images/book/business/business1.jpg"/></td>
                            <td>2</td>
                            <td>RM100</td>
                        </tr>
                    </table>
                    
                    <div class="delete"><input type="submit" name="cancel" value="Cancel" onclick="return confirm('Are you sure you want to cancel this order?');"></div>
<!--                    <div class="delete"><input type="submit" name="delivered" value="Shipping" onclick="return confirm('This order is on shipping?');" style='background-image: radial-gradient(circle, #37bd0b, #3dc80d, #42d40f, #48df10, #4eeb12);;'></div>

                   -->

                </div> 
            </div>
        </div>

    </body>
</html>
