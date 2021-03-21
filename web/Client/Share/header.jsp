<%-- 
    Document   : header
    Created on : Mar 17, 2021, 11:28:24 PM
    Author     : Chrisann Lee
--%>
<jsp:useBean id="customer" scope="session" class="entity.Customer"/>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link href="../Share/base.css" rel="stylesheet">
    
        <header>
            <div class="header">
                <div class="logo">
                    <a href="../Home/home.jsp"><img src="../Share/images/logo.png" alt="logo"></a>
                </div>
                <div id="searchBar">
                    <input type="text" name="search" placeholder="Search">
                    <div id="searchIconContainer">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="header-right">
                    <div class="col-1-2">
                        <div style="display:flex;color:rgb(128, 128, 255)">
                            
                            <% String name=customer.getName();
                            if(name==null){ %>
                            <a href="../Login/login.jsp"><div>Login </div></a><div>/ Signup</div>
                            <%}else{ %>
                            <div>Hello ${customer.name}</div>
                            <% } %>
                        </div>
                        <div id="myAccount" >
                            <a href="../User/userProfile.jsp"> <p >My Account<p></a>
                        </div>
                    </div>
                    <div class="col-1-2" id="cart">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        <div id="cartLabel">Cart</div>
                    </div>
                </div>
            </div>
            <div class="navigation">
                <ul class="nav-inner">
                    <li class="nav-title ">
                        <a class="nav-link" href="#" data-toggle="dropdown"> English Books <i class="fa fa-chevron-down" aria-hidden="true"></a></i> 
                        <div class="dropdown-item">
                            <div class='row-item'>
                                <div>ss</div>
                                <div>ss</div>
                                <div>ss</div>
                                <div>ss</div>
                            </div>
                        </div>
                    </li>
                    <li class="nav-title ">
                        <a class="nav-link" href="#" data-toggle="dropdown"> Chinese Books <i class="fa fa-chevron-down" aria-hidden="true"></i></a> 
                        <div class="dropdown-item">
                             <div class='row-item'>
                                <div>ss</div>
                                <div>ss</div>
                                <div>ss</div>
                                <div>ss</div>
                            </div>
                        </div>
                    </li>
                    <li class="nav-title ">
                        <a class="nav-link" href="#" data-toggle="dropdown"> Malay Books <i class="fa fa-chevron-down" aria-hidden="true"></a></i> 
                        <div class="dropdown-item">
                             <div class='row-item'>
                                <div>ss</div>
                                <div>ss</div>
                                <div>ss</div>
                                <div>ss</div>
                            </div>
                        </div>
                    </li>
                </ul>

            </div>
        </header>
