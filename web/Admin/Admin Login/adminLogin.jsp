<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images/logo-book.png"/>
        
        <link href="adminLogin.css" rel="stylesheet">
    </head>


    <body>

        <%@ include file="../Share/adminHeader.html" %>
        <div class="content" align="center">
            <div class="login">

                
                
                
                <h3>Login as Administrator</h3>

                <form action="../../adminLogin" method="get">
                    <div class="adminlogin">
                        <p class="enter">Please fill in the information below :</p>
                        <input type="text" name="name" placeholder="Name" value=""/>
                        <input type="text" name="email" placeholder="Email" value=""/>
                        <input type="password" name="password" placeholder="Password" value=""/>

                        <div style = "margin-top:20px; margin-bottom:10px;">
                            <div class="rowQuestion" style="display:flex;font-size:0.8em;">
                                <p class="question"></p><p class="link">*Forgot your password?</p>
                            </div>
                        </div>
                        
                        <div>
                            <input type="submit" value="Login" id="submit"/>
                        </div>
                    </div>

                </form>

            </div>

        </div>

        
    </body>
</html>
