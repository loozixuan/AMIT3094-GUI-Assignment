<%-- 
    Document   : home
    Created on : Mar 7, 2021, 1:02:28 PM
    Author     : Chrisann Lee
--%>

<%@page import="entity.Product,java.util.List"%>
<% List<Product> proSelfList = (List<Product>) request.getAttribute("productSelfList");
    List<Product> proChildList = (List<Product>) request.getAttribute("productChildList");%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hobbit Hall</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" href="<%=request.getContextPath()%>/Client/Share/images/logoBook.png"/>
        <link href="<%=request.getContextPath()%>/Client/Home/home.css" rel="stylesheet">

    </head>


    <body>

        <%@ include file="../Share/header.jsp" %>
        <main role="main">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>

                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="/HobbitHall/Client/Home/images/poster1.png" alt="poster1"/>
                        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" style=><rect width="100%" height="100%" fill="#777"/></svg>

                    </div>
                    <div class="carousel-item">
                        <img src="/HobbitHall/Client/Home/images/poster2.png" alt="poster2"/>

                        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>

                    </div>

                    <div class="carousel-item">
                        <img src="/HobbitHall/Client/Home/images/poster3.png" alt="poster3"/>
                        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
                        <div class="container">
                            <div class="carousel-caption text-right">
                                <p><a class="btn btn-lg btn-primary" href="../ProductDetails/productDetail.php?code=P1009" role="button" style=" background-color: rgba(0,0,0,0.6);">View more</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <div class="collectionsContainer">
                <div>
                    <p id="titleCollection">Most Searched Collections</p>
                </div>
                <div class="buttonCollectionsRow">
                    <div class="buttonCollection-inner">
                        <div class="buttonImgContainer"><a href="/HobbitHall/ViewProducts?subcategory=E001&category=1&name=name&order=desc"/><img src="/HobbitHall/Client/Home/images/buttonBusiness.png" alt="buttonBusiness"/></a></div>
                        <p class="buttonCollection"> <a href="/HobbitHall/ViewProducts?subcategory=E001&category=1&name=name&order=desc"/><span>Business Management</span></a></p>
                    </div>
                    <div class="buttonCollection-inner">
                        <div class="buttonImgContainer"><a href="/HobbitHall/ViewProducts?subcategory=E017&category=1&name=name&order=desc"/><img src="/HobbitHall/Client/Home/images/buttonChildren.png" alt="buttonChildren"/></a></div>
                        <p class="buttonCollection"><a href="/HobbitHall/ViewProducts?subcategory=E017&category=1&name=name&order=desc"/><span>Children's Books</span></a></p>
                    </div>
                    <div class="buttonCollection-inner">
                        <div class="buttonImgContainer"><a href="/HobbitHall/ViewProducts?subcategory=E018&category=1&name=name&order=desc"/><img src="/HobbitHall/Client/Home/images/buttonNovel.png" alt="buttonNovel"/></a></div>
                        <p class="buttonCollection"><a href="/HobbitHall/ViewProducts?subcategory=E018&category=1&name=name&order=desc"/><span>Novel</span></a></p>
                    </div>
                    <div class="buttonCollection-inner">
                        <div class="buttonImgContainer"><a href="/HobbitHall/ViewProducts?subcategory=E003&category=1&name=name&order=desc"/><img src="/HobbitHall/Client/Home/images/buttonYoung.png" alt="buttonYoung"/></a></div>
                        <p class="buttonCollection"><a href="/HobbitHall/ViewProducts?subcategory=E013&category=1&name=name&order=desc"/><span>Young Adult</span></a></p>
                    </div>
                    <div class="buttonCollection-inner">
                        <div class="buttonImgContainer"><a href="/HobbitHall/ViewProducts?subcategory=E002&category=1&name=name&order=desc"/><img src="/HobbitHall/Client/Home/images/buttonSelf.png" alt="buttonSelfHelp"/></a></div>
                        <p class="buttonCollection"><a href="/HobbitHall/ViewProducts?subcategory=E002&category=1&name=name&order=desc"/><span>Self Help</span></a></p>
                    </div>
                    <div class="buttonCollection-inner">
                        <div class="buttonImgContainer"><a href="/HobbitHall/ViewProducts?subcategory=E019&category=1&name=name&order=desc"/><img src="/HobbitHall/Client/Home/images/buttonArt.png" alt="buttonArt"/></a></div>
                        <p class="buttonCollection"><a href="/HobbitHall/ViewProducts?subcategory=E019&category=1&name=name&order=desc"/><span>Art</span></a></p>
                    </div>
                </div>
            </div>

            <div class="prod-list-container w-90 p-2">
                <div class="prod-head">
                    <div id="motivational">Self Help Reads...</div>
                    <a href="/HobbitHall/ViewProducts?subcategory=E002&category=1&name=name&order=desc"/><p id="view-more"><span>View more</span></p></a>
                </div>


                <div class="prod-container row d-flex justify-content-between">
                    <%if (!proSelfList.isEmpty()) {
                            for (int i = 0; i < 5; i++) {
                                Product proSelf = proSelfList.get(i);%>
                    <div class="book-body p-4 mb-3">
                        <div><a href="/HobbitHall/LoadProductDesc?productid=<%= proSelf.getId()%>&subcategory=<%= proSelf.getSubcategoryId().getId()%>"><img src="/HobbitHall/Client/Share/images/book/<%=proSelf.getImage()%>" src="book" class="bookImg"/></a></div>
                        <div><%=proSelf.getName()%></div>
                        <div>RM <%=proSelf.getPrice()%></div>
                        <a href="/HobbitHall/LoadProductDesc?productid=<%= proSelf.getId()%>&subcategory=<%= proSelf.getSubcategoryId().getId()%>"><button class="btn-cart">Add To Cart</button></a>
                    </div>
                    <%}
                        }%>

                </div>
            </div>


            <div class="children-book-container">
                <div class="children-bookImg-container">
                    <h2>Children Books</h2>
                    <p>Explore our featured collection..</p>
                    <a href="/HobbitHall/ViewProducts?subcategory=E017&category=1&name=name&order=desc"/><button class="button-shop-now"><span>Shop Now</span></button></a>
                    <div><img src="/HobbitHall/Client/Home/images/childrenBook.png" alt="childrenBook" /></div>    
                </div>
                <div class="prod-container row d-flex" style="width:60%">
                    <%if (!proChildList.isEmpty()) {
                            for (int i = 0; i < 3; i++) {
                                Product proChild = proChildList.get(i);%>
                    <div class="book-body p-4 mb-3" style="width:33%" >
                        <div><a href="/HobbitHall/LoadProductDesc?productid=<%= proChild.getId()%>&subcategory=<%= proChild.getSubcategoryId().getId()%>"><img src="/HobbitHall/Client/Share/images/book/<%=proChild.getImage()%>" src="book" class="bookImg"/></a></div>
                        <div class="book-title"><%=proChild.getName()%></div>
                        <div>RM <%=proChild.getPrice()%></div>
                        <a href="/HobbitHall/LoadProductDesc?productid=<%= proChild.getId()%>&subcategory=<%= proChild.getSubcategoryId().getId()%>"><button class="btn-cart">Add To Cart</button></a>
                    </div>
                    <%}
                        }%>
                </div>

            </div>


        </main>

        <%@ include file="../Share/footer.html" %>

    </body>
</html>
