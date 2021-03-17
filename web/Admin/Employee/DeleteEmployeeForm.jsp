<%-- 
    Document   : DeleteEmployeeForm
    Created on : Mar 17, 2021, 6:03:22 PM
    Author     : zixua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="DeleteEmployeeForm.css" rel="stylesheet"/>
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
                    <h2>Delete Employee Form</h2>
                    <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                    <ul class="breadcrumb">
                        <li><a href="ViewEmployee.jsp">Employee</a></li>
                        <li>Delete Employee</li>
                    </ul>
                </div>


                <div class="delete-emp-form p-3">
                    <form action="" method=post"">
                        <div class="form-group w-50">
                            <label for="name">Name :</label>
                            <input type="text" class="form-control" id="name" value="manyee" readonly>
                        </div>
                        <div class="form-group w-50">
                            <label for="email">Email : </label>
                            <input type="email" class="form-control" id="email" value="my@gmail.com" readonly>
                        </div>
                        <div class="form-group w-50">
                            <label for="inputRole">Role</label>
                            <select id="inputRole" class="form-control">
                                <option selected>Choose...</option>
                                <option value="manager"c>Manager</option>
                                <option value="staff">Staff</option>
                            </select>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary mt-2" style="width:78px;">Delete</button>
                            <button type="reset" class="btn btn-primary mt-2" style="width:78px;">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
