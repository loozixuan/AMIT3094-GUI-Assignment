<%-- 
    Document   : ForgotPassword
    Created on : Mar 25, 2021, 1:02:28 PM
    Author     : Chrisann Lee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hobbit Hall</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="icon" href="/HobbitHall/Client/Share/images/logoBook.png"/>
        <link href="login.css" rel="stylesheet">
        <link href="/HobbitHall/Client/Login/login.css" rel="stylesheet">
    </head>


    <body>
        <%@ include file="../Share/header.jsp" %>
        <div class="loginContainer">

            <h3>Forgot Password</h3>

            <form action="/HobbitHall/ForgotPassword?action=email" method="post">
                <div class="loginForm">
                    <p class="enter">Enter your e-mail:</p>
                    <input type="text" name="email" placeholder="Email" value=""/>
                    <div>
                        <input type="submit" value="Send Email" id="submit"/>
                    </div>
                    <% String error = (String) request.getAttribute("errorMessage");
                        if (error != null) {%>
                    <div class="errorMessage"><%= error%></div>
                    <% }%>
                </div>

            </form>
        </div>

        <%@ include file="../Share/footer.html" %>

    </body>
</html>
