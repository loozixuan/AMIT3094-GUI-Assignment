<%-- 
    Document   : customerOrder
    Created on : Mar 15, 2021, 10:39:20 PM
    Author     : Chrisann Lee
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entity.CustomerOrder,java.util.List"%>
<% List<CustomerOrder> orderList = (List<CustomerOrder>) request.getAttribute("orderList");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="/HobbitHall/Admin/Share/images/logo-book.png"/>
        <link rel="stylesheet" href="/HobbitHall/Admin/Order/customerOrder.css"/>
        <title>Hobbit Hall</title>
    </head>
    <body>
        <!--Header-->
        <%@ include file="../Share/adminHeader.jsp" %>
        <!--Sidebar-->
        <%@ include file="../Share/adminSidebar.jsp" %>


        <!--Content-->
        <div class="content">
            <div class="container-fluid p-2">
                <div class="container-db-right p-2">
                    <div class="pageheader-title">
                        <h4>Customer Order</h4>
                        <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                        <ul class="breadcrumb">
                            <li><a href="#">Customer Order</a></li>
                        </ul>
                    </div>
                    <br/>

                    <% if (!orderList.isEmpty()) {%>
                    <div class="table">       
                        <div class="h">
                            <div>Order Management</div>
                            <form action="/HobbitHall/OrderManagement?action=search" method="post">
                                <div id="searchBar">
                                    <input type="text" name="search" placeholder="ID, Phone , yyyy-mm-dd" value="" style="font-size:0.8em">
                                    <input type="submit" name="search" value="Search"  id="search"/>
                                </div>
                            </form></div>
                        <table  class="tableUser">
                            <tr>
                                <th>Order ID</th>
                                <th>Order Date</th>
                                <th>Customer Name</th>
                                <th>Phone</th>
                                <th>Order Status</th>

                                <th>Delivered</th>
                                <th>Cancel</th>
                            </tr>
                            <%
                                SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                                String valid="";
                                for (int i = 0; i < orderList.size(); i++) {
                                    CustomerOrder order = orderList.get(i);
                                    String orderStatus;
                                    String color;
                                    Date dateString = order.getDate();

                                    if (order.getStatus().equalsIgnoreCase("Order Confirmed")) {
                                        orderStatus = "Paid";
                                        color = "blue";
                                    } else if (order.getStatus().equalsIgnoreCase("Shipping")) {
                                        orderStatus = order.getStatus();
                                        color = "green";
                                    } else {
                                        color = "red";
                                        orderStatus = order.getStatus();
                                        valid = "disabled";
                                    }

                            %>

                            <tr>
                                <td><a href="/HobbitHall/OrderManagement?action=viewSingleOrder&id=<%=order.getId()%>"><%=order.getId()%></a></td>
                                <td><%=formatter.format(dateString)%></td><td><%=order.getName()%></td>
                                <td><%=order.getContactNumber()%></td><td style='color:<%=color%>'><%=orderStatus%></td>
                                <td><a href="/HobbitHall/OrderManagement?action=ship&id=<%=order.getId()%>"><input type='submit' name='submit' value='Shipping' class="shipping-button" <%=valid %> ></a></td>
                                <td><a href="/HobbitHall/OrderManagement?action=cancel&id=<%=order.getId()%>" ><i class='fas fa-trash-alt'></i></a></td>
                                        <% valid="";}%>
                        </table>
                    </div>
                    <%} else { %>
                    <div class="no_order">
                        <h1>No order!</h1>
                    </div>
                    <%}%>

                </div>
            </div>
        </div>
    </body>
</html>
