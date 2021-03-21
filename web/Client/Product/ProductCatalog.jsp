<%-- 
    Document   : ProductCatalog
    Created on : Mar 12, 2021, 2:01:45 PM
    Author     : zixua
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
        <link href="ProductCatolog.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" href="../Share/images/logoBook.png"/>
        <title>Hobbit Hall Book Store</title>
    </head>
    <!--Header-->
    <%@include file="../Share/header.html" %>

    <!-- retrieve session object, prodList -->
    <%
        List<Product> prodList = (List) session.getAttribute("prodList");
    %>

    <body>
        <div class="product-catalog-container d-flex justify-content-around p-4">
            <div class="prod-filter-container d-flex flex-column p-2">
                <h5 class="p-2" style="color:#323e48;"><b>Categories</b></h5>
                <div class="sub-ctg d-flex flex-column">
                    <div>
                        <i class="fa fa-briefcase" aria-hidden="true"></i><a href="#">Business</a>
                    </div>
                    <div>
                        <i class="fa fa-pinterest" aria-hidden="true"></i><a href="#">Art</a>
                    </div>
                    <div>
                        <i class="fa fa-user-circle" aria-hidden="true"></i><a href="#">Young Adult</a>
                    </div>
                    <div>
                        <i class="fa fa-commenting-o" aria-hidden="true"></i><a href="#">Self Help</a>
                    </div>
                </div>
            </div>
            <div class="prod-list-container w-75 p-2">
                <div class="prod-title-container p-2">
                    <div class="prod-title">
                        Business
                    </div>
                    <div class="d-flex justify-content-between">
                        <span style="color: #677279; font-size: 0.9rem;"><b>Showing 1 - 5 of 5 products</b></span>
                        <select name="filters" class="book-filters">
                            <option value="lowTHigh">Price: Low to High</option>
                            <option value="highTLow">Price: High to Low</option>
                            <option value="A-Z">Alphabetically, A-Z</option>
                            <option value="Z-A">Alphabetically, Z-A</option>
                        </select>
                    </div>
                </div>

                <!-- Load Product List -->
                <div class="prod-container row p-2 d-flex justify-content-between">
                    <% for (Product product : prodList) {%>
                    <div class="book-body p-2 mb-3">
                        <a href="ProductDescription.jsp"><img src=<%= product.getImage()%> src="book-image" style="max-width: 100%"/></a>
                        <div><%= product.getName()%></div>
                        <div>RM <%= product.getPrice()%></div>
                        <% if (product.getStockQuantity() <= 0) { %>
                        <li class="sold-out"> Sold Out</li>
                            <% } else { %>
                        <li class="in-stock"> In Stock</li>
                            <% } %>
                        <button class="btn-cart">Add To Cart</button>
                    </div>
                    <% }%>
                </div>
            </div>
        </div>
    </body>

    <!--Footer-->
    <%@include file="../Share/footer.html" %>
</html>

