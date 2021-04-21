<%-- 
    Document   : ShoppingCart
    Created on : Mar 11, 2021, 12:38:49 AM
    Author     : Chow Sing Hong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, domain.CartItem, entity.CustomerOrder, entity.Product"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="/HobbitHall/Client/Order/ShoppingCart.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Hobbit Hall</title>
          <link rel="icon" href="/HobbitHall/Client/Share/images/logoBook.png"/>
    </head>
    <%@include file="../Share/header.jsp" %>
    <% 
        ArrayList<CartItem> cartItemList;
        if(customer.getId() == null){ 
            cartItemList = (ArrayList<CartItem>)session.getAttribute("guest" + "_cart"); 
        }else{
            cartItemList = (ArrayList<CartItem>)session.getAttribute(customer.getId() + "_cart"); 
        } 
        CustomerOrder order = new CustomerOrder();
        ArrayList<String> cartItemOutofStockMessageList = (ArrayList<String>)request.getAttribute("cartItemOutofStockMessageList");
    %>
    <%! 
        public double calculateCartTotal(ArrayList<CartItem> cartItemList){
            double total = 0;
            for (int i = 0; i < cartItemList.size(); i++) {
                total += (cartItemList.get(i).getProduct().getPrice() * cartItemList.get(i).getQuantity());
            }
            return total;
        }
    %>
    <body>
        <div id="main">           
            <% 
                if(cartItemList != null ){
                    if(cartItemList.size() > 0){
            %>
            
            <h3 class="mx-5 my-5 text-center">Shopping Cart</h3>
            <div id="cart-container">
                <% 
                    if(cartItemOutofStockMessageList != null){
                    for (int i = 0; i < cartItemOutofStockMessageList.size(); i++) {         
                %>
                <p class="text-danger"><%= cartItemOutofStockMessageList.get(i) %></p>
                <% }} %>
                <table class="table" id="item">
                    <tr><td colspan="2">Product</td><td>Price</td><td class="text-center">Quantity</td><td>Total</td></tr>
                    <% for (int i = 0; i < cartItemList.size(); i++){ %>
                    <tr>
                        <td class="align-middle" id="productImage"><img src="/HobbitHall/Client/Share/images/book/<%= cartItemList.get(i).getProduct().getImage() %>"/></td>
                        <td class="align-middle" id="productSubCategoryandName" style="width: 30%;">
                            <a href="/HobbitHall/ViewProducts?subcategory=<%= cartItemList.get(i).getProduct().getSubcategoryId().getId()%>&category=<%= cartItemList.get(i).getProduct().getSubcategoryId().getCategoryId().getId() %>&name=name&order=desc">
                                <%= cartItemList.get(i).getProduct().getSubcategoryId().getName() %>
                            </a><br/>
                            <a href="/HobbitHall/LoadProductDesc?productid=<%= cartItemList.get(i).getProduct().getId() %>&subcategory=<%= cartItemList.get(i).getProduct().getSubcategoryId().getId()%>">
                                <%= cartItemList.get(i).getProduct().getName() %>
                            </a>
                        </td>
                        <td class="align-middle"><%= String.format("%.2f", cartItemList.get(i).getProduct().getPrice()) %></td>
                        <td class="text-center align-middle">
                            <div class="row align-middle" style="relative">
                                <a href="/HobbitHall/ShoppingCart?action=decrease&product_ID=<%= cartItemList.get(i).getProduct().getId() %>" class="col-md-4"><i class="fa fa-minus align-middle"></i></a>
                                <form class="col-md-4" action="/HobbitHall/ShoppingCart" method="GET">
                                    <input class="form-control text-center" type="hidden" name="action" value="update"/>
                                    <input class="form-control text-center" type="hidden" name="product_ID" value="<%= cartItemList.get(i).getProduct().getId() %>"/>
                                    <input class="form-control text-center" type="text" name="qtyBuy" value="<%= cartItemList.get(i).getQuantity() %>" style="width: 50px; margin: 0px auto;"/>
                                </form>
                                <a href="/HobbitHall/ShoppingCart?action=increase&product_ID=<%= cartItemList.get(i).getProduct().getId() %>" class="col-md-4"><i class="fa fa-plus align-middle"></i></a>
                            </div>
                            <div class="row mt-2" style="relative">
                                <a href="/HobbitHall/ShoppingCart?action=remove&product_ID=<%= cartItemList.get(i).getProduct().getId() %>" class="col-md-12 text-danger">Remove</a>                           
                            </div>
                        </td>
                        <td class="align-middle"><%= String.format("%.2f", cartItemList.get(i).getSubtotal()) %></td>
                    </tr>
                    <% } %>
                </table>
            </div>
            <div id="checkout-container">
                <div id="checkout">
                    <div class="row" id="orderValue">
                        <p class="col-md-4">Order Value</p>
                        <p class="col-md-4 offset-md-4" style="text-align: right;">RM<%= String.format("%.2f", calculateCartTotal(cartItemList)) %></p>
                    </div>
                    <div class="row" id="deliveryAmount">
                        <p class="col-md-4">Delivery</p>
                        <p class="col-md-4 offset-md-4" style="text-align: right;">RM<%= String.format("%.2f", order.getDelivery()) %></p>
                    </div>
                    <div class="row" id="totalAmount">
                        <p class="col-md-4">Total</p>
                        <p class="col-md-4 offset-md-4" style="text-align: right;">RM<%= String.format("%.2f", calculateCartTotal(cartItemList) + order.getDelivery()) %></p>
                    </div>
                    <div>
                        <% if(cartItemOutofStockMessageList == null){ %>
                        <a href="/HobbitHall/PaymentControl" class="btn btn-dark" style="width: 100%;">CONTINUE TO CHECK OUT</a>
                        <% }else{ %>
                        <a href="#" class="btn btn-secondary disabled" tabindex="-1" role="button" aria-disabled="true" style="width: 100%;">CONTINUE TO CHECKOUT</a>
                        <% }%>
                    </div>
                </div>
            </div>
            <% }else{ %>
            <div class="mt-5">
                <div class="row justify-content-center"><h3 class="col-md-5 text-center">Your cart is empty</h3></div>
                <div class="row justify-content-center px-5">
                    <a href="/HobbitHall/ViewProducts?subcategory=E001&category=1&name=name&order=desc" class="col-md-3 bg-danger text-white text-center border border-5 py-3 mt-3">Shop our products</a>
                </div>
            </div>
            <% }}else{ %>
            <div class="mt-5">
                <div class="row justify-content-center"><h3 class="col-md-5 text-center">Your cart is empty</h3></div>
                <div class="row justify-content-center px-5">
                    <a href="/HobbitHall/ViewProducts?subcategory=E001&category=1&name=name&order=desc" class="col-md-3 bg-danger text-white text-center border border-5 py-3 mt-3">Shop our products</a>
                </div>
            </div>
            <% } %>
            
        </div>
    </body>
    <%@include file="../Share/footer.html" %>
</html>