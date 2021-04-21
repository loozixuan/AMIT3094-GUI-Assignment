<%-- 
    Document   : Receipt
    Created on : Mar 16, 2021, 12:12:58 AM
    Author     : Chow Sing Hong
--%>

<%@page import="entity.CustomerOrder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <title>Hobbit Hall</title>
        <link rel="icon" href="/HobbitHall/Client/Share/images/logoBook.png"/>
    </head>
    <%@include file="../Share/header.jsp" %>
    <body>
        <% CustomerOrder customerOrder = (CustomerOrder) request.getAttribute("customer_order");%>
        <div class="row justify-content-center py-5">
            <div class="row justify-content-center col-8 border border-3 border-dark" style="background-color: rgb(255, 235, 205);">
                <div class="col-6 border-end border-3 border-dark">
                    <div class="row">
                        <p class="col-6 text-start">Order ID</p>
                        <p class="col-6 text-end"><%= customerOrder.getId()%></p>
                    </div>     
                    <div class="row">
                        <p class="col-6 text-start">Payment ID</p>
                        <p class="col-6 text-end"><%= customerOrder.getPayment().getId()%></p>
                    </div>
                    <div class="row">
                        <p class="col-6 text-start">Date</p>
                        <p class="col-6 text-end"><%= customerOrder.getDate()%></p>
                    </div>
                    <div class="row">
                        <p class="col-6 text-start">Subtotal</p>
                        <p class="col-6 text-end">RM <%= String.format("%.2f", customerOrder.getOrderSubtotal())%></p>
                    </div>
                    <div class="row">
                        <p class="col-6 text-start">Delivery Fees</p>
                        <p class="col-6 text-end">RM <%= String.format("%.2f", customerOrder.getDelivery())%></p>
                    </div>
                    <div class="row">
                        <p class="col-6 text-start">Discount</p>
                        <p class="col-6 text-end">RM (<%= String.format("%.2f", customerOrder.getDiscount())%>)</p>
                    </div>
                    <div class="row">
                        <p class="col-6 text-start">Total</p>
                        <p class="col-6 text-end">RM <%= String.format("%.2f", customerOrder.getOrderTotal())%></p>
                    </div>
                </div>
                <div class="col-6">
                    <div class="row">
                        <p class="col-6 text-start">Receiver Name</p>
                        <p class="col-6 text-end"><%= customerOrder.getName()%></p>
                    </div>
                    <div class="row">
                        <p class="col-6 text-start">Email</p>
                        <p class="col-6 text-end"><%= customerOrder.getEmail()%></p>
                    </div>
                    <div class="row">
                        <p class="col-6 text-start">Contact Number</p>
                        <p class="col-6 text-end"><%= customerOrder.getContactNumber()%></p>
                    </div>
                    <div class="row">
                        <p class="col-6 text-start">Delivery Address</p>
                        <p class="col-6 text-end"><%= customerOrder.getAddress()%></p>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <%@include file="../Share/footer.html" %>
</html>
