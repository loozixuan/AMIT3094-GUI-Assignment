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
        <link rel="icon" href="/HobbitHall/Share/images/logo-book.png"/>
        <title>Hobbit Hall Book Store</title>
    </head>
    <%
        List<Onlineadmin> adminList = (List) session.getAttribute("adminList");
    %>
    <body>
        <!--Header-->
        <%@ include file="../Share/adminHeader.jsp" %>
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
                            <div class="d-flex justify-content-between" style="margin-right: 15px;">
                                <div class="btn-add-emp" style="margin-right: 15px;">
                                    <a href="AddEmployeeForm.jsp">
                                        <button class="w-100"> 
                                            <i class="fa fa-plus-circle p-1" aria-hidden="true"></i> 
                                            Add New Employee
                                        </button>
                                    </a>

                                </div>
                                <div class="btn-add-emp">
                                    <a href="/HobbitHall/ProcessEmployee?action=view">
                                        <button class="w-100 ml-1"> 
                                            <i class="fa fa-eye p-1" aria-hidden="true"></i>
                                            View Inactive Employee
                                        </button>
                                    </a>
                                </div>
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
                        <% for (Onlineadmin adminUser : adminList) {%>

                        <tr>
                            <td><%=adminUser.getId()%></td>
                            <td><%=adminUser.getName()%></td>
                            <td><%=adminUser.getEmail()%></td>
                            <td><%=adminUser.getRole()%></td> 
                            <!--Show differences in status-->
                            <% if (adminUser.getStatus().equals("Active")) {%>
                            <td style="color: green;font-weight: 500"><%=adminUser.getStatus()%></td>
                            <%} else {%>
                            <td style="color: red;font-weight: 500"><%=adminUser.getStatus()%></td>
                            <%}%>
                            <td>
                                <div class="table-action d-flex justify-content-around w-50 mx-auto">
                                    <div><a href="UpdateEmployeeForm.jsp?action=update&email=<%=adminUser.getEmail()%>&roles=<%= adminUser.getRole()%>"><i class="fa fa-cogs" aria-hidden="true"></i></a></div>
                                            <%if (admin.getRole().equalsIgnoreCase("admin")) {%>
                                    <div><a href="/HobbitHall/ViewDeleteEmpInfo?action=view&email=<%=adminUser.getEmail()%>&id=<%= adminUser.getId()%>"><i class="fa fa-trash" aria-hidden="true"></i></a></div>
                                            <%} else {%>
                                    <div><i class="fa fa-trash" aria-hidden="true" style="cursor: not-allowed"></i></div>
                                        <%}%>
                                </div>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                    <%} else {%>
                    <%}%>
                </div>
            </div>
        </div>
    </body>
</html>
