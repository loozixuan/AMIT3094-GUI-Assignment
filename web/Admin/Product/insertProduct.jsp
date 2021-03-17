<%-- 
    Document   : insertProduct
    Created on : Mar 17, 2021, 7:54:02 PM
    Author     : Chrisann Lee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../images/logo-book.png"/>
        <link rel="stylesheet" href="editProduct.css"/>
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
                        <h4>Insert Product</h4>
                        <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                        <ul class="breadcrumb">
                            <li><a href="#">Insert Product</a></li>
                        </ul>
                    </div>

                    <div class="orderDetail">
                        <div class="custInfo">
                            <div class="banner">Insert Product</div>
                            <div class="img">
                                <img src="../../Client/Share/images/book/business/business1.jpg" class="img"/>
                            </div>
                            <table>
                                <tr><td>Product ID</td><td>: <input type="text" name="pro_id"  value=""></td></tr>
                                <tr><td>Product Name</td><td>: <input type="text" name="pro_name" value=""></td></tr>
                                <tr><td>Author</td><td>: <input type="text" name="author" value=""></td></tr>
                                <tr><td>Description</td><td>: 
                                        <textarea id="description" name="description" rows="4" cols="30"> </textarea></td>
                                </tr>
                                <tr><td>Price (RM)</td><td>: <input type="text" name="price" value=""></td></tr>
                                <tr><td>Sub Category</td><td>: 
                                        <select name="subCategory" id="subCategory">
                                            <option value="volvo">Volvo</option>
                                            <option value="saab">Saab</option>
                                            <option value="mercedes">Mercedes</option>
                                            <option value="audi">Audi</option>
                                        </select></td>
                                </tr>
                                <tr><td>Quantity</td><td>: <input type="text" name="quantity" value=""></td></tr>
                            </table>

                        </div> 
                        <div class="delete"><input type="submit" name="add" value="Add" onclick="return confirm('Are you sure to add this product?');" style='background-image: radial-gradient(circle, #37bd0b, #3dc80d, #42d40f, #48df10, #4eeb12);;'></div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>