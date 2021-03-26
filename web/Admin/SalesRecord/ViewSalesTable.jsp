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
        <link href="ViewSalesTable.css" rel="stylesheet"/>
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
                    <h2>Daily Sales Record</h2>
                    <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                    <ul class="breadcrumb">
                        <li><a href="#">Sales Table</a></li>
                        <li></li>
                    </ul>
                </div>

                <div class="table-sales-body p-3 mt-3">
                    <table class="table table-sales table-striped">

                        <div class="table-sales-header d-flex justify-content-between p-3 align-items-center"style="margin-right: 15px;">
                            <div class="d-flex ml-5">
                                <div class="d-flex align-items-center">
                                    Date
                                </div>
                                <div>
                                    <input type="text" name="sales_date" value="2021-03-20" class="sales-date w-75 d-block mx-auto p-1"/>
                                </div>
                            </div>
                            <div class="d-flex mr-5"> 
                                <div class="d-flex align-items-center">
                                    Day
                                </div>
                                <div>
                                    <input type="text" name="sales_day" value="Saturday" class="sales-date w-75 d-block mx-auto p-1"/>
                                </div>
                            </div>
                        </div>

                        <thead>
                            <tr id="table-title">
                                <th>Order ID</th>
                                <th>Customer ID</th>
                                <th>Order Date</th>
                                <th>Total Amount</th>
                                <th>Order Status</th>
                            </tr>
                        </thead>

                        <tr>
                            <td><a href="ViewSalesRecord.jsp">K1001</a></td>
                            <td>C1001</td>
                            <td>2021-03-20</td>
                            <td>RM 888.88</td>
                            <td>Delivered</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
