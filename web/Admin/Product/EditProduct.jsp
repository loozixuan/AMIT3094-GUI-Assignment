<%-- 
    Document   : modifyProduct
    Created on : Mar 17, 2021, 5:50:47 PM
    Author     : Chrisann Lee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../images/logo-book.png"/>
        <link rel="stylesheet" href="EditProduct.css"/>
        <link rel="icon" href="../Share/images/logo-book.png"/>
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
                        <h4>Edit Product</h4>
                        <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                        <ul class="breadcrumb">
                            <li><a href="#">Product</a></li>
                            <li>Edit Product</li>
                        </ul>
                    </div>

                    <div class="productDetail">
                        <div class="productInfo">
                            <h4>Product ID - 123456</h4>
                            <div class="banner">Product Details</div>
                            <div class="img">
                                <img src="../../Client/Share/images/book/business/business1.jpg" class="img"/>
                            </div>
                            <table>
                                <tr><td>Product ID</td><td>: <input type="text" name="pro_id"  value="123456"></td></tr>
                                <tr><td>Product Name</td><td>: <input type="text" name="pro_name" value="Lean In"></td></tr>
                                <tr><td>Author</td><td>: <input type="text" name="author" value="Sherlyn"></td></tr>
                                <tr><td>Description</td><td>: 
                                        <textarea id="description" name="description" rows="4" cols="30">Motivation</textarea></td>
                                </tr>
                                <tr><td>Price (RM)</td><td>: <input type="text" name="price" value="122"></td></tr>
                                <tr><td>Sub Category</td><td>: 
                                        <select name="subCategory" id="subCategory">
                                            <option value="volvo">Volvo</option>
                                            <option value="saab">Saab</option>
                                            <option value="mercedes">Mercedes</option>
                                            <option value="audi">Audi</option>
                                        </select></td>
                                </tr>
                                <tr><td>Quantity</td><td>: <input type="text" name="quantity" value="123"></td></tr>
                                <tr><td>Status</td><td>: <input type="text" name="status" value="Available" disabled></td></tr>
                            </table>

                        </div> 
                        <div class="delete"><input type="submit" name="update" value="Update" onclick="return confirm('Are you sure to update this book details?');" style='background-image: radial-gradient(circle, #37bd0b, #3dc80d, #42d40f, #48df10, #4eeb12);;'></div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
