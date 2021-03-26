<%-- 
    Document   : ProductCatalog
    Created on : Mar 12, 2021, 2:01:45 PM
    Author     : zixua
--%>
<%@page import="entity.Subcategory"%>
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
    <%@include file="../Share/header.jsp" %>

    <!-- Retrieve session object -->
    <%
        List<Product> prodList = (List) session.getAttribute("prodList");
        List<Subcategory> subcategoryTitle = (List) session.getAttribute("subcategoryTitle");
        List<Subcategory> subcategoryList = (List) session.getAttribute("subcategoryList");
        int countProduct = 0;
    %>

    <body>
        <div class="product-catalog-container d-flex justify-content-around p-4">
            <div class="prod-filter-container d-flex flex-column p-2">
                <h5 class="p-2" style="color:#323e48;"><b>Categories</b></h5>
                <div class="sub-ctg d-flex flex-column">
                    <% for (Subcategory subcategory : subcategoryList) {%>
                    <div>
                        <i class="fa fa-book" aria-hidden="true"></i><a href="../../ViewProducts?name=price&order=asc&subcategory=<%= subcategory.getId()%>&category=<%= subcategory.getCategoryId().getId()%>"/><%= subcategory.getName()%></a>
                    </div>
                    <% }%>
                    <% if (!prodList.isEmpty()) { %>
                    <% for (int i = 0; i < 1; i++) {%>
                    <div class="filter-container d-flex flex-column pt-4">
                        <h5 class="p-1" style="color:#323e48;"><b>Filters</b></h5>

                        <div style="padding:5px">
                            <i class="fa fa-money" aria-hidden="true"></i>
                            <a href="../../ViewProducts?name=price&order=asc&subcategory=<%= prodList.get(i).getSubcategoryId().getId()%>&category=<%= prodList.get(i).getSubcategoryId().getCategoryId().getId()%>" >Price Low to High</a>
                        </div>
                        <div style="padding:5px">
                            <i class="fa fa-money" aria-hidden="true"></i>
                            <a href="../../ViewProducts?name=price&order=desc&subcategory=<%= prodList.get(i).getSubcategoryId().getId()%>&category=<%= prodList.get(i).getSubcategoryId().getCategoryId().getId()%>">Price High to Low</a>
                        </div>
                        <div style="padding:5px">
                            <i class="fa fa-sort-alpha-asc" aria-hidden="true"></i>
                            <a href="../../ViewProducts?name=name&order=asc&subcategory=<%= prodList.get(i).getSubcategoryId().getId()%>&category=<%= prodList.get(i).getSubcategoryId().getCategoryId().getId()%>">Alphabetically, A-Z</a>
                        </div>
                        <div style="padding:5px">
                            <i class="fa fa-sort-alpha-desc" aria-hidden="true"></i>
                            <a href="../../ViewProducts?name=name&order=desc&subcategory=<%= prodList.get(i).getSubcategoryId().getId()%>&category=<%= prodList.get(i).getSubcategoryId().getCategoryId().getId()%>">Alphabetically, Z-A</a>
                        </div>
                    </div>  
                    <% }%>
                    <% } else {%>
                    <div class="filter-container d-flex flex-column pt-4">
                        <h5 class="p-1" style="color:#323e48;"><b>Filters</b></h5>

                        <div style="padding:5px">
                            <i class="fa fa-money" aria-hidden="true"></i>
                            <a href="#" >Price Low to High</a>
                        </div>
                        <div style="padding:5px">
                            <i class="fa fa-money" aria-hidden="true"></i>
                            <a href="#" >Price High to Low</a>
                        </div>
                        <div style="padding:5px">
                            <i class="fa fa-sort-alpha-asc" aria-hidden="true"></i>
                            <a href="#" >Alphabetically, A-Z</a>
                        </div>
                        <div style="padding:5px">
                            <i class="fa fa-sort-alpha-desc" aria-hidden="true"></i>
                            <a href="#" >Alphabetically, Z-A</a>
                        </div>
                    </div>
                    <% }%>

                </div>
            </div>

            <div class="prod-list-container w-75 p-2">
                <div class="prod-title-container p-2">
                    <!-- Retrieve Product Title from Database -->
                    <div class="prod-title">
                        <% for (Subcategory subcategory : subcategoryTitle) {%>
                        <%= subcategory.getName()%>
                        <% }%>
                    </div>
                    <% if (!prodList.isEmpty()) { %>
                    <% for (Product product : prodList) {
                            countProduct++;
                        }%>
                    <div class="d-flex justify-content-between pt-3">
                        <span style="color: #677279; font-weight:500 ; font-size: 0.9rem;">Showing 1 - <%= countProduct%> of <%= countProduct%> products</span>
                        <!--                        <select name="filters" class="book-filters">
                                                    <option value="price asc">Price: Low to High</option>
                                                    <option value="price desc">Price: High to Low</option>
                                                    <option value="A-Z">Alphabetically, A-Z</option>
                                                    <option value="Z-A">Alphabetically, Z-A</option>
                                                </select>-->
                    </div>
                    <% } else {%>
                    <div class="prod-container row p-2 d-flex justify-content-between">
                        <div class="d-flex justify-content-between pt-3" style="padding-left:0">
                            <span style="color: #677279; font-weight:500 ; font-size: 0.9rem;">Showing 0 products</span>
                        </div>
                    </div>
                    <%}%>
                </div>

                <% if (!prodList.isEmpty()) { %>
                <!-- Load Product List -->
                <div class="prod-container row p-2 d-flex justify-content-between">
                    <% for (Product product : prodList) {%>
                    <div class="book-body p-2 mb-3">
                        <a href="../../LoadProductDesc?productid=<%= product.getId()%>&subcategory=<%= product.getSubcategoryId().getId()%>"><img src=<%= product.getImage()%> src="book-image" style="max-width: 100%"/></a>
                        <div><%= product.getName()%></div>
                        <div class="pt-3">RM <%= product.getPrice()%></div>
                        <% if (product.getStockQuantity() <= 0) {%>
                        <li class="sold-out"> Sold Out</li>
                        <a href="../../LoadProductDesc?productid=<%= product.getId()%>&subcategory=<%= product.getSubcategoryId().getId()%>"><button class="btn-cart" disabled>Add To Cart</button></a>
                        <% } else {%>
                        <li class="in-stock"> In Stock</li>
                        <a href="../../LoadProductDesc?productid=<%= product.getId()%>&subcategory=<%= product.getSubcategoryId().getId()%>"><button class="btn-cart">Add To Cart</button></a>
                        <% }%>
                    </div>
                    <% }%>
                </div>
                <% } else {%>

                <div class="prod-container mt-4 p-2 d-block w-75 mx-auto">
                    <div class="product-err-msg text-center p-1">Sorry, this product category currently don't have any products.
                        <br />Please browse other category to continue your shopping.</div>
                </div>
                <%}%>
            </div>
        </div>
    </body>

    <!--Footer-->
    <%@include file="../Share/footer.html" %>
</html>

