<%-- 
    Document   : OrderHistory
    Created on : Mar 15, 2021, 11:26:39 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <%@include file="../Share/header.jsp" %>
    <body>
        <h3 class="text-center mt-5">Your Order</h3>
        <div class="row justify-content-start my-5 px-5" id="main">
            <div class="col-md-3 mb-3 me-5 bg-white text-dark border border-3 rounded">
                <div class="row">
                    <div class="col-6 mt-3">
                        <p class="text-start">Order ID</p>
                    </div>
                    <div class="col-6 mt-3">
                        <p class="text-end">12345</p>
                    </div>
                    <div class="col-6">
                        <p class="text-start">Sub Total</p>
                    </div>
                    <div class="col-6">
                        <p class="text-end">RM 132.00</p>
                    </div>
                    <div class="col-6">
                        <p class="text-start">Discount</p>
                    </div>
                    <div class="col-6">
                        <p class="text-end">RM (20.00)</p>
                    </div>
                    <div class="col-6">
                        <p class="text-start">Total Amount</p>
                    </div>
                    <div class="col-6">
                        <p class="text-end">RM 112.00</p>
                    </div>
                    <div class="col-6">
                        <p class="text-start">Status</p>
                    </div>
                    <div class="col-6">
                        <p class="text-end">Delivered</p>
                    </div>
                    <div class="col-6">
                        <p class="text-start">Date</p>
                    </div>
                    <div class="col-6">
                        <p class="text-end">12/12/2012</p>
                    </div>
                    <div class="col-12 mb-3 text-center">
                        <a class="btn btn-danger" href="#">Check Order</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3 me-5 bg-white text-dark border border-3 rounded" style="border: 1px solid black;">
                <div class="row">
                    <div class="col-6 mt-3">
                        <p class="text-start">Order ID</p>
                    </div>
                    <div class="col-6 mt-3">
                        <p class="text-end">12345</p>
                    </div>
                    <div class="col-6">
                        <p class="text-start">Sub Total</p>
                    </div>
                    <div class="col-6">
                        <p class="text-end">RM 132.00</p>
                    </div>
                    <div class="col-6">
                        <p class="text-start">Discount</p>
                    </div>
                    <div class="col-6">
                        <p class="text-end">RM (20.00)</p>
                    </div>
                    <div class="col-6">
                        <p class="text-start">Total Amount</p>
                    </div>
                    <div class="col-6">
                        <p class="text-end">RM 112.00</p>
                    </div>
                    <div class="col-6">
                        <p class="text-start">Status</p>
                    </div>
                    <div class="col-6">
                        <p class="text-end">Delivered</p>
                    </div>
                    <div class="col-6">
                        <p class="text-start">Date</p>
                    </div>
                    <div class="col-6">
                        <p class="text-end">12/12/2012</p>
                    </div>
                    <div class="col-12 mb-3 text-center">
                        <a class="btn btn-danger">Check Order</a>
                    </div>
                </div>
            </div>
        </div>

    </body>
    <%@include file="../Share/footer.html" %>
</html>
