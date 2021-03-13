<%-- 
    Document   : Payment
    Created on : Mar 12, 2021, 5:20:27 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="Payment.css" rel="stylesheet"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="Payment.js"></script>
        <title>JSP Page</title>
    </head>
    <%@include file="../Share/header.html" %>
    <body>
        <div class="row justify-content-start">
            <div class="col-md-7">
                <div class="row justify-content-start">
                    <h5>My Information</h5>
                </div>
                <div class="row justify-content-start">
                    <div class="col-md-6">
                        <label class="form-label col-form-label-sm">Email</label>
                        <input type="email" class="form-control">
                    </div>    
                </div>
                <div class="row justify-content-start">
                    <h5>Delivery Information</h5>
                </div>
                <div class="row justify-content-start">
                    <div class="col-md-2">
                        <label class="form-label col-form-label-sm">Title</label>
                        <select class="form-select mb-3">
                            <option>Mr</option>
                            <option>Mrs</option>
                            <option>Miss</option>
                        </select>
                    </div>
                </div>
                <div class="row justify-content-start">
                    <div class="col-md-5">
                        <label class="form-label col-form-label-sm">First Name</label>
                        <input type="text" class="form-control">
                    </div> 
                    <div class="col-md-5">
                        <label class="form-label col-form-label-sm">Last Name</label>
                        <input type="text" class="form-control">
                    </div>    
                </div>
                <div class="row justify-content-start">
                    <div class="col-md-10">
                        <label class="form-label col-form-label-sm">Address</label>
                        <input type="text" class="form-control">
                    </div>               
                </div>
                <div class="row justify-content-start">
                    <div class="col-md-2">
                        <label class="form-label col-form-label-sm">Postcode</label>
                        <input type="text" class="form-control">
                    </div> 
                    <div class="col-md-4">
                        <label class="form-label col-form-label-sm">City</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label col-form-label-sm">State</label>
                        <select class="form-select mb-3">
                            <option>Johor</option>
                            <option>Kedah</option>
                            <option>Kelantan</option>
                            <option>Malacca</option>
                            <option>Negeri Sembilan</option>
                            <option>Pahang</option>
                            <option>Penang</option>
                            <option>Perak</option>
                            <option>Perlis</option>
                            <option>Sabah</option>
                            <option>Sarawak</option>
                            <option>Selangor</option>
                            <option>Terrengganu</option>
                        </select>
                    </div>
                </div>
                <div class="row justify-content-start">
                    <div class="col-md-10">
                        <label class="form-label col-form-label-sm">Contact Number</label>
                        <input type="text" class="form-control">
                    </div>               
                </div>
                <div class="row justify-content-start">
                    <div class="col-md-10">
                        <hr class="mb-3">
                    </div>
                </div>
                <div class="row justify-content-start">
                    <h5>Payment</h5>
                </div>
                <div class="row justify-content-start" style="padding-left: 11px;">
                    <div class="form-check">
                        <input class="form-check-input" type="radio"/>
                        <label class="form-check-label">Debit Card</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio"/>
                        <label class="form-check-label">Credit Card</label>
                    </div>
                </div>
                <div class="row justify-content-start">
                    <div class="col-md-5">
                        <label class="form-label col-form-label-sm">Name On Card</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="col-md-5">
                        <label class="form-label col-form-label-sm">Card Number</label>
                        <input type="text" class="form-control">
                    </div>  
                </div>
                <div class="row justify-content-start">
                    <div class="col-md-5">
                        <label class="form-label col-form-label-sm">Expiration</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="col-md-5">
                        <label class="form-label col-form-label-sm">CVV</label>
                        <input type="text" class="form-control">
                    </div>  
                </div>
                <div class="row justify-content-start">
                    <div class="col-md-10">
                        <hr class="mb-3">
                    </div>
                </div>
                <div class="row justify-content-start">
                    <div class="col-md-10">
                        <button class="btn btn-primary col-md-12" type="submit">Place Order</button>
                    </div>
                </div>         
            </div>
            <div class="col-md-5" style="background-color: white;">
                <div class="row overflow-hidden" id="productInCart">
                    <div class="row justify-content-start">
                        <div class="col-2" id="productImage"><img src="testing1.jpg" /><span class="badge badge-secondary badge-pill bg-warning text-dark">3</span></div>
                        <div class="col-5 pt-3 bookName">Macmillan-Uk<br/>Hidden in Plain Sight</div>
                        <div class="col-5 text-end" style="padding-top: 30px;">RM 30.00</div>
                    </div>
                    <div class="row justify-content-start">
                        <div class="col-2" id="productImage"><img src="testing1.jpg" /><span class="badge badge-secondary badge-pill bg-warning text-dark">3</span></div>
                        <div class="col-5 pt-3 bookName">Macmillan-Uk<br/>Hidden in Plain Sight</div>
                        <div class="col-5 text-end" style="padding-top: 30px;">RM 30.00</div>
                    </div>
                    <div class="row justify-content-start">
                        <div class="col-2" id="productImage"><img src="testing1.jpg" /><span class="badge badge-secondary badge-pill bg-warning text-dark">3</span></div>
                        <div class="col-5 pt-3 bookName">Macmillan-Uk<br/>Hidden in Plain Sight</div>
                        <div class="col-5 text-end" style="padding-top: 30px;">RM 30.00</div>
                    </div>
                </div>
                <div class="row justify-content-start" style="margin-bottom: 0px;">
                    <div class="col-md-12">
                        <hr class="mb-3">
                    </div>
                </div>
                <div class="row" id="calculation" style="margin-top: 0px;">
                    <div class="row justify-content-start">
                        <div class="col-md-5">Subtotal</div>
                        <div class="col-md-7 text-end">RM 90.00</div>
                    </div>
                    <div class="row justify-content-start">
                        <div class="col-md-5">Discount</div>
                        <div class="col-md-7 text-end">(10.00)</div>
                    </div>
                    <div class="row justify-content-start">
                        <div class="col-md-5">Delivery</div>
                        <div class="col-md-7 text-end">RM 20.00</div>
                    </div>
                    <div class="row justify-content-start">
                        <div class="col-md-12">
                            <hr class="mb-3">
                        </div>
                    </div>
                    <div class="row justify-content-start">
                        <div class="col-md-5">Total</div>
                        <div class="col-md-7 text-end">RM 100.00</div>
                    </div>
                    <div class="row">
                    
                    </div>
                </div>
            </div>
        </div>
    </body>
    <%@include file="../Share/footer.html" %>
</html>
