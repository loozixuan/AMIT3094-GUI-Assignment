<%-- 
    Document   : Search
    Created on : Mar 26, 2021, 3:00:51 PM
    Author     : zixua
--%>

<%@page import="entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="/HobbitHall/Client/Product/ProductCatolog.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" href="/HobbitHall/Client/Share/images/logoBook.png"/>
        <title>Hobbit Hall</title>
    </head>
    <%
        List<Product> productSearch = (List) request.getAttribute("product");
        List<Subcategory> subcategoryList = (List) request.getAttribute("subcategoryList");
        String catID = "";
        int countP = 0;
        String keyword = (String) request.getAttribute("keyword");
    %>
    <!--Header-->
    <%@include file="../Share/header.jsp" %>
    <body>
        <div class="product-catalog-container d-flex justify-content-around p-4">
            <div class="prod-filter-container d-flex flex-column p-2" style="height:375px;">
                <h5 class="p-2" style="color:#323e48;"><b>Sub-Categories</b></h5>
                <div style="height: 300px;overflow: auto;">
                    <% if (!subcategoryList.isEmpty()) { %>
                    <% for (Subcategory subcategory : subcategoryList) {%>
                    <div class="sub-ctg d-flex flex-column">
                        <div>
                            <i class="fa fa-book" aria-hidden="true"></i><a href="/HobbitHall/ViewProducts?name=price&order=asc&subcategory=<%= subcategory.getId()%>&category=<%= subcategory.getCategoryId().getId()%>"/><%= subcategory.getName()%></a>
                        </div>
                    </div>
                    <% }%>
                    <%} else {%>
                    <div class="sub-ctg-none d-flex flex-column" style="border-bottom:none !important;">
                        <div></div>
                    </div>
                    <%}%>
                </div>
            </div>

            <div class="prod-list-container w-75 p-2">
                <div class="prod-title-container p-2">

                    <% if (!productSearch.isEmpty()) {%>
                    <% for (Product product : productSearch) {
                            countP++;
                        }%>
                    <div class="prod-title">
                        Search Result for "<%= keyword%>"
                    </div>
                    <div class="d-flex justify-content-between pt-3">
                        <span style="color: #677279; font-weight:500 ; font-size: 0.9rem;">Showing 1 - <%= countP%> of <%= countP%> products</span>
                    </div>
                    <%} else {%>
                    <div class="prod-title">
                        Sorry, nothing found for  "<%= keyword%>"
                    </div>
                    <div class="prod-container row p-2 d-flex justify-content-between">
                        <div class="d-flex justify-content-between pt-3" style="padding-left:0">
                            <span style="color: #677279; font-weight:500 ; font-size: 0.9rem;">Showing 0 products</span>
                        </div>
                    </div>
                    <%}%>
                </div>

                <div class="prod-container row p-2 d-flex">
                    <% if (!productSearch.isEmpty()) {%>
                    <% for (Product product : productSearch) {%>
                    <div class="book-body p-2 mb-3">
                        <a href="/HobbitHall/LoadProductDesc?productid=<%= product.getId()%>&subcategory=<%= product.getSubcategoryId().getId()%>"><img class="d-block mx-auto" src="/HobbitHall/Client/Share/images/book/<%= product.getImage()%>" alt="book-image" style="max-width: 100%;width:220px;height:310px;"/></a>
                        <div><%= product.getName()%></div>
                        <div class="pt-3">RM <%= product.getPrice()%></div>
                        <% if (product.getStockQuantity() <= 0) {%>
                        <li class="sold-out"> Sold Out</li>
                        <a href="/HobbitHall/LoadProductDesc?productid=<%= product.getId()%>&subcategory=<%= product.getSubcategoryId().getId()%>"><button class="btn-cart" disabled>Add To Cart</button></a>
                        <% } else {%>
                        <li class="in-stock"> In Stock</li>
                        <a href="/HobbitHall/LoadProductDesc?productid=<%= product.getId()%>&subcategory=<%= product.getSubcategoryId().getId()%>"><button class="btn-cart">Add To Cart</button></a>
                        <% }%>
                    </div>
                    <% }%>
                    <%} else {%>
                    <div class="prod-container mt-4 p-2 d-block w-75 mx-auto">
                        <div class="product-err-msg text-center p-1">Sorry, no products matched the keyword.</div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </body>
    <!--Footer-->
    <%@include file="../Share/footer.html" %>
</html>
