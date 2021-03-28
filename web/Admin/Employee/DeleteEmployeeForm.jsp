<%-- 
    Document   : DeleteEmployeeForm
    Created on : Mar 17, 2021, 6:03:22 PM
    Author     : zixua
--%>

<%@page import="entity.Onlineadmin"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/HobbitHall/Admin/Employee/DeleteEmployeeForm.css" rel="stylesheet"/>
        <link rel="icon" href="../Share/images/logo-book.png"/>
        <title>Hobbit Hall Book Store</title>
    </head>
    <body>
        <!--Header-->
        <%@ include file="../Share/adminHeader.jsp" %>
        <!--Sidebar-->
        <%@ include file="../Share/adminSidebar.jsp" %>
        <%
            String id = request.getParameter("id");
            List<Onlineadmin> adminUser = (List) session.getAttribute("adminUser");
        %>

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
                    <% for (Onlineadmin adminInfo : adminUser) {%>
                    <form action="/HobbitHall/ProcessEmployee?action=delete&id=<%= adminInfo.getId()%>" method="POST">
                        <% String success_msg = (String) request.getAttribute("success_msg");
                            if (success_msg != null) { %>
                        <div class="sucess-msg mb-3 text-center" style="color:green">
                            <i class="fa fa-check-square" aria-hidden="true"></i> ${success_msg}
                        </div>
                        <% }%>
                        <div class="form-group w-50">
                            <label for="name">Admin ID :</label>
                            <input type="text" class="form-control" id="id" value="<%= adminInfo.getId()%>" readonly>
                        </div>
                        <div class="form-group w-50">
                            <label for="name">Name :</label>
                            <input type="text" class="form-control" id="name" value="<%= adminInfo.getName()%>" readonly>
                        </div>
                        <div class="form-group w-50">
                            <label for="email">Email : </label>
                            <input type="email" class="form-control" id="email" value="<%= adminInfo.getEmail()%>" readonly>
                        </div>
                        <div class="form-group w-50">
                            <label for="role">Role : </label>
                            <input type="text" class="form-control" id="role" value="<%= adminInfo.getRole()%>" readonly>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary mt-2" style="width:78px;">Delete</button>
                            <button type="reset" class="btn btn-primary mt-2" style="width:78px;">Cancel</button>
                        </div>
                    </form>
                    <%}%>
                </div>
            </div>
        </div>
    </body>
</html>
