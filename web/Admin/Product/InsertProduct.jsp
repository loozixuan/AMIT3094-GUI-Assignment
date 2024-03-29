<%-- 
    Document   : insertProduct
    Created on : Mar 17, 2021, 7:54:02 PM
    Author     : Chrisann Lee
--%>
<%@page import="entity.Subcategory,java.util.List"%>
<% List<Subcategory> subCategoryList = (List<Subcategory>) session.getAttribute("subCategoryList"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="/HobbitHall/Admin/Share/images/logo-book.png"/>
        <link rel="stylesheet" href="/HobbitHall/Admin/Product/InsertProduct.css"/>
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
                        <h4>Insert Product</h4>
                        <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                        <ul class="breadcrumb">
                            <li><a href="#">Insert Product</a></li>
                        </ul>
                    </div>

                    <div class="productDetail">
                        <form action="/HobbitHall/InsertProduct" enctype="multipart/form-data" method="post">
                            <div class="productInfo">
                                <% String errorMessage = (String) request.getAttribute("errorMessage");
                                    if (errorMessage != null) {%>
                                <p class="errorMessage"><%= errorMessage%></p>
                                <% }%>
                                
                                 <% String successMessage = (String) request.getAttribute("successMessage");
                                 String prodID = (String) request.getAttribute("prodID");
                                    if (successMessage != null) {
                                   %>
                                    <a href="/HobbitHall/ProcessProduct?action=viewSingleProd&prodID=<%=prodID%>"><p class="successMessage"><%= successMessage%></p></a>
                                <% }%>
                                <div class="banner">Insert Product</div>

                                <%
                                    String file_name = (String) request.getParameter("file_name");
                                    if (file_name != null) {
                                %>
                                <div class="img">
                                    <img src="http://localhost:48180/HobbitHall/Client/Share/images/book/<%=file_name%>" class="img"/>
                                </div>
                                <%
                                    }
                                %>
                                <table>
                                    <tr><td>Product Name</td><td>: <input type="text" name="pro_name" value="" required/></td></tr>
                                    <tr><td>Author</td><td>: <input type="text" name="author" value="" required/></td></tr>
                                    <tr><td>Description</td><td>: 
                                            <textarea id="description" name="description" rows="4" cols="35" required> </textarea></td>
                                    </tr>
                                    <tr><td>Price (RM)</td><td>: <input type="text" name="price" value="" required/></td></tr>
                                    <tr><td>Sub Category</td><td>: 
                                            <select name="subCategory" id="subCategory" required>
                                                <% for (int i = 0; i < subCategoryList.size(); i++) {
                                                        Subcategory subcategory = subCategoryList.get(i);
                                                %>
                                                <option value="<%= subcategory.getId() %>"><%= subcategory.getName()%></option>

                                                <% }%>
                                            </select></td>
                                    </tr>  
                                    <tr><td>Quantity</td><td>: <input type="text" name="quantity" value="" required=""/></td></tr>
                                    <tr><td>Image name</td><td>: <input type="text" name="file_name" value="" required/></td></tr>
                                    <tr><td>Upload Image</td><td>: <input type="file" name="file2" style="margin-left:20px;" required/></td></tr>
                                </table>
                                                
                                <input type="hidden" name="category" value="<%=subCategoryList.get(0).getCategoryId().getId()%>" >
                            </div> 
                            <div class="delete"><input type="submit" name="add" value="Add"  style='background-image: radial-gradient(circle, #37bd0b, #3dc80d, #42d40f, #48df10, #4eeb12);;'></div>
                        </form>
                      
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>