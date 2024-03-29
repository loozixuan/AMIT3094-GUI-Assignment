<!DOCTYPE html>
<%-- 
    Document   : login
    Created on : Mar 9, 2021, 8:42:54 PM
    Author     : Chrisann Lee
--%>
<html>
    <head>
        <title>Hobbit Hall</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
      
        <link rel="icon" href="/HobbitHall/Client/Share/images/logoBook.png"/>
        <link href="/HobbitHall/Client/Login/login.css" rel="stylesheet">


    </head>


    <body>
        <%@ include file="../Share/header.jsp" %>
        <div class="loginContainer">

            <% String success = (String) request.getAttribute("successMessage");
                if (success != null) {%>
            <p class="errorMessage" style="color:green"><%= success%></p>
            <% }%>
            <h3>Login to my account</h3>

            <form action="/HobbitHall/Login" method="get">
                <div class="loginForm">
                    <p class="enter">Enter your e-mail and password:</p>
                    <input type="text" name="email" placeholder="Email" value=""/>

                    <input type="password" name="password" placeholder="Password" value=""/>
                    <div>
                        <input type="submit" value="Login" id="submit"/>
                    </div>
                    <% String error = (String) request.getAttribute("errorMessage");
                        if (error != null) {%>
                    <div class="errorMessage"><%= error%></div>
                    <% }%>
                </div>
            </form>

            <div style="margin-top:20px;margin-bottom:10px;">
                <div class="rowQuestion">
                    <p class="question">New customer? </p><a href="/HobbitHall/Client/Register/register.jsp"><p class="link"> Create your account</p></a> 
                </div>
                <div class="rowQuestion">
                    <p class="question">Lost password? </p><a href="/HobbitHall/ForgotPassword?action=1"><p class="link"> Recover password</p></a>
                </div>
            </div>

        </div>

        <%@ include file="../Share/footer.html" %>

    </body>
</html>
