<%-- 
    Document   : SendedEmail
    Created on : Mar 25, 2021, 5:55:22 PM
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
        <link rel="icon" href="Client/Share/images/logoBook.png"/>
        <link href="login.css" rel="stylesheet">
        <link href="Client/Login/login.css" rel="stylesheet">
    </head>


    <body>
        <%@ include file="../Share/header.jsp" %>
        <div class="loginContainer">
            <div class="send_email">
                <h4>System has sent an email to your email account.Please click the button that provided in the email to change your password.</h4>
            </div>

        </div>

        <%@ include file="../Share/footer.html" %>

    </body>
</html>
