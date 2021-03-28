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
        <link rel="icon" href="<%=request.getContextPath()%>/Client/Share/images/logoBook.png"/>
        <link href="<%=request.getContextPath()%>/Client/User/userProfile.css" rel="stylesheet">
    </head>
    <body>
        <%@ include file="../Share/header.jsp" %>
        <div class="user-profile">
            <div class="col-1-4">
                <h1>My Account</h1>
                <table>
                    <tr>
                        <td style="background-color: white;border-left: 3px solid blue; "><a href="#" style="color:black;"><i class="fa fa-user" aria-hidden="true" style="color:black"></i>Account Details</a></td>
                    </tr>
                    <tr>
                        <td><a href="#"><i class="fa fa-calendar-check-o" aria-hidden="true"></i>Orders</a></td>
                    </tr>
                    <tr>
                    <form action="/HobbitHall/Logout" action="get">
                        <td><i class="fa fa-sign-out" aria-hidden="true"></i><input type="submit" name="submit" value="Logout" id="logout-button"></td>
                    </form> 
                    </tr>

                </table>
            </div>

            <div class="col-3-4">
                <% String successMessage=(String)request.getAttribute("successMessage"); 
                if(successMessage!=null){ %>
                <div class="responceMessage" style="color:green">${successMessage}</div>
                <% } %>
                 <% String errorMessage=(String)request.getAttribute("errorMessage"); 
                if(errorMessage!=null){ %>
                <div class="responceMessage" style="color:red;">${errorMessage}</div>
                <% } %>

                <% if (customer.getName() != null) { %>

                <form action="/HobbitHall/UpdateUserProfile" method="post">
                    <div class="row">
                        <label>Name :<span class="text-danger">*</span></label><br>
                        <input type="text" name="name" placeholder="Name" value="${customer.name}" required>
                    </div>
                    <div class="row">
                        <label for="phone">Phone :<span class="text-danger">*</span></label><br>
                        <input type="text" name="phone" placeholder="Phone Number" value="${customer.contactNumber}" required>
                    </div>
                    <div class="row">
                        <label for="email">Email :</label><br>
                        <input type="text" name="email" placeholder="Email Address" value="${customer.email}" disabled>
                        <input type="hidden" name="hidden_email" placeholder="Email Address" value="${customer.email}">
                        <span class="text-danger"></span>
                    </div>
                        <div class="row">
                        <label for="address">Address :</label><br>
                        <input type="text" name="address" placeholder="Address" value="${customer.address}" required>
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
                    <input type="hidden" name="hidden_password" placeholder="Current Password" value="${customer.password}" >
                    <input type="submit" name="submit" value="Save Changes" id="save">
                </form>
                <%} else { %>
                <div class="no_register">
                    <h1>Join Us Now!</h1>
                    <h2>Welcome to Hobbit Hall online book store</h2>
                    <a href="../Login/login.jsp"><input type='button' name='join' value='Sign Up' ></a>
                </div>

                <% }%>

            </div>
        </div>

        <%@ include file="../Share/footer.html" %>
    </body>
</html>
