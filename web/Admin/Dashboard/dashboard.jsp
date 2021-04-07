<%-- 
    Document   : adminHome
    Created on : Mar 9, 2021, 11:01:07 PM
    Author     : zixuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="/HobbitHall/Admin/Share/images/logo-book.png"/>
        <link href="/HobbitHall/Admin/Dashboard/dashboard.css" rel="stylesheet">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <title>Hobbit Hall Admin</title>
    </head>
    <%
        int totalAdminUser = (Integer) session.getAttribute("countUser");
        int totalProduct = (Integer) session.getAttribute("countProd");
        int totalOrder = (Integer) session.getAttribute("countOrder");
        int totalCategory1 = (Integer) session.getAttribute("countsubcategoryList");
        int totalCategory2 = (Integer) session.getAttribute("countsubcategoryList2");
        int totalCategory3 = (Integer) session.getAttribute("countsubcategoryList3");
    %>
    <body>
        <!--Header-->
        <%@ include file="../Share/adminHeader.jsp" %>
        <!--Sidebar-->
        <%@ include file="../Share/adminSidebar.jsp" %>

        <!--Content-->
        <div class="content">
            <div class="container-fluid p-2">
                <div class="container-db-right p-2">
                    <div class="pageheader-title">
                        <h2>HobbitHall Dashboard</h2>
                        <hr style="margin:0px;border-bottom:1px solid lightgrey;border-top: none;"/>
                        <ul class="breadcrumb">
                            <li><a href="#">Dashboard</a></li>
                            <li></li>
                        </ul>
                    </div>
                    <br/>
                    <div class="info-card d-flex p-2">
                        <div class="card-container p-3">
                            <h5 class="card-title">Today Order</h5>
                            <% if (totalOrder != 0) {%>
                            <div class="card-content"><%=totalOrder%></div>
                            <%} else {%>
                            <div class="card-content">0</div>
                            <%}%>
                        </div>
                        <div class="card-container p-3">
                            <h5 class="card-title">Total Product</h5>
                            <% if (totalProduct != 0) {%>
                            <div class="card-content"><%=totalProduct%></div>
                            <%} else {%>
                            <div class="card-content">0</div>
                            <%}%>
                        </div>
                        <div class="card-container p-3">
                            <h5 class="card-title">Total Employee</h5>
                            <% if (totalAdminUser != 0) {%>
                            <div class="card-content"><%=totalAdminUser%></div>
                            <%} else {%>
                            <div class="card-content">0</div>
                            <%}%>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center" style="margin-left:150px;">
                        <div id="piechart"></div>
                    </div>

                    <!-- Get the total category from servlet -->
                    <input type="hidden" id="bi" value="<%= totalCategory1%>">
                    <input type="hidden" id="bc" value="<%= totalCategory2%>">
                    <input type="hidden" id="bm" value="<%= totalCategory3%>">
                </div>
            </div>
        </div>
        <script type="text/javascript">
            // Load google charts
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            // Draw the chart and set the chart values
            function drawChart() {
                var bi = parseInt(document.getElementById("bi").value);
                var bc = parseInt(document.getElementById("bc").value);
                var bm = parseInt(document.getElementById("bm").value);
                console.log(bi)
                var data = google.visualization.arrayToDataTable([
                    ['Category', 'Total Subcategory'],
                    ['English', bi],
                    ['Chinese', bc],
                    ['Malay', bm],
                ]);

                // Optional; add a title and set the width and height of the chart
                var options = {'title': 'HobbitHall Product SubCategory', 'width': 1000, 'height': 700, backgroundColor: '#fbfbfd', };

                // Display the chart inside the <div> element with id="piechart"
                var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                chart.draw(data, options);
            }
        </script>

    </body>
</html>
