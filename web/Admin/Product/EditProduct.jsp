<%-- 
    Document   : modifyProduct
    Created on : Mar 17, 2021, 5:50:47 PM
    Author     : Chrisann Lee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Product"%>
<% Product product = (Product) request.getAttribute("product");%>
<%@page import="entity.Subcategory,java.util.List"%>
<% List<Subcategory> subCategoryList = (List<Subcategory>) request.getAttribute("subCategoryList");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="/HobbitHall/Admin/Share/images/logo-book.png"/>
        <link rel="stylesheet" href="/HobbitHall/Admin/Product/EditProduct.css"/>
        <title>Hobbit Hall</title>
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
                        <h4>Edit Product</h4>
                        <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                        <ul class="breadcrumb">
                            <li><a href="#">Product</a></li>
                            <li>Edit Product</li>
                        </ul>
                    </div>

                    <div class="productDetail">
                        <form action="/HobbitHall/UpdateProduct" enctype="multipart/form-data" method="post">
                            <div class="productInfo">
                                <% String errorMessage = (String) request.getAttribute("errorMessage");
                                    if (errorMessage != null) {%>
                                <p class="errorMessage"><%= errorMessage%></p>
                                <% }%>
                                <h4>Product ID - <%=product.getId()%></h4>
                                <div class="banner">Product Details</div>
                                <div class="img">
                                    <img src="/HobbitHall/Client/Share/images/book/<%=product.getImage()%>" class="img"/>
                                </div>
                                <table>
                                    <tr><td>Product ID</td><td>: <input type="text" name="pro_id"  value="<%=product.getId()%>" readonly></td></tr>
                                    <tr><td>Product Name</td><td>: <input type="text" name="pro_name" value="<%=product.getName()%>"></td></tr>
                                    <tr><td>Author</td><td>: <input type="text" name="author" value="<%=product.getAuthorName() %>"></td></tr>
                                    <tr><td>Description</td><td>: 
                                            <textarea id="description" name="description" rows="4" cols="30"><%=product.getDescription()%></textarea></td>
                                    </tr>
                                    <tr><td>Price (RM)</td><td>: <input type="text" name="price" value="<%=product.getPrice()%>"></td></tr>
                                    <tr><td>Sub Category</td><td>: 
                                            <select name="subCategory" id="subCategory" required>
                                                <% for (int i = 0; i < subCategoryList.size(); i++) {
                                                        Subcategory subcategory = subCategoryList.get(i);
                                                %>
                                                <option value="<%=subcategory.getId()%>"><%= subcategory.getName()%></option>

                                                <% }%>
                                            </select></td>
                                    </tr>
                                    <tr><td>Quantity</td><td>: <input type="text" name="quantity" value="<%=product.getStockQuantity()%>"></td></tr>
                                    <tr><td>Image name</td><td>: <input type="text" name="file_name" value="" required/></td></tr>
                                    <tr><td>Upload Image</td><td>: <input type="file" name="file2" style="margin-left:20px;" required/></td></tr>
                                    <tr><td>Status</td><td>: <input type="text" name="status" value="Active" disabled></td></tr>
                                </table>

                            </div> 
                            <div class="update"><input type="submit" name="update" value="Update" onclick="return confirm('Are you sure to update this book details?');" style='background-image: radial-gradient(circle, #37bd0b, #3dc80d, #42d40f, #48df10, #4eeb12);;'></div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
