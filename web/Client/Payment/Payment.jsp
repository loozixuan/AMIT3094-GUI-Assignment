<%-- 
    Document   : Payment
    Created on : Mar 12, 2021, 5:20:27 AM
    Author     : Chow Sing Hong
--%>

<%@page import="entity.CustomerOrder"%>
<%@page import="domain.CartItem, java.util.ArrayList, entity.CustomerOrder, entity.PromotionCode"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="/HobbitHall/Client/Payment/Payment.css" rel="stylesheet"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="/HobbitHall/Client/Payment/Payment.js"></script>
          <link rel="icon" href="/HobbitHall/Client/Share/images/logoBook.png"/>
         <title>Hobbit Hall</title>
    </head>
    <%@include file="../Share/header.jsp" %>
    <% 
        ArrayList<CartItem> cartItemList;
        if(customer.getId() == null){ 
            cartItemList = (ArrayList<CartItem>)session.getAttribute("guest" + "_cart"); 
        }else{
            cartItemList = (ArrayList<CartItem>)session.getAttribute(customer.getId() + "_cart"); 
        } 
        PromotionCode promotionCode = (PromotionCode) request.getAttribute("promotion_code");
        CustomerOrder order = new CustomerOrder();
        String payment_method_entered = (String)request.getAttribute("payment_method_entered");
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
        <div class="row justify-content-center" id="main">
            <div class="col-md-5 order-md-2 mb-5" style="background-color: white;">
                <h5 style="text-align: center; margin: 20px 0px">Your Cart</h5>
                <div class="row justify-content-center overflow-hidden" id="productInCart">
                    <% for (int i = 0; i < cartItemList.size(); i++) { %>
                    <div class="row justify-content-center">
                        <div class="col-2 align-middle" id="productImage"><img src="/HobbitHall/Client/Share/images/book/<%= cartItemList.get(i).getProduct().getImage() %>" /><span class="badge badge-secondary badge-pill bg-warning text-dark"><%= cartItemList.get(i).getQuantity() %></span></div>
                        <div class="col-5 align-middle"><%= cartItemList.get(i).getProduct().getSubcategoryId().getName() %><br/><%= cartItemList.get(i).getProduct().getName() %></div>
                        <div class="col-5 align-middle text-end" style="padding-top: 30px;"><%= String.format("%.2f",cartItemList.get(i).getSubtotal()) %></div>
                    </div>
                    <% } %>
                </div>
                <div class="row justify-content-center" style="margin-bottom: 0px;">
                    <div class="col-md-12">
                        <hr class="mb-3">
                    </div>
                </div>
                <div class="row justify-content-start">
                        <form action="/HobbitHall/PromotionCodeControl" method="GET" class="input-group col-md-9">
                            <input type="hidden" name="action" value="applyPromotionCode"/>
                            <input type="text" name="promotion_code" class="form-control" aria-describedby="button-addon2" placeholder="ADD A DISCOUNT CODE">
                            <button class="btn btn-outline-secondary" type="submit" id="button-addon2">ADD</button>
                        </form>
                        <p class="text-danger col-md-12 text-start mb-0">${promotion_code_error}</p>
                </div>
                <div class="row justify-content-center" style="margin-bottom: 0px;">
                    <div class="col-md-12">
                        <hr class="mb-3">
                    </div>
                </div>
                <div class="row justify-content-center" id="calculation" style="margin-top: 0px;">
                    <div class="row justify-content-start">
                        <div class="col-md-5">Subtotal</div>
                        <div class="col-md-7 text-end">RM <%= String.format("%.2f",calculateCartTotal(cartItemList)) %></div>
                    </div>
                    <div class="row justify-content-start">
                        <div class="col-md-5">Delivery</div>
                        <div class="col-md-7 text-end">RM <%= String.format("%.2f",order.getDelivery()) %></div>
                    </div>
                    <% if(promotionCode != null){ %>
                    <div class="row justify-content-start">
                        <div class="col-md-5">Discount (<%= promotionCode.getCode()%>)</div>
                        <div class="col-md-7 text-end">RM (<%= String.format("%.2f", (calculateCartTotal(cartItemList) + order.getDelivery()) * promotionCode.getDiscountRate()) %>)</div>
                    </div>
                    <% } %>
                </div>
                <div class="row justify-content-start">
                    <div class="col-md-12">
                        <hr class="mb-3">
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="row justify-content-start">
                        <div class="col-md-5">Total</div>
                        <% if(promotionCode != null){ %>
                        <div class="col-md-7 text-end">RM <%= String.format("%.2f", (calculateCartTotal(cartItemList) + order.getDelivery()) -  ((calculateCartTotal(cartItemList) + order.getDelivery()) * promotionCode.getDiscountRate()))%></div>
                        <% }else{ %>
                        <div class="col-md-7 text-end">RM <%= String.format("%.2f", calculateCartTotal(cartItemList) + order.getDelivery()) %></div>
                        <% } %>
                    </div>
                </div>
            </div>
                        
            <form class="col-md-7" action="/HobbitHall/PaymentControl" method="POST">
                <% if(promotionCode != null){ %>
                    <input type="hidden" class="form-control" name="promotion_code" value="<%= promotionCode.getCode() %>">
                <% } %>
                <div class="row justify-content-start">
                    <a href="Payment.jsp"></a>
                    <h5>My Information</h5>
                </div>
                <div class="row justify-content-start mb-3">
                    <div class="col-md-6">
                        <label class="form-label col-form-label-sm font-weight-bold">Email</label>
                        <% if(customer.getId() == null){ %>
                        <input type="text" value="${email_entered}" class="form-control" name="email">
                        <% }else{ %>
                        <p>${customer.email}</p>
                        <input type="hidden" class="form-control" name="email" value="${customer.email}">
                        <% } %>
                    </div>
                    <p class="text-danger text-start mb-0">${email_error}</p>
                </div>
                <div class="row justify-content-start">
                    <h5>Delivery Information</h5>
                </div>
                <div class="row justify-content-start mb-2">
                    <div class="col-md-10">
                        <label class="form-label col-form-label-sm">Name</label>
                        <input type="text" class="form-control" name="receiver_name" value="${receiver_name_entered}">
                    </div>
                    <p class="text-danger text-start mb-0">${receiver_name_error}</p>
                </div>
                <div class="row justify-content-start mb-2">
                    <div class="col-md-10">
                        <label class="form-label col-form-label-sm">Address</label>
                        <input type="text" class="form-control" name="address" value="${address_entered}">
                    </div>
                    <p class="text-danger text-start mb-0">${address_error}</p>
                </div>
                <div class="row justify-content-start mb-2">
                    <div class="col-md-10">
                        <label class="form-label col-form-label-sm">Contact Number</label>
                        <input type="text" class="form-control" name="contact_number" value="${contact_number_entered}">
                    </div>
                    <p class="text-danger text-start mb-0">${contact_number_error}</p>
                </div>
                <div class="row justify-content-start">
                    <div class="col-md-10">
                        <hr class="mb-3">
                    </div>
                </div>
                <div class="row justify-content-start">
                    <h5>Payment (Master Card Only)</h5>
                </div>
                <div class="row justify-content-start mb-2" style="padding-left: 11px;">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="payment_method" value="Debit Card" 
                        <% if(payment_method_entered != null && payment_method_entered.equalsIgnoreCase("Debit Card")){ %> checked <% } %>/>
                        <label class="form-check-label">Debit Card</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="payment_method" value="Credit Card"
                        <% if(payment_method_entered != null && payment_method_entered.equalsIgnoreCase("Credit Card")){ %> checked <% } %>/>
                        <label class="form-check-label">Credit Card</label>
                    </div>
                    <p class="text-danger text-start mb-0 col-12">${payment_method_error}</p>
                </div>
                <div class="row justify-content-start mb-2">
                    <div class="col-md-5">
                        <label class="form-label col-form-label-sm">Name On Card</label>
                        <input type="text" class="form-control" name="card_owner" value="${card_owner_entered}">
                    </div>
                    <div class="col-md-5">
                        <label class="form-label col-form-label-sm">Card Number</label>
                        <input type="text" class="form-control" name="card_number" value="${card_number_entered}">
                    </div>
                    <p class="text-danger text-start mb-0 col-5">${card_owner_error}</p>
                    <p class="text-danger text-start mb-0 col-5">${card_number_error}</p>
                </div>
                <div class="row justify-content-start mb-2">
                    <div class="col-md-5">
                        <label class="form-label col-form-label-sm">Expiration</label>
                        <input type="text" class="form-control" name="card_expiration" value="${card_expiration_entered}">
                    </div>
                    <div class="col-md-5">
                        <label class="form-label col-form-label-sm">CVV</label>
                        <input type="text" class="form-control" name="card_cvv" value="${card_cvv_entered}">
                    </div>
                    <p class="text-danger text-start mb-0 col-5">${card_expiration_error}</p>
                    <p class="text-danger text-start mb-0 col-5">${card_cvv_error}</p>
                </div>
                <div class="row justify-content-start">
                    <div class="col-md-10">
                        <hr class="mb-3">
                    </div>
                </div>
                <div class="row justify-content-start">
                    <div class="col-md-10">
                        <button class="btn btn-primary col-md-12" type="submit">Place Order</button>
                    </div>
                </div>         
            </form>
        </div>
    </body>
    <%@include file="../Share/footer.html" %>
</html>
