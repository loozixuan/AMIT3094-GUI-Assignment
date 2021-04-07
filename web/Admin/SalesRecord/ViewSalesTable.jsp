<%-- 
    Document   : ViewEmployee
    Created on : Mar 15, 2021, 9:52:04 PM
    Author     : zixua
--%>

<%@page import="java.util.Date"%>
<%@page import="entity.CustomerOrder"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/HobbitHall/Admin/SalesRecord/ViewSalesTable.css" rel="stylesheet"/>
        <link rel="icon" href="/HobbitHall/Client/Share/images/logoBook.png"/>
        <title>Hobbit Hall Book Store</title>
    </head>
    <%
        List<CustomerOrder> customerOrderList = (List) request.getAttribute("customerOrderList");
        String date = (String) request.getAttribute("todayDate");
        String day = (String) request.getAttribute("dayOfWeek");
        double total = 0.0;
    %>
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

                    <form action="/HobbitHall/Sales?action=search" method="POST">
                        <div class="d-flex justify-content-center p-2">
                            <div class="d-flex align-items-center">
                                <b>Date :</b>
                            </div>
                            <div class="d-flex">
                                <input type="text" name="salesdate" value="<%= date%>" placeholder="yyyy-MM-dd" class="sales-date w-75 d-block mx-auto p-1"/>
                                <button style="background:transparent;border:none;"><i class="fa fa-search" aria-hidden="true"></i></button>
                            </div>
                        </div>
                    </form>
                    <% if (!customerOrderList.isEmpty()) {%>
                    <% for (int i = 0; i < customerOrderList.size(); i++) {
                            total += customerOrderList.get(i).getOrderTotal();

                        }%>
                    <%}%>

                    <table class="table table-sales table-striped">
                        <div class="table-sales-header d-flex justify-content-between p-3 align-items-center"style="margin-right: 15px;">
                            <div class=" ml-2" style="font-size:1.25rem">
                                Today Sales : RM <%= String.format("%.2f", total)%>
                            </div>
                            <div class="d-flex mr-5"> 
                                <div class="d-flex align-items-center">
                                    Day
                                </div>
                                <div>
                                    <input type="text" name="sales_day" value="<%= day%>" class="sales-date w-75 d-block mx-auto p-1" readonly/>
                                </div>
                            </div>
                        </div>
                        <thead>
                            <tr id="table-title">
                                <th>Order ID</th>
                                <th>Customer ID</th>
                                <th>Order Date</th>
                                <th>Order Status</th>
                                <th>Total Amount (RM)</th>
                            </tr>
                        </thead>
                        <% if (!customerOrderList.isEmpty()) {%>
                        <% for (int i = 0; i < customerOrderList.size(); i++) {%>
                        <tr>
                            <td><a class="orderlink" href="/HobbitHall/Sales?action=check&orderid=<%= customerOrderList.get(i).getId()%>"><%= customerOrderList.get(i).getId()%></a></td>
                                <% if (customerOrderList.get(i).getCustomerId() != null) {%>
                            <td><%= customerOrderList.get(i).getCustomerId().getId()%></td>
                            <%} else {%>
                            <td>Guest</td>
                            <%}%>
                            <td><%= date%></td>
                            <% if (customerOrderList.get(i).getStatus().equalsIgnoreCase("Ordered Confirm") || customerOrderList.get(i).getStatus().equalsIgnoreCase("Delivery")) {%>
                            <td style="color: crimson"><%= customerOrderList.get(i).getStatus()%></td>
                            <%} else if (customerOrderList.get(i).getStatus().equalsIgnoreCase("Cancelled ")) {%>
                            <td style="color:#be1e2d"><%= customerOrderList.get(i).getStatus()%></td>
                            <%} else {%>
                            <td style="color:#008a00"><%= customerOrderList.get(i).getStatus()%></td>
                            <%}%>
                            <td><%= String.format("%.2f", customerOrderList.get(i).getOrderTotal())%></td>
                        </tr>
                        <%}%>
                        <%} else {%>
                        <tr><td colspan="5"><b style="color:chocolate">Today No Sales Records...</b></td></tr>
                        <%}%>

                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
