<%-- 
    Document   : customerOrder
    Created on : Mar 15, 2021, 10:39:20 PM
    Author     : Chrisann Lee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../Share/images/logo-book.png"/>
        <link rel="stylesheet" href="customerOrder.css"/>
        <title>Hobbit Hall</title>
    </head>
    <body>
                <!--Header-->
        <%@ include file="../Share/adminHeader.html" %>
        <!--Sidebar-->
        <%@ include file="../Share/adminSidebar.html" %>
   

        <!--Content-->
        <div class="content">
            <div class="container-fluid p-2">
                <div class="container-db-right p-2">
                    <div class="pageheader-title">
                        <h4>Customer Order</h4>
                        <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                        <ul class="breadcrumb">
                            <li><a href="#">Customer Order</a></li>
                            <li>Testing</li>
                        </ul>
                    </div>
                    <br/>
                    <div class="table">       
                        <div class="h">Order Management</div>
                        <table  class="tableUser">
                            <tr>
                                <th>Order ID</th>
                                <th>Customer ID</th>
                                <th>Order Date</th>
                                <th>Order Status</th>
                                <th>Payment</th>
                                <th>Delivered</th>
                                <th>Cancel</th>
                            </tr>
                            <tr><td >K4002172</td><td>C002</td><td>2020-09-07</td><td style='color:red'>cancel</td><td>453.61</td><td><input type='submit' name='submit' value='Shipping' class="shipping-button" ></td><td><i class='fas fa-trash-alt'></i></td>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
