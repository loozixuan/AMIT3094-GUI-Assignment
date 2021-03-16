<%-- 
    Document   : ViewEmployee
    Created on : Mar 15, 2021, 9:52:04 PM
    Author     : zixua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="ViewEmployee.css" rel="stylesheet"/>
        <link rel="icon" href="../Share/images/logo-book.png"/>
        <title>Hobbit Hall Book Store</title>
    </head>
    <body>
        <!--Header-->
        <%@ include file="../Share/adminHeader.html" %>
        <!--Sidebar-->
        <%@ include file="../Share/adminSidebar.html" %>

        <!--Content-->
        <div class="content">
            <div class="p-3">
                <div class="pageheader-title">
                    <h2>Employee Management</h2>
                    <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                    <ul class="breadcrumb">
                        <li><a href="#">Employee</a></li>
                        <li></li>
                    </ul>
                </div>

                <div class="table-emp-body p-3 mt-3">
                    <table class="table table-emp table-striped">
                        <div class="table-emp-header p-3 d-flex justify-content-between align-items-center">
                            <div>Employee <b>Information</b></div>
                            <div class="btn-add-emp" style="margin-right: 15px;"><button class="w-100"> <i class="fa fa-plus-circle p-1" aria-hidden="true"></i> Add New Employee</button></div>
                        </div>
                        <thead>
                            <tr id="table-title">
                                <th>#</th>
                                <th>Name</th>
                                <th>User ID</th>
                                <th>Role</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tr>
                            <td>1</td>
                            <td>Man Yee</td>
                            <td>my@gmail.com</td>
                            <td>Manager</td>
                            <td>Active</td>
                            <td>
                                <div class="table-action d-flex justify-content-around w-50 mx-auto">
                                    <div><i class="fa fa-cogs" aria-hidden="true"></i></div>
                                    <div><i class="fa fa-trash" aria-hidden="true"></i></div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <td>Pei Yee</td>
                            <td>py@gmail.com</td>
                            <td>Admin</td>
                            <td>Active</td>
                            <td>
                                <div class="table-action d-flex justify-content-around w-50 mx-auto">
                                    <div><i class="fa fa-cogs" aria-hidden="true"></i></div>
                                    <div><i class="fa fa-trash" aria-hidden="true"></i></div>
                                </div>
                            </td>
                        </tr>

                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
