<%-- 
    Document   : PromotionCodeDelete
    Created on : Mar 19, 2021, 12:38:43 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/HobbitHall/Admin/Share/adminPanel.css" rel="stylesheet">
        <title>JSP Page</title>
        <style>
            #promoDetail tr{
                height: 50px;
            }
        </style>
    </head>
    <body>
        <%@ include file="../Share/adminHeader.jsp" %>
        <%@ include file="../Share/adminSidebar.jsp" %>
        <%
            String discountRate_entered = (String)request.getAttribute("discountRate_entered");
        %>
        <div class="content">
            <div class="p-3">
                <div class="pageheader-title mb-3">
                    <h2>Promotion Code Management</h2>
                    <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                    <ul class="breadcrumb">
                        <li><a href="/HobbitHall/PromotionCodeControl?action=display">Promotion Code</a></li>
                        <li>Delete Promotion Code</li>
                    </ul>
                </div>
                <div class="row justify-content-center mt-3">
                    <div class="col-md-5 px-auto">
                        <form action="/HobbitHall/PromotionCodeControl" method="GET">
                            <input type="hidden" name="action" value="delete">
                            <div class="row mb-3">
                                <label class="col-6">Code</label>
                                <div class="col-6">
                                    <input type="text" name="promotionCode" value="${promotionCode_entered}" class="form-control form-control-sm" readonly>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-6">Discount Rate</label>
                                <div class="col-6">
                                    <input type="text" name="discountRate" value="${discountRate_entered}" class="form-control form-control-sm" readonly>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-6">Minimum Order Required</label>
                                <div class="col-sm-8">
                                    <input type="text" name="minimumOrderRequired" value="${minimumOrderRequired_entered}" class="form-control form-control-sm" readonly>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-6">Started Date</label>
                                <div class="col-sm-8">
                                    <input type="date" name="startedDate" value="${startedDate_entered}" class="form-control form-control-sm" readonly>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-6">Expired Date</label>
                                <div class="col-sm-8">
                                    <input type="date" name="expiredDate" value="${expiredDate_entered}" class="form-control form-control-sm" readonly>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-3">
                                    <input type="submit" name="submit" value="Submit" class="form-control form-control-sm">
                                </div>
                                <div class="col-3">
                                    <a href="/HobbitHall/PromotionCodeControl?action=display" class="btn btn-primary">Cancel</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
