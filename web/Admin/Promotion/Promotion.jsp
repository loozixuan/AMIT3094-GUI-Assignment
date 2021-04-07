<%-- 
    Document   : Promotion.jsp
    Created on : Mar 18, 2021, 9:45:57 PM
    Author     : user
--%>

<%@page import="entity.PromotionCode, java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="/HobbitHall/Admin/Share/images/logo-book.png"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="/HobbitHall/Admin/Share/adminPanel.css" rel="stylesheet">
        <title>Hobbit Hall Book Store</title>
    </head>
    <body>
        <%@ include file="../Share/adminHeader.jsp" %>
        <%@ include file="../Share/adminSidebar.jsp" %>
        <% 
            List<PromotionCode> promotionCodeList = (List<PromotionCode>)request.getAttribute("PromotionCodeList");
        %>
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
                    <a href="/HobbitHall/Admin/Promotion/PromotionCodeInsert.jsp" class="btn btn-warning col-md-2 offset-md-9">Add Promotion Code</a>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <% 
                            if(promotionCodeList != null){ 
                                if(promotionCodeList.size() > 0){
                        %>
                        <table class="table table-striped">
                            <thead>
                                <th>Code</th>
                                <th>Discount Rate</th>
                                <th>Minimum Order Required (RM)</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Last Modified By</th>
                                <th colspan="2">Action</th>
                            </thead>
                            <tbody>
                                <% 
                                    for (int i = 0; i < promotionCodeList.size(); i++) {
                                        
                                %>
                                <tr>
                                    <td><%= promotionCodeList.get(i).getCode() %></td>
                                    <td><%= String.format("%.2f", (promotionCodeList.get(i).getDiscountRate() * 100)) %>%</td>
                                    <td><%= String.format("%.2f", (promotionCodeList.get(i).getMinimumOrderAmount())) %></td>
                                    <td><%= promotionCodeList.get(i).getStartDate() %></td>
                                    <td><%= promotionCodeList.get(i).getExpiredDate() %></td>
                                    <% int updateListIndex = promotionCodeList.get(i).getPromotionUpdateList().size(); %>
                                    <td>
                                        <%= promotionCodeList.get(i).getPromotionUpdateList().get(updateListIndex - 1).getAdminId().getId() %><br/>
                                        <%= promotionCodeList.get(i).getPromotionUpdateList().get(updateListIndex - 1).getAdminId().getName()%>
                                    </td>
                                    <td><a href="/HobbitHall/PromotionCodeControl?action=edit&promotionCode=<%= promotionCodeList.get(i).getCode() %>"><i class="fa fa-cogs" aria-hidden="true"></i></a></td>
                                    <td><a href="/HobbitHall/PromotionCodeControl?action=delete&promotionCode=<%= promotionCodeList.get(i).getCode() %>"><i class="fa fa-trash text-danger" aria-hidden="true"></i></a></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                            <% }else{ %>
                            <h1 class="mt-5 text-center"> There is no existing promotion code </h1>
                            <% } %>
                        <% }else{ %>
                        <h1 class="mt-5 text-center"> There is no existing promotion code </h1>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
