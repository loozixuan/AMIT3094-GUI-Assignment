<%-- 
    Document   : DeleteProduct
    Created on : Mar 27, 2021, 5:04:49 PM
    Author     : Chrisann Lee
--%>
<%@page import="entity.Product"%>
<% Product product = (Product) request.getAttribute("product");
    String action = (String) request.getAttribute("action");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/HobbitHall/Admin/Product/EditProduct.css"/>
        <link rel="icon" href="/HobbitHall/Admin/Share/images/logo-book.png"/>
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
                        <h4><%=action%> Product</h4>
                        <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                        <ul class="breadcrumb">
                            <li> <a href="/HobbitHall/ProcessProduct?action=view">Product</a></li>
                            <li><%=action%> Product</li>
                        </ul>
                    </div>

                    <div class="productDetail">
                        <form action="/HobbitHall/ProcessProduct?action=deleteSingleProd" method="post">
                            <% if (product != null) {%>
                            <div class="productInfo">
                                <h4>Product ID - <%= product.getId()%></h4>
                                <div class="banner">Product Details</div>
                                <div class="img">
                                    <img src="http://localhost:48180/HobbitHall/Client/Share/images/book/<%=product.getImage()%>" class="img"/>
                                </div>
                                <table>
                                    <tr><td>Product ID</td><td>: <input type="text" name="pro_id"  value="<%= product.getId()%>" readonly ></td></tr>
                                    <tr><td>Product Name</td><td>: <input type="text" name="pro_name" value="<%= product.getName()%>" readonly ></td></tr>
                                    <tr><td>Author</td><td>: <input type="text" name="author" value="<%=product.getAuthorName()%>" readonly ></td></tr>
                                    <tr><td>Description</td><td>: 
                                            <textarea id="description" name="description" rows="4" cols="30" readonly ><%=product.getDescription()%></textarea></td>
                                    </tr>
                                    <tr><td>Price (RM)</td><td>: <input type="text" name="price" value="RM <%= product.getPrice()%>" readonly ></td></tr>
                                    <tr><td>Sub Category</td><td>: <input type="text" name="price" value="<%= product.getSubcategoryId().getName()%>" readonly ></td></tr>
                                    <tr><td>Quantity</td><td>: <input type="text" name="quantity" value="<%= product.getStockQuantity()%>" readonly ></td></tr>
                                    <tr><td>Status</td><td>: <input type="text" name="status" value="<%= product.getStatus()%>" readonly ></td></tr>
                                </table>

                            </div> 
                            <%}%>
                            <%  if (!action.equals("View")) {%>
                            <div class="delete"><input type="submit" name="delete" value="Delete" onclick="return confirm('Are you sure to delete this product?');"></div>
                                <%}%>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>

