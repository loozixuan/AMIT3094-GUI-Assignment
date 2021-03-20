<%-- 
    Document   : Promotion.jsp
    Created on : Mar 18, 2021, 9:45:57 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../Share/images/logo-book.png"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>Hobbit Hall Book Store</title>
    </head>
    <body>
        <%@ include file="../Share/adminHeader.html" %>
        <%@ include file="../Share/adminSidebar.html" %>
        <div class="content">
            <div class="p-3">
                <div class="pageheader-title mb-3">
                    <h2>Promotion Code Management</h2>
                    <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                    <ul class="breadcrumb">
                        <li><a href="#">Promotion Code</a></li>
                        <li></li>
                    </ul>
                </div>
                <div class="row mb-3">
                    <button class="btn btn-warning col-md-2 offset-md-9">Add Promotion Code</button>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-striped">
                            <thead>
                                <th>Code</th>
                                <th>Discount Rate</th>
                                <th>Minimum Order Required (RM)</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Created By</th>
                                <th colspan="2">Action</th>
                            </thead>
                            <tbody>
                                <td>BUY100</td>
                                <td>15%</td>
                                <td>100</td>
                                <td>01/12/2021</td>
                                <td>12/12/2021</td>
                                <td>Huang Xiao Ming</td>
                                <td><i class="fa fa-cogs" aria-hidden="true"></i></td>
                                <td><i class="fa fa-trash text-danger" aria-hidden="true"></i></td>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
