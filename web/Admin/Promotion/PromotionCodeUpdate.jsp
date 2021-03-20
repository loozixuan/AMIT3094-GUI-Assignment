<%-- 
    Document   : PromotionCodeUpdate
    Created on : Mar 19, 2021, 12:27:06 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../Share/images/logo-book.png"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <title>Hobbit Hall Book Store</title>
    </head>
    <body>
        <%@ include file="../Share/adminHeader.html" %>
        <%@ include file="../Share/adminSidebar.html" %>
        <div class="content">
            <div class="p-3">
                <div class="pageheader-title mb-3">
                    <h2>Promotion Code Management</h2>
                    <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                    <ul class="breadcrumb">
                        <li><a href="#">Promotion Code</a></li>
                        <li>Update Promotion Code</li>
                    </ul>
                </div>
                <div class="row justify-content-center mt-3">
                    <div class="col-md-5 px-auto">
                        <form>
                            <div class="row mb-3">
                                <label class="col-6">Code</label>
                                <div class="col-6">
                                    <input type="text" class="form-control form-control-sm">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-5">Discount Rate</label>
                                <div class="col-8">
                                    <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                        <option selected>Open this select menu</option>
                                        <option value="1">1%</option>
                                        <option value="3">3%</option>
                                        <option value="5">5%</option>
                                        <option value="8">8%</option>
                                        <option value="10">10%</option>
                                        <option value="15">15%</option>
                                        <option value="20">20%</option>
                                        
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-6">Minimum Order Required</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control form-control-sm">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-6">Started Date</label>
                                <div class="col-sm-8">
                                    <input type="date" class="form-control form-control-sm">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-6">Expired Date</label>
                                <div class="col-sm-8">
                                    <input type="date" class="form-control form-control-sm">
                                </div>
                            </div>
                            <div class="row mb-3">
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
