<%-- 
    Document   : product
    Created on : Mar 17, 2021, 10:40:07 AM
    Author     : Chrisann Lee
--%>

<%@page import="entity.Product,java.util.List"%>
<% List<Product> proList = (List<Product>) request.getAttribute("productList"); %>
<%@page import="entity.Subcategory,java.util.List"%>
<% List<Subcategory> subCategoryList = (List<Subcategory>) session.getAttribute("subCategoryList"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="/HobbitHall/Admin/Share/images/logo-book.png"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="/HobbitHall/Admin/Product/Product.css"/>
        <link href="/HobbitHall/Admin/Share/adminPanel.css" rel="stylesheet">
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
                        <h2>Product</h2>
                        <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                        <ul class="breadcrumb">
                            <li><a href="#">Product</a></li>

                        </ul>
                    </div>
                    <div class="nav-book-category">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                English Books
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <% for (int i = 0; i < subCategoryList.size(); i++) {
                                        Subcategory subCategory = subCategoryList.get(i);
                                        if (subCategory.getCategoryId().getId().equalsIgnoreCase("1")) {%>
                                <a class="dropdown-item" href="/HobbitHall/ProcessProduct?action=viewSubcategoryProd&subcategory=<%=subCategory.getId()%>"><%= subCategory.getName()%></a>
                                <%}
                                    }%>
                            </div>
                        </div>
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Chinese Books
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <% for (int i = 0; i < subCategoryList.size(); i++) {
                                        Subcategory subCategory = subCategoryList.get(i);
                                        if (subCategory.getCategoryId().getId().equalsIgnoreCase("2")) {%>
                                <a class="dropdown-item" href="/HobbitHall/ProcessProduct?action=viewSubcategoryProd&subcategory=<%=subCategory.getId()%>"><%= subCategory.getName()%></a>
                                <%}
                                    }%>
                            </div>
                        </div>
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Malay Books
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <% for (int i = 0; i < subCategoryList.size(); i++) {
                                        Subcategory subCategory = subCategoryList.get(i);
                                        if (subCategory.getCategoryId().getId().equalsIgnoreCase("3")) {%>
                                <a class="dropdown-item" href="/HobbitHall/ProcessProduct?action=viewSubcategoryProd&subcategory=<%=subCategory.getId()%>"><%= subCategory.getName()%></a>
                                <%}
                                    }%>
                            </div>
                        </div>
                    </div>

                    <% if (!proList.isEmpty()) { %>

                    <div class="table">       
                        <div class="h">
                            <div>Product Catalog</div>

                            <form action="/HobbitHall/ProcessProduct?action=search" method="post">
                                <div id="searchBar">
                                    <input type="text" name="search" placeholder="ID , Name , Author" value="" style="font-size: 0.8em">
                                    <input type="submit" name="search" value="Search"  id="search"/>
                                </div>
                            </form>
                        </div>
                        <table  class="tableUser">
                            <tr>
                                <th>Product ID</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>

                            <% for (int i = 0; i < proList.size(); i++) {
                                    Product product = proList.get(i);
                            %>
                            <tr>
                                <td ><a href="/HobbitHall/ProcessProduct?action=viewSingleProd&prodID=<%=product.getId()%>"><%= product.getId()%></a></td>
                                <td><%= product.getName()%></td>
                                <td><img src="http://localhost:48180/HobbitHall/Client/Share/images/book/<%= product.getImage()%>" class="img"/></td>
                                <td><%= product.getPrice()%></td>
                                <td><%= product.getStockQuantity()%></td>
                                <td><a href="/HobbitHall/ProcessProduct?action=edit&prodID=<%=product.getId()%>"><i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i></a></td>
                                <td><a href="/HobbitHall/ProcessProduct?action=delete&prodID=<%=product.getId()%>"><i class='fas fa-trash-alt'></i></a></td>
                            </tr>

                            <% }%>
                        </table>
                    </div>
                    <% } else { %>
                    <div class="no_product">
                        <h1>No product!</h1>
                    </div>
                    <% }%>

                </div>
            </div>
        </div>
    </body>
</html>
