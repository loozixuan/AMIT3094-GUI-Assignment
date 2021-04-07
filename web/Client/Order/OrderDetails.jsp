<%-- 
    Document   : OrderDetails
    Created on : Mar 15, 2021, 11:27:21 PM
    Author     : user
--%>

<%@page import="entity.CustomerOrder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="/HobbitHall/Client/Order/OrderDetails.css" rel="stylesheet"/>
         <title>Hobbit Hall</title>
           <link rel="icon" href="/HobbitHall/Client/Share/images/logoBook.png"/>
    </head>
    <body>
        <%@include file="../Share/header.jsp" %>
        <% CustomerOrder customerOrder = (CustomerOrder)request.getAttribute("customer_order"); %>
        <h3 class="text-center mt-3">Order Details</h3>
        <div class="row justify-content-center mt-5" id="main">
            <div class="col-md-8" id="orderedProduct">
                <table class="table bg-white text-dark" id="item">
                    <tr><td class="text-center">Product</td><td></td><td>Price</td><td>Quantity</td><td>Total</td></tr>
                    <% for (int i = 0; i < customerOrder.getOrderDetailList().size(); i++) { %>
                    <tr>
                        <td id="productImage" class="align-middle">
                            <img src="/HobbitHall/Client/Share/images/book/<%= customerOrder.getOrderDetailList().get(i).getProduct().getImage() %>"/>
                        </td>
                        <td class="align-middle"><%= customerOrder.getOrderDetailList().get(i).getProduct().getSubcategoryId().getName() %><br/><%= customerOrder.getOrderDetailList().get(i).getProduct().getName() %></td>
                        <td class="align-middle"><%= customerOrder.getOrderDetailList().get(i).getProduct().getPrice() %></td>
                        <td class="align-middle"><%= customerOrder.getOrderDetailList().get(i).getProductQuantity() %></td>
                        <td class="align-middle">RM <%= customerOrder.getOrderDetailList().get(i).getSubtotal() %></td>
                    </tr>
                    <% } %>
                </table>
            </div>
            <div class="col-md-3 offset-md-1" id="orderCaculation">
                <div class="row bg-white text-dark pt-3">
                    <p class="col-7">Subtotal</p>
                    <p class="col-5 text-end">RM <%= String.format("%.2f", customerOrder.getOrderSubtotal()) %></p>
                </div>
                <div class="row bg-white text-dark">
                    <p class="col-7">Delivery</p>
                    <p class="col-5 text-end">RM <%= String.format("%.2f", customerOrder.getDelivery()) %></p>
                </div>
                <% if(customerOrder.getPromotionCode() != null){ %>
                <div class="row bg-white text-dark">
                    <p class="col-7">Discount <br/>Code: <%= customerOrder.getPromotionCode().getCode() %></p>
                    <p class="col-5 text-end">RM (<%= String.format("%.2f", customerOrder.getDiscount()) %>)</p>
                </div>
                <% } %>
                <div class="row bg-white text-dark border-bottom border-top border-2">
                    <p class="col-7 mt-2">Total</p>
                    <p class="col-5 text-end mt-2">RM <%= String.format("%.2f", customerOrder.getOrderTotal()) %></p>
                </div>
                <div class="row bg-white text-dark justify-content-center">
                    <% if(customerOrder.getStatus().equalsIgnoreCase("Order Confirmed") ){ %>
                    <p class="col-5 btn btn-secondary text-white my-3">Ordered Confirmed</p>
                    <% }else if (customerOrder.getStatus().equalsIgnoreCase("Delivery")){ %>
                    <a href="/HobbitHall/CustomerOrderControl?action=updateStatus&orderID=<%= customerOrder.getId() %>" class="col-5 btn btn-danger my-3">Receive</a>
                    <% }else if (customerOrder.getStatus().equalsIgnoreCase("Received")) { %>
                    <p class="col-5 btn btn-secondary text-white my-3">Received</p>
                    <% }else{ %>
                    <p class="col-5 btn btn-secondary text-white my-3">Cancelled</p>
                    <% } %>
                </div>
            </div>
        </div>
        <%@include file="../Share/footer.html" %>
    </body>
</html>
