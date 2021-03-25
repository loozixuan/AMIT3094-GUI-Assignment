<%-- 
    Document   : product
    Created on : Mar 17, 2021, 10:40:07 AM
    Author     : Chrisann Lee
--%>

<%@page import="entity.Product,java.util.List"%>
<% List<Product> proList = (List<Product>) session.getAttribute("productList"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../Share/images/logo-book.png"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="Product.css"/>
        <title>Hobbit Hall</title>
    </head>
    <body>
        <!--Header-->
        <%@ include file="../Share/adminHeader.html" %>
        <!--Sidebar-->
        <%@ include file="../Share/adminSidebar.html" %>


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
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </div>
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Chiness Books
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </div>
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Malay Books
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </div>
                    </div>
                    <% if (!proList.isEmpty()) { %>
                    <div class="table">       
                        <div class="h">
                            <div>Product Catalog</div>
                            <div id="searchBar">
                                <input type="text" name="search" placeholder="Search Product">
                                <div id="searchIconContainer">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </div>
                            </div>

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
                                <td ><%= product.getId()%></td>
                                <td><%= product.getName()%></td>
                                <td><img src="../../Client/Share/images/book/business/<%= product.getImage()%>" class="img"/></td>
                                <td><%= product.getPrice()%></td>
                                <td><%= product.getStockQuantity()%></td>
                                <td><i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i></td>
                                <td><i class='fas fa-trash-alt'></i></td>
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
