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
        List<Onlineadmin> deleteAdminList = (List) session.getAttribute("deleteAdminList");
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
                        <li>Deleted Employee</li>
                    </ul>
                </div>

                <div class="table-emp-body p-3 mt-3">
                    <table class="table table-emp table-striped">
                        <div class="table-emp-header p-3 d-flex justify-content-between align-items-center">
                            <div>Deleted Employee <b>Information</b></div>
                        </div>
                        <div>
                            <% String success_msg = (String) request.getAttribute("success_msg");
                                if (success_msg != null) { %>
                            <div class="sucess-msg text-center d-block mx-auto" style="color:green; border: 1px solid green;width:550px;padding:10px;margin:10px;">
                                <i class="fa fa-check-square" aria-hidden="true"></i> ${success_msg}
                            </div>
                            <% } %>
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
                        <% if (!deleteAdminList.isEmpty()) {%>
                        <% for (Onlineadmin adminUser : deleteAdminList) {%>
                        <tr>
                            <td><%=adminUser.getId()%></td>
                            <td><%=adminUser.getName()%></td>
                            <td><%=adminUser.getEmail()%></td>
                            <td><%=adminUser.getRole()%></td> 
                            <td style="color: red"><%=adminUser.getStatus()%></td> 
                            <%if (admin.getRole().equalsIgnoreCase("admin")) {%>
                            <td> <div><a href="/HobbitHall/ProcessEmployee?action=restore&email=<%=adminUser.getEmail()%>&id=<%= adminUser.getId()%>"><i class='fas fa-trash-restore-alt' style="color:green;" onclick="return confirm('Are you sure you want to restore this employee?');"></i></a></div></td>
                                        <%} else {%>
                            <td><div><a><i class='fas fa-trash-restore-alt' style="cursor: not-allowed;color:green;"></i></a></div></td>
                                        <%}%>
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
