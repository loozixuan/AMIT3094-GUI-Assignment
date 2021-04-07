<%-- 
    Document   : ViewEmployee
    Created on : Mar 15, 2021, 9:52:04 PM
    Author     : zixua
--%>

<%@page import="entity.OrderDetail"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/HobbitHall/Admin/SalesRecord/ViewSalesRecord.css" rel="stylesheet"/>
        <link rel="icon" href="/HobbitHall/Client/Share/images/logoBook.png"/>
        <title>Hobbit Hall Book Store</title>
    </head>
    <%
        List<OrderDetail> orderDetail = (List) request.getAttribute("orderDetail");
        Double total = 0.0;
        Double delivery = 0.0;
        double discount = 0.0;
        int totalProduct = 0;
    %>
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
                        <li><a href="/HobbitHall/Admin/SalesRecord/ViewSalesTable.jsp">Sales Table</a></li>
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
                                <div class="order-id-ct d-flex mt-3 justify-content-center">
                                    <div class="pr-3"><strong>Order ID:</strong></div>
                                    <div><%= orderDetail.get(0).getOrderDetailPK().getOrderId()%></div>
                                </div>
                            </div>
                            <div class="mt-2 bg-white">
                                <table class="table table-sales-record table-striped">

                                    <thead>
                                        <tr id="table-title" class="text-center">
                                            <th>Product ID</th>
                                            <th>Product Name</th>
                                            <th>Image</th>
                                            <th>Category</th>
                                            <th>QTY</th>
                                            <th>Subtotal</th>
                                        </tr>
                                    </thead>

                                    <% if (!orderDetail.isEmpty()) { %>
                                    <% for (int i = 0; i < orderDetail.size(); i++) {%>
                                    <tr class="text-center">
                                        <td>
                                            <div><%= orderDetail.get(i).getProduct().getId()%></div>                                        
                                        </td>
                                        <td><%= orderDetail.get(i).getProduct().getName()%></td>
                                        <td>
                                            <div><img style="width:100px;height: 150px;" src="/HobbitHall/Client/Share/images/book/<%= orderDetail.get(i).getProduct().getImage()%>" alt="product"/></div>
                                        </td>
                                        <td><%= orderDetail.get(i).getProduct().getSubcategoryId().getId()%></td>
                                        <td><%= orderDetail.get(i).getProductQuantity()%></td>
                                        <td>RM <%= String.format("%.2f", orderDetail.get(i).getSubtotal())%></td>
                                    </tr>
                                    <%  total += orderDetail.get(i).getSubtotal();
                                        delivery = orderDetail.get(i).getCustomerOrder().getDelivery();
                                        discount = orderDetail.get(i).getCustomerOrder().getDiscount();
                                    %>
                                    <%}%>

                                    <tr>
                                        <td><div><b class="pl-3">Delivery Fees :</b></div></td>
                                        <td><div></div></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>

                                        <td class="text-center">
                                            RM <%= String.format("%.2f", delivery)%>
                                        </td>
                                    </tr>
                                    <tr style="background: ghostwhite;box-shadow: none !important;">
                                        <td><div><b class="pl-3">Discount (if any) :</b></div></td>
                                        <td><div></div></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>

                                        <% if (discount != 0.0) {%>
                                        <td class="text-center">
                                            RM <%= String.format("%.2f", discount)%>
                                        </td>
                                        <%} else {%>
                                        <td class="text-center">RM 00.00</td>
                                        <%}%>
                                    </tr>
                                    <tr style="background: ghostwhite;border-top:2px solid black;border-bottom:2px solid black;">
                                        <td><div><b class="pl-3">Total Amount :</b></div></td>
                                        <td><div></div></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>

                                        <% if (discount == 0.0) {%>
                                        <td class="text-center">
                                            <div style="color:blue"><b>RM <%= String.format("%.2f", total + delivery)%></b></div>
                                        </td>
                                        <%} else {%>
                                        <td class="text-center">
                                            <div style="color:blue"><b>RM <%= String.format("%.2f", total + delivery - discount)%></b></div>
                                        </td>
                                        <%}%>
                                    </tr>
                                    <%} else {%>
                                    <tr></tr>
                                    <%}%>
                                </table>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="customer" role="tabpanel" aria-labelledby="customer-tab">
                            <div>
                                <div class="cust-id-ct d-flex mt-3 justify-content-center">
                                    <div class="pr-3"><strong>Customer ID:</strong></div>
                                    <% if (orderDetail.get(0).getCustomerOrder().getCustomerId() == null) {%>
                                    <div>Guest</div>
                                    <%} else {%>
                                    <div><%= orderDetail.get(0).getCustomerOrder().getCustomerId().getId()%></div>
                                    <%}%>
                                </div>
                            </div>

                            <div class="cust-details mt-3 bg-white p-4 w-75 mx-auto">

                                <div class="d-flex justify-content-evenly w-75 mx-auto p-2">
                                    <div class="w-50"><b>Name :</b> </div>
                                    <div class="w-50"><%= orderDetail.get(0).getCustomerOrder().getName()%> </div>
                                </div>

                                <div class="d-flex justify-content-evenly w-75 mx-auto p-2">
                                    <div class="w-50"><b>Email :</b> </div>
                                    <div class="w-50"><%= orderDetail.get(0).getCustomerOrder().getEmail()%> </div>
                                </div>

                                <div class="d-flex justify-content-evenly w-75 mx-auto p-2">
                                    <div class="w-50"><b>Address :</b> </div>
                                    <div class="w-50"><%= orderDetail.get(0).getCustomerOrder().getAddress()%> </div>
                                </div>

                                <div class="d-flex justify-content-evenly w-75 mx-auto p-2">
                                    <div class="w-50"><b>Contact Number :</b> </div>
                                    <div class="w-50"><%= orderDetail.get(0).getCustomerOrder().getContactNumber()%> </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
