<%-- 
    Document   : ViewEmployee
    Created on : Mar 15, 2021, 9:52:04 PM
    Author     : zixua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="ViewSalesRecord.css" rel="stylesheet"/>
        <link rel="icon" href="../Share/images/logo-book.png"/>
        <title>Hobbit Hall Book Store</title>
    </head>
    <body>
        <%@ include file="../Share/adminHeader.jsp" %>
        <!--Sidebar-->
        <%@ include file="../Share/adminSidebar.jsp" %>

        <!--Content-->
        <div class="content">
            <div class="p-3">
                <div class="pageheader-title">
                    <h2>Sales Record Details</h2>
                    <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                    <ul class="breadcrumb">
                        <li><a href="ViewSalesTable.jsp">Sales Table</a></li>
                        <li>Sales Record </li>
                    </ul>
                </div>

                <div class="order-customer-tab p-3">

                    <ul class="nav nav-tabs d-flex justify-content-around" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active text-center" id="order-tab" style="width:220px;" data-toggle="tab" href="#order" role="tab" aria-controls="home" aria-selected="true">
                                Order Details
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-center" id="customer-tab" style="width:220px;"  data-toggle="tab" href="#customer" role="tab" aria-controls="profile" aria-selected="false">
                                Customer Details
                            </a>
                        </li>

                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active p-2" id="order" role="tabpanel" aria-labelledby="home-tab">
                            <div>
                                <div class="d-flex mt-3 justify-content-center">
                                    <div class="pr-3"><strong>Order ID:</strong></div>
                                    <div>O1001</div>
                                </div>
                            </div>
                            <div class="mt-2 bg-white">
                                <table class="table table-sales-record table-striped">

                                    <thead>
                                        <tr id="table-title" class="text-center">
                                            <th>Product ID</th>
                                            <th>Category</th>
                                            <th>QTY</th>
                                            <th>Total</th>
                                            <th>Order Status</th>
                                        </tr>
                                    </thead>

                                    <tr class="text-center">
                                        <td>
                                            <div class="d-flex align-items-center justify-content-around">
                                                <div>P1001</div>
                                                <div><img src="../Share/images/logo-book.png"/></div>
                                            </div>
                                        </td>
                                        <td>m1001</td>
                                        <td>3</td>
                                        <td>RM 888.88</td>
                                        <td>Delivered</td>
                                    </tr>

                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <div class="d-flex justify-content-evenly">
                                                <div><strong>Subtotal : </strong></div>
                                                <div>RM 400.88</div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="customer" role="tabpanel" aria-labelledby="customer-tab">
                            <div>
                                <div class="d-flex mt-3 justify-content-center">
                                    <div class="pr-3"><strong>Customer ID:</strong></div>
                                    <div>O1001</div>
                                </div>
                            </div>

                            <div class="mt-2 bg-white">
                                <table class="table table-sales-record table-striped">
                                    <thead>
                                        <tr id="table-title" class="text-center">

                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Address</th>
                                            <th>Contact Number</th>
                                        </tr>
                                    </thead>

                                    <tr class="text-center">

                                        <td>Man Yee</td>
                                        <td>my@gmail.com</td>
                                        <td>taman bukit blablabla</td>
                                        <td>010-945678987</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
