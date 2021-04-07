<%-- 
    Document   : PromotionCodeInsert
    Created on : Mar 18, 2021, 11:28:24 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../Share/images/logo-book.png"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="/HobbitHall/Admin/Share/adminPanel.css" rel="stylesheet">
        <title>Hobbit Hall Book Store</title>
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
                        <li>Add Promotion Code</li>
                    </ul>
                </div>
                <div class="row justify-content-center mt-3">
                    <div class="col-md-5 px-auto">
                        <form action="/HobbitHall/PromotionCodeControl" method="GET">
                            <input type="hidden" name="action" value="add">
                            <div class="row mb-3">
                                <label class="col-6">Code</label>
                                <div class="col-6">
                                    <input type="text" name="promotionCode" value="${promotionCode_entered}" class="form-control form-control-sm">
                                </div>
                                <p class="col-6 text-danger">${promotionCode_error}</p>
                            </div>
                            <div class="row mb-3">
                                <label class="col-5">Discount Rate</label>
                                <div class="col-8">
                                    <select name="discountRate" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                        <option value="" <% if(discountRate_entered == null || discountRate_entered == "" ){ %>selected<% } %>>Select a discount rate</option>
                                        <option value="0.01" <% if(discountRate_entered != null && discountRate_entered.equals("0.01")){ %>selected<% } %>>1%</option>
                                        <option value="0.03" <% if(discountRate_entered != null && discountRate_entered.equals("0.03")){ %>selected<% } %>>3%</option>
                                        <option value="0.05" <% if(discountRate_entered != null && discountRate_entered.equals("0.05")){ %>selected<% } %>>5%</option>
                                        <option value="0.07" <% if(discountRate_entered != null && discountRate_entered.equals("0.08")){ %>selected<% } %>>8%</option>
                                        <option value="0.1" <% if(discountRate_entered != null && discountRate_entered.equals("0.1")){ %>selected<% } %>>10%</option>
                                        <option value="0.15" <% if(discountRate_entered != null && discountRate_entered.equals("0.15")){ %>selected<% } %>>15%</option>
                                        <option value="0.2" <% if(discountRate_entered != null && discountRate_entered.equals("0.2")){ %>selected<% } %>>20%</option>                               
                                    </select>
                                </div>
                                <p class="col-6 text-danger">${discountRate_error}</p>
                            </div>
                            <div class="row mb-3">
                                <label class="col-6">Minimum Order Required</label>
                                <div class="col-sm-8">
                                    <input type="text" name="minimumOrderRequired" value="${minimumOrderRequired_entered}" class="form-control form-control-sm">
                                </div>
                                <p class="col-6 text-danger">${minimumOrderRequired_error}</p>
                            </div>
                            <div class="row mb-3">
                                <label class="col-6">Started Date</label>
                                <div class="col-sm-8">
                                    <input type="date" name="startedDate" value="${startedDate_entered}" class="form-control form-control-sm">
                                </div>
                                <p class="col-6 text-danger">${startedDate_error}</p>
                            </div>
                            <div class="row mb-3">
                                <label class="col-6">Expired Date</label>
                                <div class="col-sm-8">
                                    <input type="date" name="expiredDate" value="${expiredDate_entered}" class="form-control form-control-sm">
                                </div>
                                <p class="col-6 text-danger">${expiredDate_error}</p>
                            </div>
                            <div class="row mb-3">
                                <p class="text-success">${sucess_message}</p>
                                <div class="col-3">
                                    <input type="submit" class="form-control form-control-sm">
                                </div>
                                <div class="col-3">
                                    <input type="reset" class="form-control form-control-sm">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
