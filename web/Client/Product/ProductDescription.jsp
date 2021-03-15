<%-- 
    Document   : ProductCatalog
    Created on : Mar 12, 2021, 2:01:45 PM
    Author     : zixuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="ProductDescription.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" href="../Share/images/logoBook.png"/>
        <link rel="icon" href="../Share/images/logoBook.png"/>
        <title>Hobbit Hall Book Store</title>
    </head>
    <!--Header-->
    <%@include file="../Share/header.html" %>

    <body>
        <div class="product-des-container pt-4">
            <div class="info-card p-2 d-flex justify-content-evenly">
                <div class="image-body p-4 d-flex justify-content-evenly">
                    <div class="small-image"><img src="../Share/images/book/business/business1.jpg" alt="book"/></div>
                    <div><img src="../Share/images/book/business/business1.jpg" alt="book"/></div>
                </div>
                <div class="info-body p-4">

                    <div>Stats & Curiosities</div>
                    <div class="author-info d-flex justify-content-between align-items-center">
                        <div>
                            Shelly Low
                        </div>
                        <div style="font-size: 25px">
                            <i class="fa fa-facebook-square" aria-hidden="true"></i>
                            <i class="fa fa-instagram" aria-hidden="true"></i>
                            <i class="fa fa-twitter-square" aria-hidden="true"></i>
                            <i class="fa fa-envelope-o" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div class="price-info d-flex align-items-baseline">
                        <div>Price: </div>
                        <div>RM 88.88</div>
                    </div>
                    <div class="stock-info d-flex align-items-baseline">
                        <div>Stock: </div>
                        <div>Out of Stock</div>
                    </div>

                    <div class="input-group">
                        <div class="input-group-button">
                            <button type="button" class="button" data-quantity="minus" data-field="quantity">
                                <i class="fa fa-minus" aria-hidden="true"></i>
                            </button>
                        </div>
                        <input class="input-group-field" type="number" name="quantity" value="0">
                        <div class="input-group-button">
                            <button type="button" class="button hollow circle" data-quantity="plus" data-field="quantity">
                                <i class="fa fa-plus" aria-hidden="true"></i>
                            </button>
                        </div>
                    </div>
                    <div>
                        <button class="btn-des-cart">Add To Cart</button>
                    </div>

                </div>
            </div>

            <div class="des-card p-2">
                <div class="book-description-title p-4 mx-auto">
                    Description
                </div>
                <div class="book-description p-4 mx-auto">
                    Shetty grew up in a family where you could become one of three things—a doctor, a lawyer, or a failure. His family was convinced he had chosen option three: instead of attending his college graduation ceremony, he headed to India to become a monk, to meditate every day for four to eight hours, and devote his life to helping others. After three years, one of his teachers told him that he would have more impact on the world if he left the monk’s path to share his experience and wisdom with others. Heavily in debt, and with no recognizable skills on his résumé, he moved back home in north London with his parents.

                    Shetty reconnected with old school friends—many working for some of the world’s largest corporations—who were experiencing tremendous stress, pressure, and unhappiness, and they invited Shetty to coach them on well-being, purpose, and mindfulness. Since then, Shetty has become one of the world’s most popular influencers. In 2017, he was named in the Forbes magazine 30-under-30 for being a game-changer in the world of media. In 2018, he had the #1 video on Facebook with over 360 million views. His social media following totals over 38 million, he has produced over 400 viral videos which have amassed more than 8 billion views, and his podcast, On Purpose, is consistently ranked the world’s #1 Health and Wellness podcast.

                    In this inspiring, empowering book, Shetty draws on his time as a monk to show us how we can clear the roadblocks to our potential and power. Combining ancient wisdom and his own rich experiences in the ashram, Think Like a Monk reveals how to overcome negative thoughts and habits, and access the calm and purpose that lie within all of us. He transforms abstract lessons into advice and exercises we can all apply to reduce stress, improve relationships, and give the gifts we find in ourselves to the world. Shetty proves that everyone can—and should—think like a monk.
                </div>
            </div>

            <div class="product-item-card p-2 mx-auto">
                <span class="section-title p-2" style="margin:20px;">You may also like this</span>
                <div class="prod-container row p-2 d-flex justify-content-between">
                    <div class="product-item-body p-3">
                        <a href="ProductDescription.jsp"><img src="../Share/images/book/business/business2.jpg" src="book" style="max-width: 100%"/></a>
                        <div>Stats & Curiosities</div>
                        <div>RM 100</div>
                        <li>Sold Out</li>
                        <button class="btn-cart">Add To Cart</button>
                    </div>
                    <div class="product-item-body p-3">
                        <a href="ProductDescription.jsp"><img src="../Share/images/book/business/business3.jpg" src="book" style="max-width: 100%"/></a>
                        <div>Stats & Curiosities</div>
                        <div>RM 100</div>
                        <li>Sold Out</li>
                        <button class="btn-cart">Add To Cart</button>
                    </div>
                    <div class="product-item-body p-3">
                        <a href="ProductDescription.jsp"><img src="../Share/images/book/business/business4.jpg" src="book" style="max-width: 100%"/></a>
                        <div>Stats & Curiosities</div>
                        <div>RM 100</div>
                        <li>Sold Out</li>
                        <button class="btn-cart">Add To Cart</button>
                    </div><div class="product-item-body p-3">
                        <a href="ProductDescription.jsp"><img src="../Share/images/book/business/business1.jpg" src="book" style="max-width: 100%"/></a>
                        <div>Stats & Curiosities</div>
                        <div>RM 100</div>
                        <li>Sold Out</li>
                        <button class="btn-cart">Add To Cart</button>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <!--Footer-->
    <%@include file="../Share/footer.html" %>
</html>

