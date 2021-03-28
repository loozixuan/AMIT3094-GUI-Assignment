<%-- 
    Document   : adminHome
    Created on : Mar 9, 2021, 11:01:07 PM
    Author     : zixuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images/logo-book.png"/>
        <link href="dashboard.css" rel="stylesheet">
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
                        <h2>Hobbit Hall Dashboard</h2>
                        <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                        <ul class="breadcrumb">
                            <li><a href="#">Dashboard</a></li>
                            <li>Testing</li>
                        </ul>
                    </div>
                    <br/>
                    <div class="info-card d-flex p-2">
                        <div class="card-container p-3">
                            <h5 class="card-title">Today Sales</h5>
                            <div class="card-content">RM 1000</div>
                        </div>
                        <div class="card-container p-3">
                            <h5 class="card-title">Total Product</h5>
                            <div class="card-content">100</div>
                        </div>
                        <div class="card-container p-3">
                            <h5 class="card-title">Total Employee</h5>
                            <div class="card-content">10</div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
