<%-- 
    Document   : OrderHistory
    Created on : Mar 15, 2021, 11:26:39 PM
    Author     : user
--%>

<%@page import="entity.CustomerOrder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="/HobbitHall/Client/Share/userSidebar.css" rel="stylesheet"/>
         <title>Hobbit Hall</title>
           <link rel="icon" href="/HobbitHall/Client/Share/images/logoBook.png"/>
        <style>
            .col-3-4{
                margin-top:50px;
                width:70%;
                padding:50px;
                background-color: honeydew;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            
            #logout-button{
                background: none;
                border:none;
                color:#808080;
                margin-left:0px;
                padding:0px;
                width:50px
            }
            
            
        </style>
    </head>
    <%@include file="../Share/header.jsp" %>
    <body>
        <% 
            List<CustomerOrder> customerOrderList = (List<CustomerOrder>)request.getAttribute("customerOrderList"); 
        %>
        <div class="col-1-4" style="margin-left: 30px; margin-bottom: 50px; float: left;">
            <h1>My Account</h1>
            <table>
                <tr>
                    <td> <a href="<%=request.getContextPath()%>/Client/User/userProfile.jsp"><i class="fa fa-user" aria-hidden="true" style="color:black"></i>Account Details</a></td>
                </tr>
                <tr>
                    <td style="background-color: white;border-left: 3px solid blue "><a href="/HobbitHall/CustomerOrderControl?action=orderHistory" style="color:black"><i class="fa fa-calendar-check-o" aria-hidden="true"></i>Orders</a></td>
                </tr>
                <tr>
                    <form action="/HobbitHall/Logout" action="get">
                        <td><i class="fa fa-sign-out" aria-hidden="true"></i><input type="submit" name="submit" value="Logout" id="logout-button"></td>
                    </form> 
                </tr>
            </table>
        </div>
        <div class="row col-3-4 justify-content-center my-5 px-5" id="main">
        <% if(customer.getId() != null){ %>
            <h3 class="text-center mt-2 mb-5">Your Order</h3>
            <% for (int i = 0; i < customerOrderList.size(); i++) { %>
            <div class="col-md-4 mb-3 mx-5 bg-white text-dark border border-3 rounded">
                <div class="row">
                    <div class="col-6 mt-3">
                        <p class="text-start">Order ID</p>
                    </div>
                    <div class="col-6 mt-3">
                        <p class="text-end"><%= customerOrderList.get(i).getId() %></p>
                    </div>
                    <div class="col-6">
                        <p class="text-start">Sub Total</p>
                    </div>
                    <div class="col-6">
                        <p class="text-end">RM <%= String.format("%.2f", customerOrderList.get(i).getOrderSubtotal())  %></p>
                    </div>
                    <div class="col-6">
                        <p class="text-start">Delivery</p>
                    </div>
                    <div class="col-6">
                        <p class="text-end">RM <%= String.format("%.2f", customerOrderList.get(i).getDelivery()) %></p>
                    </div>
                    <div class="col-6">
                        <p class="text-start">Discount</p>
                    </div>
                    <div class="col-6">
                        <p class="text-end">RM (<%= String.format("%.2f", customerOrderList.get(i).getDiscount()) %>)</p>
                    </div>
                    <div class="col-6">
                        <p class="text-start">Total Amount</p>
                    </div>
                    <div class="col-6">
                        <p class="text-end">RM <%= String.format("%.2f", customerOrderList.get(i).getOrderTotal()) %></p>
                    </div>
                    <div class="col-6">
                        <p class="text-start">Status</p>
                    </div>
                    <div class="col-6">
                        <p class="text-end"><%= customerOrderList.get(i).getStatus() %></p>
                    </div>
                    <div class="col-6">
                        <p class="text-start">Date</p>
                    </div>
                    <div class="col-6">
                        <p class="text-end"><%= customerOrderList.get(i).getDate().toString() %></p>
                    </div>
                    <div class="col-12 mb-3 text-center">
                        <a class="btn btn-danger" href="/HobbitHall/CustomerOrderControl?action=orderDetail&orderID=<%= customerOrderList.get(i).getId() %>">Check Order</a>
                    </div>
                </div>
            </div>   
            <% } %>      
        <% }else{ %>
        <h1 class="text-center my-5">Sign In To View Your Order</h1>
        <% } %>     
        </div>
    </body>
    <%@include file="../Share/footer.html" %>
</html>
