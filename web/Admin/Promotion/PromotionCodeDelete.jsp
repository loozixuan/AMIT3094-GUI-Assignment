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
        <title>JSP Page</title>
        <style>
            #promoDetail tr{
                height: 50px;
            }
        </style>
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
                        <li>Add Promotion Code</li>
                    </ul>
                </div>
                <div class="row justify-content-center mt-3 border border-5 border-danger">
                    <table class="col-md-5" id="promoDetail">
                        <tr><td>Code</td><td class="text-right">BUY100</td></tr>
                        <tr><td>Discount Rate</td><td class="text-right">20%</td></tr>
                        <tr><td>Minimum Order Required</td><td class="text-right">RM 100</td></tr>
                        <tr><td>Started Date</td><td class="text-right">12/12/2021</td></tr>
                        <tr><td>Expired Date</td><td class="text-right">20/12/2121</td></tr>   
                        <tr>
                            <td colspan="2" class="text-center"><button type="button" class="btn btn-danger">Confirm</button> <button type="button" class="btn btn-primary">Cancel</button></td>
                        </tr>   
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
