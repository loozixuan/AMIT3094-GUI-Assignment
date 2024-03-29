<%-- 
    Document   : ProductCatalog
    Created on : Mar 12, 2021, 2:01:45 PM
    Author     : zixuan
--%>
<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="/HobbitHall/Client/Product/ProductDescription.css" rel="stylesheet"/>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" href="/HobbitHall/Client/Share/images/logoBook.png"/>
        <title>Hobbit Hall Book Store</title>
    </head>
    <%
        List<Product> productInfo = (List) session.getAttribute("productInfo");
        List<Product> prodList = (List) session.getAttribute("prodList");
    %>

    <!--Header-->
    <%@include file="../Share/header.jsp" %>
    <body>
        <div class="product-des-container pt-4">
            <% for (Product product : productInfo) {%>
            <div class="info-card p-2 d-flex justify-content-evenly">
                <div class="image-body p-4 d-flex justify-content-evenly">
                    <div class="small-image"><img class="d-block mx-auto" src="/HobbitHall/Client/Share/images/book/<%= product.getImage()%>" alt="book"/></div>
                    <div><img class="d-block mx-auto" src="/HobbitHall/Client/Share/images/book/<%= product.getImage()%>" alt="book" style="width:266px;height:400px;"/></div>
                </div>
                <div class="info-body p-4">
                    <div><%= product.getName()%></div>
                    <div class="author-info d-flex justify-content-between align-items-center">
                        <div>
                            <%= product.getAuthorName()%>
                        </div>
                        <div style="font-size: 25px">
                            <i class="fa fa-facebook-square" aria-hidden="true"></i>
                            <i class="fa fa-instagram" aria-hidden="true"></i>
                            <i class="fa fa-twitter-square" aria-hidden="true"></i>
                            <i class="fa fa-envelope-o" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div class="price-info d-flex align-items-baseline">
                        <div>Price: </div>
                        <div>RM <%= product.getPrice()%></div>
                    </div>
                    <div class="stock-info d-flex align-items-baseline">
                        <div>Stock: </div>
                        <div>
                            <% if (product.getStockQuantity() <= 0) { %>
                            <div class="d-flex stock" style="color:#677279"><span class="d-flex align-items-center"><i class="fa fa-circle" aria-hidden="true"></i></span><span>Sold Out</span></div>
                                    <% } else { %>
                            <div class="d-flex stock" style="color:#008a00"><span class="d-flex align-items-center"><i class="fa fa-circle" aria-hidden="true"></i></span><span> In Stock</span></div>
                                    <% }%>
                        </div>
                    </div>
                    <div class="stock-quantity-info d-flex align-items-baseline">
                        <div>Quantity Available: </div>
                        <% if (product.getStockQuantity() <= 0) {%>
                        <div style="color:#677279;font-weight: 500"><%= product.getStockQuantity()%></div>
                        <% } else {%>
                        <div style="color:#008a00;font-weight: 500"><%= product.getStockQuantity()%></div>
                        <% }%>
                    </div>

                    <input type="hidden" id="qty" value="<%= product.getStockQuantity()%>"/>

                    <div class="input-group">
                        <div class="input-group-button">
                            <button type="button" class="button" id="down" data-quantity="minus" data-field="quantity">
                                <i class="fa fa-minus" aria-hidden="true"></i>
                            </button>
                        </div>
                        <input class="input-group-field" type="number" name="quantity" id="myNumber" value="<%= (product.getStockQuantity()) == 0 ? 0 : 1%>">
                        <div class="input-group-button">
                            <button type="button" class="button hollow circle" id="up" data-quantity="plus" data-field="quantity">
                                <i class="fa fa-plus" aria-hidden="true"></i>
                            </button>
                        </div>
                    </div>
                    <div class="qty_status d-flex align-items-center" style="color:#be1e2d;font-weight: 500 ">
                    </div>
                    <div class="qty_status2 d-flex align-items-center" style="color:#be1e2d;font-weight: 500 ">
                        ${invalid_quantity_error}
                    </div>
                    <!-- Transfer Information to Shopping Cart -->
                    <form method="GET" action="/HobbitHall/ShoppingCart">
                        <input type="hidden" name="action" value="add"/>
                        <input type="hidden" name="product_ID" value="<%= product.getId()%>"/>
                        <input type="hidden" id="qtyBuy" name="qtyBuy" value=""/>
                        <% if (product.getStockQuantity() > 0) {%>
                        <div>
                            <a href="#"><button type="submit" class="btn-cart" id="cart-add">Add To Cart</button></a>
                        </div>
                        <% } else {%>
                        <div>
                            <a href="#"><button type="submit" class="btn-cart" id="cart-add" disabled>Add To Cart</button></a>
                        </div>
                        <% }%>
                    </form>
                </div>

            </div>

            <div class="des-card p-2">
                <div class="book-description-title p-4 mx-auto">
                    Description
                </div>
                <div class="book-description p-4 mx-auto">
                    <%= product.getDescription()%>
                </div>
            </div>
            <% }%>


            <div class="product-item-card p-2 mx-auto">
                <span class="section-title p-2" style="margin:20px;">You may also like this</span>
                <div class="prod-container row p-2 d-flex justify-content-between">
                    <% for (int i = 0; i < 4; i++) {%>
                    <div class="product-item-body p-3">
                        <a href="/HobbitHall/LoadProductDesc?productid=<%= prodList.get(i).getId()%>&subcategory=<%= prodList.get(i).getSubcategoryId().getId()%>"><img src="/HobbitHall/Client/Share/images/book/<%= prodList.get(i).getImage()%>" alt="book-image" style="max-width: 100%;width:260px;height:390px;"/></a>
                        <div><%= prodList.get(i).getName()%></div>
                        <div class="pt-3">RM <%= prodList.get(i).getPrice()%></div>
                        <% if (prodList.get(i).getStockQuantity() <= 0) {%>
                        <li class="sold-out"> Sold Out</li>
                        <a href="/HobbitHall/LoadProductDesc?productid=<%= prodList.get(i).getId()%>&subcategory=<%= prodList.get(i).getSubcategoryId().getId()%>"><button class="btn-cart w-100" disabled>Add To Cart</button></a>
                        <% } else {%>
                        <li class="in-stock"> In Stock</li>
                        <a href="/HobbitHall/LoadProductDesc?productid=<%= prodList.get(i).getId()%>&subcategory=<%= prodList.get(i).getSubcategoryId().getId()%>"><button class="btn-cart w-100">Add To Cart</button></a>
                        <% }%>
                    </div>
                    <% }%>
                </div>
            </div>
        </div>
    </body>

    <!--Footer-->
    <%@include file="../Share/footer.html" %>

    <script>
        jQuery(document).ready(function () {
            // This button will increment the value
            $('[data-quantity="plus"]').click(function (e) {
                // Stop acting like a button
                e.preventDefault();
                // Get the field name
                fieldName = $(this).attr('data-field');
                // Get its current value
                var currentVal = parseInt($('input[name=' + fieldName + ']').val());
                // If is not undefined
                if (!isNaN(currentVal)) {
                    // Increment
                    $('input[name=' + fieldName + ']').val(currentVal + 1);
                } else {
                    // Otherwise put a 0 there
                    $('input[name=' + fieldName + ']').val(0);
                }

                var qtyInput = parseInt(document.getElementById('myNumber').value)
                if (qtyInput === 0) {
                    $(".btn-cart").attr("disabled", true);
                } else {
                    document.getElementById("up").disabled = false;
                    $(".btn-cart").attr("disabled", false);
                }
//                console.log(currentVal);
                document.getElementById('qty').value;

                if ((currentVal + 1) > document.getElementById('qty').value) {
                    $(".btn-cart").attr("disabled", true);
                    var qty_status = "<div class='qty-status-text'>Out Of Stock !</div>"
                    $(".qty_status").append(qty_status);
                    document.getElementById("up").disabled = true;
                }
                document.getElementById('qtyBuy').value = currentVal + 1;
//                console.log("qty avalilable:" + document.getElementById('qty').value);
//                console.log("qty but: " + document.getElementById('qtyBuy').value);
            });

            $("#myNumber").keyup(function () {
                var qtyInput = parseInt(document.getElementById('myNumber').value)
                var qtyAvailable = parseInt(document.getElementById('qty').value)
                if (qtyInput > qtyAvailable) {
                    $(".btn-cart").attr("disabled", true);
                    document.getElementById("up").disabled = true;
                } else {
                    $(".qty_status").text('');
                    document.getElementById("up").disabled = false;
                    $(".btn-cart").attr("disabled", false);
                }
                document.getElementById('qtyBuy').value = qtyInput;
            });

            // This button will decrement the value till 0
            $('[data-quantity="minus"]').click(function (e) {
                // Stop acting like a button
                e.preventDefault();
                // Get the field name
                fieldName = $(this).attr('data-field');
                // Get its current value
                var currentVal = parseInt($('input[name=' + fieldName + ']').val());
                // If it isn't undefined or its greater than 0
                if (!isNaN(currentVal) && currentVal > 0) {
                    // Decrement one
                    $('input[name=' + fieldName + ']').val(currentVal - 1);
                } else {
                    // Otherwise put a 0 there
                    $('input[name=' + fieldName + ']').val(0);
                }
//                console.log(currentVal);
                var qtyInput = parseInt(document.getElementById('myNumber').value)
                var qtyAvailable = parseInt(document.getElementById('qty').value)
                if ((currentVal + 1) > document.getElementById('qty').value) {
                    $(".qty_status").text('');
                    document.getElementById("up").disabled = false;
                    $(".btn-cart").attr("disabled", false);
                }

//                console.log("current val: " + (currentVal + 1))
//                console.log("qty input: " + qtyInput)
                if (qtyInput > qtyAvailable) {
                    $(".btn-cart").attr("disabled", true);
                    document.getElementById("up").disabled = true;
                } else {
                    document.getElementById("up").disabled = false;
                    $(".btn-cart").attr("disabled", false);
                }

                if (qtyInput === 0) {
                    $(".btn-cart").attr("disabled", true);
                } else {
                    document.getElementById("up").disabled = false;
                    $(".btn-cart").attr("disabled", false);
                }

                document.getElementById('qtyBuy').value = currentVal - 1;
//                console.log("qty avalilable:" + document.getElementById('qty').value);
//                console.log("qty but: " + document.getElementById('qtyBuy').value);
            });

            $(".btn-cart").click(function () {
                var qtyInput = parseInt(document.getElementById('myNumber').value)
                if (qtyInput === 0) {
                    $(".btn-cart").attr("disabled", true);
                } else {

                    document.getElementById("up").disabled = false;
                    $(".btn-cart").attr("disabled", false);
                    document.getElementById('qtyBuy').value = qtyInput;
                    console.log(document.getElementById('qtyBuy').value)
                }
            });

        });
    </script>
</html>

