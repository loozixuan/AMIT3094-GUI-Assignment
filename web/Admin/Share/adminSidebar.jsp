<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<jsp:useBean id="admin" scope="session" class="entity.Onlineadmin"/>
<jsp:setProperty name="admin" property="*"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/HobbitHall/Admin/Share/adminPanel.css" rel="stylesheet">

<!--mobile navigation bar start-->
<div class="mobile_nav">
    <div class="nav_bar">

        <i class="fa fa-bars nav_btn"></i>
    </div>
    <div class="mobile_nav_items">
        <a href="../Dashboard/dashboard.jsp"><i class="fa fa-home" aria-hidden="true"></i></i><span>Dashboard</span></a>
        <a href=""><i class="fa fa-user-circle-o" aria-hidden="true"></i><span>Staff Info</span></a>
        <a href=""><i class="fa fa-book" aria-hidden="true"></i><span>Product</span></a>
        <a href=""><i class="fa fa-user" aria-hidden="true"></i><span>Order</span></a>
        <a href=""><i class="fa fa-product-hunt" aria-hidden="true"></i><span>Promotion</span></a>
        <a href=""><i class="fa fa-folder" aria-hidden="true"></i><span>Sales</span></a>
        <a href="#"><i class="fa fa-pie-chart"></i><span>Sales Report</span></a>
        <a href="#"><i class="fa fa-sign-out" aria-hidden="true"></i><span>Logout</span></a>
    </div>
</div>
<!--mobile navigation bar end-->


<!--sidebar start-->
<div class="sidebar">
    <div class="profile_info">
        <img src="<%= request.getContextPath()%>/Admin/Share/images/user-avatar.png" class="profile_image" alt="user-image">
        <% if (admin.getName() == null) {%>
        <h4>User Name</h4>
        <%} else {%>
        <div class="d-flex justify-content-evenly" style="width: 105px">
            <h4><%= admin.getName()%> </h4> 
            <h4> ( <%= admin.getRole()%> )</h4>
        </div>
        <%}%>
    </div>

    <a href="/HobbitHall/Admin/Dashboard/dashboard.jsp"><i class="fa fa-home" aria-hidden="true"></i></i><span>Dashboard</span></a>
    <a href="/HobbitHall/ViewEmployeeInfo" class="dropdown-btn"><i class="fa fa-user-circle-o" aria-hidden="true"></i><span>Employee</span></a>
    <a href="#" class="dropdown-btn"><i class="fa fa-book" aria-hidden="true"></i><span>Product <i class="fa fa-caret-down"></i></span></a>
    <div class="dropdown-container">
        <a href="#" class="dropdown-list">Insert Product</a>
        <a href="#" class="dropdown-list">Product Category</a>
    </div>
    <a href=""><i class="fa fa-user" aria-hidden="true"></i><span>Order</span></a>
    <a href=""><i class="fa fa-product-hunt" aria-hidden="true"></i><span>Promotion</span></a>
    <a href="../SalesRecord/ViewSalesTable.jsp"><i class="fa fa-folder" aria-hidden="true"></i><span>Daily Sales</span></a>
    <a href="#"><i class="fa fa-pie-chart"></i><span>Sales Report</span></a>
</div>
<!--sidebar end-->


<script type="text/javascript">
    $(document).ready(function () {
        $('.nav_btn').click(function () {
            $('.mobile_nav_items').toggleClass('active');
        });
    });
</script>

<script>
    var dropdown = document.getElementsByClassName("dropdown-btn");
    var i;

    for (i = 0; i < dropdown.length; i++) {
        dropdown[i].addEventListener("click", function () {
            this.classList.toggle("active");
            var dropdownContent = this.nextElementSibling;
            if (dropdownContent.style.display === "block") {
                dropdownContent.style.display = "none";
            } else {
                dropdownContent.style.display = "block";
            }
        });
    }
</script>