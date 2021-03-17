<%-- 
    Document   : userProfile
    Created on : Mar 17, 2021, 9:18:28 PM
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
        <link href="userProfile.css" rel="stylesheet">
    </head>
    <body>
         <%@ include file="../Share/header.jsp" %>
           <div class="user-profile">
                  <%@ include file="../Share/userSidebar.jsp" %>
                <div class="col-3-4">
            
<!--                    <form action="" method="post">
                    <div class="row">
                        <label>Name :<span class="text-danger">*</span></label><br>
                        <input type="text" name="name" placeholder="Name" value="">
                    </div>
                    <div class="row">
                        <label for="phone">Phone :<span class="text-danger">*</span></label><br>
                        <input type="text" name="phone" placeholder="Phone Number" value="">
                    </div>
                    <div class="row">
                        <label for="email">Email :</label><br>
                        <input type="text" name="email" placeholder="Email Address" value="" disabled>
                        <span class="text-danger"></span>
                    </div>
                    <div class="row">
                        <label for="email">Date of Birth :</label><br>
                        <input type="date" name="dob" placeholder="Date of Birth" value="">
                        <span class="text-danger"></span>
                    </div>
                   <h4>Password change</h4>
                    <table>
                       <tr><td>Current password (leave blank to leave unchanged)</td></tr>
                       <tr><td> <input type="password" name="current_password" placeholder="Current Password" value="" ></td></tr>
                       <tr><td style="color:red;"><?php echo $currentErr;?></td></tr>
                       <tr><td>New password (leave blank to leave unchanged)</td></tr>
                       <tr><td> <input type="password" name="new_password" placeholder="New Password" value="" ></td></tr>
                       <tr><td style="color:red;"><?php echo $newErr;?></td></tr>
                       <tr><td>Confirm new password</td></tr>
                       <tr><td> <input type="password" name="confirm_password" placeholder="Confirm Password" value="" ></td></tr>
                       <tr><td style="color:red;"><?php echo $confirmErr;?></td></tr>
                    </table>
                   <input type="submit" name="submit" value="Save Changes">
                    </form>-->
                
                   <div class="no_register">
                       <h1>Join Us Now!</h1>
                       <h2>Welcome to Hobbit Hall online book store</h2>
                       <a href="../Sharing/SignUp.php"><input type='button' name='join' value='Sign Up' ></a>
                   </div>
                   
                   
                
                </div>
            </div>
         
           <%@ include file="../Share/footer.html" %>
    </body>
</html>
