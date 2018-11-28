<%-- 
    Document   : login
    Created on : Nov 9, 2018, 1:15:06 AM
    Author     : jatawatsafe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include/header.jsp" />
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    </head>
    <body>
        <jsp:include page="include/navbar.jsp"/>
        <div class="container jktcontent" style="min-height: 550px;">
            <div class="row">
                <div class="col-md-8 offset-md-2">


                    <h1 class="mb-4">Register</h1>
                    <form class="needs-validation" action="RegisterServlet" method="post">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label>First name<sup> *</sup></label>
                                <input type="text" class="form-control" name="firstName" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label>Last name<sup> *</sup></label>
                                <input type="text" class="form-control" name="lastName" required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label>Nickname<sup> *</sup></label>
                                <input type="text" class="form-control" name="nickname" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label>Birth of Date <sup> *</sup></label>
                                <div>
                                    <input class="form-control" type="date"  name="dob" required>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label>Telephone<sup> *</sup></label>
                                <input type="tel" class="form-control" name="phone" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label>Gender<sup> *</sup></label>
                                <div>
                                    <input class="ml-3 mr-3" type="radio"  name="sex" value="M" required>Male
                                    <input class="ml-3 mr-3" type="radio"  name="sex" value="F" required>Female
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label>Username (Email)<sup> *</sup></label>
                            <input type="email" class="form-control" name="username" placeholder="you@example.com" required>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label>Password<sup> *</sup></label>
                                <input type="password" class="form-control" name="password" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label>Confirm Password<sup> *</sup></label>
                                <input type="password" class="form-control" name="confirmPassword" required>
                            </div>
                        </div>

                        <hr>
                        <div class="mb-3">
                            <label>Address <span class="text-muted">(Optional)</span></label>
                            <input type="text" class="form-control" name="address" placeholder="Apartment or suite">
                        </div>
                        <div class="row">
                            <div class="col-md-5 mb-3">
                                <label>Province</label>
                                <input type="text" class="form-control" name="province">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label>Province</label>
                                <input type="text" class="form-control" name="country">
                            </div>
                            <div class="col-md-3 mb-3">
                                <label>Postal Code</label>
                                <input type="text" class="form-control" name="postalCode">
                            </div>
                        </div>
                        <button type="submit" class="mt-4 mb-4 btn btn-primary btn-lg btn-block">Sign Up</button>
                    </form>

                </div><!--col-md-8-->
            </div><!--Row-->
        </div><!--Container-->
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
