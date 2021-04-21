<%-- 
    Document   : CancelOrder
    Created on : Apr 1, 2021, 9:00:57 AM
    Author     : Chrisann Lee
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entity.CustomerOrder"%>
<%@page import="entity.Payment"%>
<%@page import="entity.OrderDetail,java.util.List"%>
<% CustomerOrder order = (CustomerOrder) request.getAttribute("order");
    List<OrderDetail> orderDetailsList = (List<OrderDetail>) request.getAttribute("orderDetailsList");
    Payment payment = (Payment) request.getAttribute("payment");
    String custID = "";

    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
    Date dateString = order.getDate();

//if( order.getCustomerId().getId().toString().length()<0){
//    custID="Guest";
//}else{
//    custID=order.getCustomerId().getId();
//}

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="/HobbitHall/Admin/Share/images/logo-book.png"/>
        <link rel="stylesheet" href="/HobbitHall/Admin/Order/orderDetails.css"/>
        <title>Hobbit Hall Admin</title>
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
                        <h4>Order Details</h4>
                        <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                        <ul class="breadcrumb">
                            <li><a href="/HobbitHall/OrderManagement?action=view">Customer Order</a></li>
                            <li>Order Details</li>
                        </ul>
                    </div>
                    <form action="/HobbitHall/OrderManagement?action=Cancel" method="post">
                    <div class="orderDetail">
                        <div class="custInfo">
                            <h5>Order ID - <%=order.getId()%></h5>
                            <div class="banner">Customer Details</div>
                            <table>
<!--                                <tr><td>Customer ID   :</td><td><input type="text" value="<%=custID%>" name="custID"></td></tr>-->
                                <tr><td>Customer Name :</td><td><input type="text" value="<%=order.getName()%>" name="name" readonly></td></tr>
                                <tr><td>Email :</td><td><input type="text" value="<%=order.getEmail()%>" name="email" readonly></td></tr>
                                <tr><td>Phone Number :</td><td><input type="text" value="<%=order.getContactNumber()%>" readonly></td></tr>
                                <tr><td>Address :</td><td><input type="text" value="<%=order.getAddress()%>" name="address" readonly></td></tr>
                            </table>
                            <div class="banner">Order Details</div>  
                            <table>
                                <tr><td>Order Date  :</td><td><input type="text" value="<%=formatter.format(dateString)%>"  class="col1" readonly></td><td>Order Status :</td><td><input type="text" value="<%=order.getStatus()%>" class="col2" readonly></td></tr>      
                                <tr><td></td><td><input type="text" value=""  readonly class="col1" ></td><td>Total Payment :</td><td><input type="text" value="RM <%=payment.getAmount()%>" class="col2" readonly></td></tr>      
                            </table>
                            <table class="product">
                                <tr class="product_detail">
                                    <th>Product Code</th>
                                    <th>Product Name</th>
                                    <th>Product Image</th>
                                    <th>Quantity</th>
                                    <th>Subtotal</th>
                                </tr>

                                <% for (int i = 0; i < orderDetailsList.size(); i++) {
                                        OrderDetail orderDetail = orderDetailsList.get(i);
                                %>
                                <tr class="product_detail2">
                                    <td><%=orderDetail.getProduct().getId()%></td>
                                    <td><%=orderDetail.getProduct().getName()%></td>
                                    <td class="img"><img src="/HobbitHall/Client/Share/images/book/<%=orderDetail.getProduct().getImage()%>"/></td>
                                    <td><%=orderDetail.getProductQuantity()%></td>
                                    <td><%=orderDetail.getSubtotal()%></td>
                                </tr>
                                <%}%>
                            </table>

                          <input type="hidden" name="id" value="<%=order.getId()%>"/>
                            <div class="delete"><input type="submit" name="cancel" value="Cancel" onclick="return confirm('Are you sure you want to cancel this order?');"></div>
                            

                        </div> 
                    </div>
                </form>

                </div>
            </div>
        </div>

    </body>
</html>

