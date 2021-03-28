<%-- 
    Document   : ChangePassword
    Created on : Mar 25, 2021, 8:42:54 PM
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
        <link rel="icon" href="../Share/images/logoBook.png"/>
        <link rel="icon" href="/HobbitHall/Client/Share/images/logoBook.png"/>
        <link href="/HobbitHall/Client/Login/login.css" rel="stylesheet">

       
    </head>


    <body>
        <%@ include file="../Share/header.jsp" %>
        <div class="loginContainer">
            <% String error = (String) request.getAttribute("errorMessage");
                if (error != null) {%>
            <p class="errorMessage"><%= error%></p>
            <% }%>
            <h3>Login to my account</h3>

            <form action="/HobbitHall/ForgotPassword?action=change" method="post">
                <div class="loginForm">
                    <p class="enter">Enter your e-mail and password:</p>
                    <input type="text" name="email" placeholder="Email" value=""/>
                    <input type="password" name="new_password" placeholder="New Password" value=""/>
                    <input type="password" name="confirm_password" placeholder="Confirm Password" value=""/>
                    <p style="font-size:0.8em;">Password requires 8 characters, at least 1 letter and 1 number.</p>
                    <div>
                        <input type="submit" value="Change Password" id="submit"/>
                    </div>
                </div>

            </form>

        </div>

        <%@ include file="../Share/footer.html" %>

    </body>
</html>

