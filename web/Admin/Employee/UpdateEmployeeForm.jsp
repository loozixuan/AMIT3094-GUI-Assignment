<%-- 
    Document   : UpdateEmployeeForm
    Created on : Mar 17, 2021, 5:43:57 PM
    Author     : zixua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="UpdateEmployeeForm.css" rel="stylesheet"/>
        <link rel="icon" href="../Share/images/logo-book.png"/>
        <title>Hobbit Hall Book Store</title>
    </head>
    <body>
        <!--Header-->
        <%@ include file="../Share/adminHeader.jsp" %>
        <!--Sidebar-->
        <%@ include file="../Share/adminSidebar.jsp" %>

        <!--Content-->
        <div class="content">
            <div class="p-3">
                <div class="pageheader-title">
                    <h2>Update Employee Form</h2>
                    <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                    <ul class="breadcrumb">
                        <li><a href="ViewEmployee.jsp">Employee</a></li>
                        <li>Update Employee</li>
                    </ul>
                </div>


                <div class="update-emp-form p-3">
                    <form action="/HobbitHall/ProcessEmployee/action=update" method="post">

                        <div>
                            <div class="form-group w-50">
                                <label for="name">Name :</label>
                                <input type="text" class="form-control" id="name" name="name" value="">
                            </div>
                            <div class="form-group w-50">
                                <label for="email">Email : </label>
                                <input type="email" class="form-control" id="email" name="email" value="">
                            </div>
                            <div class="form-group w-50">
                                <label for="cpwd">Current Password :</label>
                                <input type="password" class="form-control" id="cpwd" name="currentpassword" value="">
                            </div>
                        </div>
                        <div>
                            <div class="form-group w-50">
                                <label for="pwd">New Password :</label>
                                <input type="password" class="form-control" id="pwd" name="password" value="">
                                <small id="passwordGuide" class="form-text text-muted">
                                    *Password should should consists of 6 characters including 1 digit and 1 alphabet
                                </small>
                            </div>
                            <div class="form-group w-50">
                                <label for="pwd">Confirmed Password :</label>
                                <input type="password" class="form-control" id="pwd" name="cpassword" value="">
                            </div>
                            <div class="form-group w-50">
                                <label for="inputRole">Role</label>
                                <select id="inputRole" class="form-control">
                                    <option selected>Choose...</option>
                                    <option value="manager">Manager</option>
                                    <option value="staff">Staff</option>
                                </select>
                            </div>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary mt-2" style="width:78px;">Update</button>
                            <button type="reset" class="btn btn-primary mt-2" style="width:78px;">Reset</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
