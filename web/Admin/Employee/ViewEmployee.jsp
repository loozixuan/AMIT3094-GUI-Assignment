<%-- 
    Document   : ViewEmployee
    Created on : Mar 15, 2021, 9:52:04 PM
    Author     : zixua
--%>
<%@page import="java.util.List"%>
<%@page import="entity.Onlineadmin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="ViewEmployee.css" rel="stylesheet"/>
        <link href="/HobbitHall/Admin/Employee/ViewEmployee.css" rel="stylesheet"/>
        <link rel="icon" href="../Share/images/logo-book.png"/>
        <title>Hobbit Hall Book Store</title>
    </head>
    <%
        List<Onlineadmin> adminList = (List) session.getAttribute("adminList");
    %>
    <body>
        <!--Header-->
        <%@ include file="../Share/adminHeader.html" %>
        <!--Sidebar-->
        <%@ include file="../Share/adminSidebar.jsp" %>

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
                            <div class="btn-add-emp" style="margin-right: 15px;">
                                <a href="AddEmployeeForm.jsp">
                                    <button class="w-100"> 
                                        <i class="fa fa-plus-circle p-1" aria-hidden="true"></i> 
                                        Add New Employee
                                    </button>
                                </a>
                            </div>
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
                        <% if (!adminList.isEmpty()) {%>
                        <% for (Onlineadmin admin : adminList) {%>

                        <tr>
                            <td><%=admin.getId()%></td>
                            <td><%=admin.getName()%></td>
                            <td><%=admin.getEmail()%></td>
                            <td><%=admin.getRole()%></td> 
                            <!--Show differences in status-->
                            <% if (admin.getStatus().equals("Active")) {%>
                            <td style="color: green;font-weight: 500"><%=admin.getStatus()%></td>
                            <%} else {%>
                            <td style="color: red;font-weight: 500"><%=admin.getStatus()%></td>
                            <%}%>
                            <td>
                                <div class="table-action d-flex justify-content-around w-50 mx-auto">
                                    <div><a href="UpdateEmployeeForm.jsp?action=update&email=<%=admin.getEmail()%>"><i class="fa fa-cogs" aria-hidden="true"></i></a></div>
                                    <div><a href="/HobbitHall/ViewDeleteEmpInfo?action=view&email=<%=admin.getEmail()%>&id=<%= admin.getId()%>"><i class="fa fa-trash" aria-hidden="true"></i></a></div>
                                </div>
                            </td>
                        </tr>
                        <%}%>
                        <%} else {%>
                        <div>
                            dasndlnkn
                        </div>
                        <%}%>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
