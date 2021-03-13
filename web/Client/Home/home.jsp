<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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
       
        <link href="home.css" rel="stylesheet">
    </head>


    <body>
        <%@ include file="../Share/header.html" %>
        <main role="main">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>

                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/poster1.png" alt="poster1"/>
                        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" style=><rect width="100%" height="100%" fill="#777"/></svg>

                    </div>
                    <div class="carousel-item">
                        <img src="images/poster2.png" alt="poster2"/>

                        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>

                    </div>

                    <div class="carousel-item">
                        <img src="images/poster3.png" alt="poster3"/>
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
                        <div class="buttonImgContainer"><img src="images/buttonBusiness.png" alt="buttonBusiness"/></div>
                        <p class="buttonCollection"><span>Business Management</span></p>
                    </div>
                    <div class="buttonCollection-inner">
                        <div class="buttonImgContainer"><img src="images/buttonChildren.png" alt="buttonChildren"/></div>
                        <p class="buttonCollection"><span>Children's Books</span></p>
                    </div>
                    <div class="buttonCollection-inner">
                        <div class="buttonImgContainer"><img src="images/buttonNovel.png" alt="buttonNovel"/></div>
                        <p class="buttonCollection"><span>Novel</span></p>
                    </div>
                    <div class="buttonCollection-inner">
                        <div class="buttonImgContainer"><img src="images/buttonYoung.png" alt="buttonYoung"/></div>
                        <p class="buttonCollection"><span>Young Adult</span></p>
                    </div>
                    <div class="buttonCollection-inner">
                        <div class="buttonImgContainer"><img src="images/buttonSelf.png" alt="buttonSelfHelp"/></div>
                        <p class="buttonCollection"><span>Self Help</span></p>
                    </div>
                    <div class="buttonCollection-inner">
                        <div class="buttonImgContainer"><img src="images/buttonArt.png" alt="buttonArt"/></div>
                        <p class="buttonCollection"><span>Art</span></p>
                    </div>
                </div>
            </div>

            <div class="prod-list-container w-90 p-2">
                <div class="prod-head">
                     <div id="motivational">Motivational Reads...</div>
                      <p id="view-more"><span>View more</span></p>
                </div>
               

                <div class="prod-container row d-flex justify-content-between">
                    <div class="book-body p-3 mb-3">
                        <a href="ProductDescription.jsp"><img src="../Share/images/book/business/business1.jpg" src="book" style="max-width: 100%"/></a>
                        <div class="book-title">Stats & Curiosities</div>
                        <div>RM 100</div>
                        <li>Sold Out</li>
                        <button class="btn-cart">Add To Cart</button>
                    </div>
                    <div class="book-body p-3 mb-3">
                        <img src="../Share/images/book/business/business2.jpg" src="book" style="max-width: 100%"/>
                        <div class="book-title">Rebuilding Your Business Model</div>
                        <div>RM 200</div>
                        <li>Sold Out</li>
                        <button class="btn-cart">Add To Cart</button>
                    </div>
                    <div class="book-body p-3 mb-3">
                        <img src="../Share/images/book/business/business3.jpg" src="book" style="max-width: 100%"/>
                        <div class="book-title">HBR's 10 Must Reads on Communication</div>
                        <div>RM99.99</div>
                        <li>Sold Out</li>
                        <button class="btn-cart">Add To Cart</button>
                    </div>
                    <div class="book-body p-3 mb-3">
                        <img src="../Share/images/book/business/business4.jpg" src="book" style="max-width: 100%"/>
                        <div class="book-title">Creating Business Planning</div>
                        <div>RM88.88</div>
                        <li>Sold Out</li>
                        <button class="btn-cart">Add To Cart</button>
                    </div>
                    <div class="book-body p-3 mb-3">
                        <img src="../Share/images/book/business/business3.jpg" src="book" style="max-width: 100%"/>
                        <div class="book-title">HBR's 10 Must Reads on Communication</div>
                        <div>RM99.99</div>
                        <li>In Stock</li>
                        <button class="btn-cart">Add To Cart</button>
                    </div>
                </div>
            </div>
            
            
            <div class="children-book-container">
                <div class="children-bookImg-container">
                    <h2>Children Books</h2>
                    <p>Explore our featured collection..</p>
                    <button class="button-shop-now"><span>Shop Now</span></button>
                    <div><img src="images/childrenBook.png" alt="childrenBook" /></div>    
                </div>
                <div class="prod-container row d-flex" style="width:60%">
                     <div class="book-body p-3 mb-3" style="width:31%" >
                        <img src="../Share/images/book/business/business3.jpg" src="book" style="max-width: 100%"/>
                        <div class="book-title">HBR's 10 Must Reads on Communication</div>
                        <div>RM99.99</div>
                        <li>Sold Out</li>
                        <button class="btn-cart">Add To Cart</button>
                    </div>
                    <div class="book-body p-3 mb-3" style="width:31%">
                        <img src="../Share/images/book/business/business4.jpg" src="book" style="max-width: 100%"/>
                        <div class="book-title">Creating Business Planning</div>
                        <div>RM88.88</div>
                        <li>Sold Out</li>
                        <button class="btn-cart">Add To Cart</button>
                    </div>
                    <div class="book-body p-3 mb-3" style="width:31%">
                        <img src="../Share/images/book/business/business3.jpg" src="book" style="max-width: 100%"/>
                        <div class="book-title">HBR's 10 Must Reads on Communication</div>
                        <div>RM99.99</div>
                        <li>In Stock</li>
                        <button class="btn-cart">Add To Cart</button>
                    </div>
                </div>
                
            </div>


        </main>


        <%@ include file="../Share/footer.html" %>

    </body>
</html>
