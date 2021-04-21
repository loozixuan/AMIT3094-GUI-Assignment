<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images/logo-book.png"/>
        <link href="/HobbitHall/Admin/AdminLogin/adminLogin.css" rel="stylesheet">
        <link rel="icon" href="/HobbitHall/Admin/Share/images/logo-book.png"/>
        <title>Hobbit Hall Admin</title>
    </head>

    <body style="background-image: url('/HobbitHall/Admin/Share/images/loginbg.jpeg');
          background-size: cover;background-repeat: no-repeat;">

        <div class="content mt-5" align="center">
            <div class="login" style="margin-top: 80px;">
                <% String err_msg = (String) request.getAttribute("errMsg");
                    if (err_msg != null) { %>
                <div class="err-msg" style="color:red">
                    ${err_msg}
                </div>
                <% }%>
                <h3>Login as Administrator</h3>

                <form action="/HobbitHall/LoginAdmin" method="POST">
                    <div class="adminlogin">
                        <p class="enter">Please fill in the information below :</p>
                        <input type="email" name="email" placeholder="Email"/>
                        <input type="password" name="password" placeholder="Password"/>

                        <div style = "margin-top:20px; margin-bottom:10px;">
                            <div class="d-flex rowQuestion text-center" style="display:flex;font-size:0.9em;justify-content:center">
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
