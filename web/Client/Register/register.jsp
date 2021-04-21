<!DOCTYPE html>

<html>
    <head>
        <title>Hobbit Hall</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="/HobbitHall/Client/Register/register.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
         <link rel="icon" href="/HobbitHall/Client/Share/images/logoBook.png"/>
        <script>
            function validate(){
                var username = document.form.username.value;
                var email = document.form.email.value;
                var contactNo = document.form.contactNo.value;
                var password = document.form.password.value;
                var cpassword = document.form.cpassword.value;
                
                if(username==null || username=""){
                    alert("Username cannot be blank.");
                    return false;
                }else if(email==null || email=""){
                    alert("Email cannot be blank.");
                    return false;
                }else if(contactNo==null || contactNo=""){
                    alert("Contact Number cannot be blank.");
                    return false;
                }else if(password.length<8){
                    alert("Password must consist of minimum 8 characters.");
                    return false;
                }else if(password!=cpassword){
                    alert("Confirm Password must should match with the Password.");
                    return false;
                }
            }
        </script>
            
    </head>


    <body>
        <%@ include file="../Share/header.jsp" %>
        <div class="register row justify-content-start"> 
            <h5 class="text-center text-success">${success_message}</h5>
            <h2>Create My Account</h2>
            <form class="col-md-4" action="<%= request.getContextPath() %>/Register" method="POST" onsubmit="return validate()">
                <p class="enter mb-1">Please fill in the information below :</p>
                <input type="text" name="fullName" placeholder="Full Name" value="${fullName_entered}"/>
                <p class="text-danger text-start mb-1">${fullName_error}</p>
                <input type="text" name="email" placeholder="Email" value="${email_entered}"/>
                <p class="text-danger text-start mb-1">${email_error}</p>
                <input type="text" name="address" placeholder="Address" value="${address_entered}"/>
                <p class="text-danger text-start mb-1">${address_error}</p>
                <input type="text" name="contactNo" placeholder="Contact Number" value="${contactNo_entered}"/>
                <p class="text-danger text-start mb-1">${contactNo_error}</p>
                <input type="password" name="password" placeholder="Password" value="${password_entered}"/>
                <p class="text-danger text-start mb-1">${password_error}</p>
                <input type="password" name="cpassword" placeholder="Confirm Password" value="${cpassword_entered}"/>
                <p class="text-danger text-start mb-1">${cpassword_error}</p>
                <div class="text-center"><button type="submit">Register</button><button>Cancel</button></div>
            </form>
            <div style="margin-top:20px;margin-bottom:10px;">
                <div class="Question" style="display:flex;font-size:0.8em;">    
                    <p class="question">Already have an account?</p>
                     <a href="<%=request.getContextPath()%>/Client/Login/login.jsp"><div> Login here</div></a>   
                </div>
            </div>

        </div>

    </body>
</html>
