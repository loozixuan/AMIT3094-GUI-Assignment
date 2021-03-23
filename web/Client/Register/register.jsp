<!DOCTYPE html>

<html>
    <head>
        <title>Hobbit Hall</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="register.css" rel="stylesheet">
    </head>


    <body>
        <%@ include file="../Share/adminHeader.html" %>
        <div class="register">

            <h2>Create My Account</h2>
            <p class="enter">Please fill in the information below :</p>
            <input type="text" name="username" placeholder="Username" value=""/>
            <input type="text" name="email" placeholder="Email" value=""/>
            <input type="text" name="address" placeholder="Address" value=""/>
            <input type="number" name="contactNo" placeholder="Contact Number" value=""/>
            <input type="password" name="password" placeholder="Password" value=""/>
            <p class="link">*Password must consist of minimum 8 characters.</p>
            <input type="password" name="cpassword" placeholder="Confirm Password" value=""/>
            <div class="option" >
                <input type="checkbox" id="customer">
                <label for="customer"> Customer</label><br>
                <input type="checkbox" id="admin">
                <label for="admin"> Admin</label>
            </div>


            <div>
                <button>Register</button><button>Cancel</button>
            </div>

            <div style="margin-top:20px;margin-bottom:10px;">
                <div class="Question" style="display:flex;font-size:0.8em;">    
                    <p class="question">Already have an account?</p>
                    <a href="../Login/login.jsp"><div> Login here</div></a>   
                </div>
            </div>

        </div>



    </body>
</html>
