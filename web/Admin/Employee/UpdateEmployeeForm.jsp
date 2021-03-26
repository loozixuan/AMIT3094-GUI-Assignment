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
        <link href="/HobbitHall/Admin/Employee/UpdateEmployeeForm.css" rel="stylesheet"/>
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
                    <form action="/HobbitHall/ProcessEmployee?action=update" method="POST">
                        <div class="msg pb-2">
                            <% String success_msg = (String) request.getAttribute("success_msg");
                                if (success_msg != null) { %>
                            <div class="sucess-msg text-center" style="color:green">
                                <i class="fa fa-check-square" aria-hidden="true"></i> ${success_msg}
                            </div>
                            <% } %>
                            <% String err_msg = (String) request.getAttribute("err_msg");
                                if (err_msg != null) { %>
                            <div class="err-msg" style="color:red">
                                ${err_msg}
                            </div>
                            <% }%>
                        </div>

                        <div class="form-group w-50">
                            <label for="name">Name :</label>
                            <input type="text" class="form-control" id="name" name="name">
                        </div>
                        <div class="form-group w-50">
                            <label for="email">Email : </label>
                            <input type="email" class="form-control" id="email" name="email">
                        </div>
                        <div class="form-group w-50">
                            <label for="cpwd">Current Password :</label>
                            <input type="password" class="form-control" id="cpwd" name="currentpassword">
                        </div>

                        <div class="form-group w-50">
                            <label for="pwd">New Password :</label>
                            <input type="password" class="form-control" id="pwd" name="password">
                            <small id="passwordGuide" class="form-text text-muted">
                                *Password should should consists of 6 characters including 1 digit and 1 alphabet
                            </small>
                        </div>
                        <div class="form-group w-50">
                            <label for="pwd">Confirmed Password :</label>
                            <input type="password" class="form-control" id="pwd" name="cpassword">
                        </div>
                        <div class="form-group w-50">
                            <label for="inputRole">Role</label>
                            <select name="role" id="inputRole" class="form-control">
                                <option selected>Choose...</option>
                                <option value="admin">Admin</option>
                                <option value="staff">Staff</option>
                            </select>
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
