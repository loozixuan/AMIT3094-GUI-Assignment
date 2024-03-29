<%-- 
    Document   : header
    Created on : Mar 17, 2021, 11:28:24 PM
    Author     : Chrisann Lee
--%>
<jsp:useBean id="customer" scope="session" class="entity.Customer"/>  
<%@page import="entity.Subcategory,java.util.List"%>
<% List<Subcategory> subCategoryList = (List<Subcategory>) session.getAttribute("subCategoryList");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<link href="<%=request.getContextPath()%>/Client/Share/base.css" rel="stylesheet">

<header>
    <div class="header justify-content-between">
        <div class="logo">
            <a href="/HobbitHall/Home"><img src="<%=request.getContextPath()%>/Client/Share/images/logo.png" alt="logo"></a>
        </div>

        <form action="/HobbitHall/Search" method="POST">
            <div id="searchBar">
                <input type="text" name="search" placeholder="Title, Author or Keyword">
                <div id="searchIconContainer">
                    <button style="background: transparent;border:none;color:white;outline:none"><i class="fa fa-search" aria-hidden="true"></i></button>
                </div>
            </div>
        </form>

        <div class="header-right">
            <div class="col-1-2">
                <div style="display:flex;color:rgb(128, 128, 255)">

                    <% String name = customer.getName();
                        if (name == null) {%>
                        <a href="<%=request.getContextPath()%>/Client/Login/login.jsp"><div>Login </div></a><a href="/HobbitHall/Client/Register/register.jsp"><div>/ Signup</div></a>
                    <%} else { %>
                    <div>Hello ${customer.name}</div>
                    <% }%>
                </div>
                <div id="myAccount" >
                    <a href="<%=request.getContextPath()%>/Client/User/userProfile.jsp"> <p >My Account<p></a>
                </div>
            </div>
            <a href="/HobbitHall/ShoppingCart?action=display">
                <div class="col-1-2" id="cart">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                    <div id="cartLabel">Cart</div>
                </div>
            </a>
        </div>
    </div>


    <div class="navigation">
        <ul class="nav-inner">
            <li class="nav-title ">
                <a class="nav-link" href="" data-toggle="dropdown"> English Books <i class="fa fa-chevron-down" aria-hidden="true"></a></i> 
                <div class="dropdown-item">

                    <div class='row-item d-flex justify-content-between flex-wrap'>

                        <% for (int i = 0; i < subCategoryList.size(); i++) {
                                Subcategory subCategory = subCategoryList.get(i);
                        %>
                        <% if (subCategory.getCategoryId().getId().equalsIgnoreCase("1")) {%>
                        <div class="subCategory justify-content-center d-flex w-25">
                            <a href="/HobbitHall/ViewProducts?subcategory=<%= subCategory.getId()%>&category=1&name=name&order=desc"/><%= subCategory.getName()%></a>
                        </div>

                        <% }
                            }%>
                    </div>


                </div>
            </li>
            <li class="nav-title ">
                <a class="nav-link" href="#" data-toggle="dropdown"> Chinese Books <i class="fa fa-chevron-down" aria-hidden="true"></i></a> 
                <div class="dropdown-item">
                    <div class='row-item d-flex justify-content-between flex-wrap'>

                        <% for (int i = 0; i < subCategoryList.size(); i++) {
                                Subcategory subCategory = subCategoryList.get(i);
                        %>
                        <% if (subCategory.getCategoryId().getId().equalsIgnoreCase("2")) {%>
                        <div class="subCategory justify-content-center d-flex w-25">
                            <a href="/HobbitHall/ViewProducts?subcategory=<%= subCategory.getId()%>&category=2&name=name&order=desc"/><%= subCategory.getName()%></a>
                        </div>

                        <% }
                            }%>
                    </div>
                </div>
            </li>
            <li class="nav-title ">
                <a class="nav-link" href="#" data-toggle="dropdown"> Malay Books <i class="fa fa-chevron-down" aria-hidden="true"></a></i> 
                <div class="dropdown-item">
                    <div class='row-item d-flex justify-content-between flex-wrap'>

                        <% for (int i = 0; i < subCategoryList.size(); i++) {
                                Subcategory subCategory = subCategoryList.get(i);
                        %>
                        <% if (subCategory.getCategoryId().getId().equalsIgnoreCase("3")) {%>
                        <div class="subCategory justify-content-center d-flex w-25">
                            <a href="/HobbitHall/ViewProducts?subcategory=<%= subCategory.getId()%>&category=3&name=name&order=desc"/><%= subCategory.getName()%></a>
                        </div>
                        <% }
                            }%>
                    </div>
                </div>
            </li>
        </ul>

    </div>
</header>
