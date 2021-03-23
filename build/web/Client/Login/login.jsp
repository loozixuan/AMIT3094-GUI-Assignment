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
        <link rel="icon" href="../Share/images/logoBook.png"/>
        <link href="login.css" rel="stylesheet">
    </head>


    <body>
        <%@ include file="../Share/header.jsp" %>
        <div class="loginContainer">
            <% String error=(String)request.getAttribute("errorMessage") ;
                if(error!=null){%>
                <p><%= error%></p>
                <% } %>
            <h3>Login to my account</h3>
          
            <form action="../../Login" action="get">
                <div class="loginForm">
                    <p class="enter">Enter your e-mail and password:</p>
                    <input type="text" name="email" placeholder="Email" value=""/>
                    <input type="text" name="password" placeholder="Password" value=""/>

                    <div>
                        <input type="submit" value="Login" id="submit"/>
                    </div>
                </div>

            </form>

            <div style="margin-top:20px;margin-bottom:10px;">
                <div class="rowQuestion">
                    <p class="question">New customer? </p><p class="link"> Create your account</p> 
                </div>
                <div class="rowQuestion">
                    <p class="question">Lost password? </p><p class="link"> Recover password</p>
                </div>
            </div>

        </div>

        <%@ include file="../Share/footer.html" %>

    </body>
</html>
