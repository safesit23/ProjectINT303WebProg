<%-- 
    Document   : Payment.jsp
    Created on : Nov 23, 2018, 7:28:04 PM
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
        <div class="container jktcontent" style="min-height: 650px; padding-bottom: 50px;">
            <div class="row">
                <div class="col-md-3 shadow pt-4" style="background-color:white; height: 210px;">
                    <h5>Total (THB)</h5>
                    <h1 class="mt-4" style="text-align: center; font-size: 3em">${sessionScope.cart.totalNetPrice}</h1>
                </div>
                <div class="col-md-8 shadow offset-1 pt-2" style="background-color: #EEEEEE;">
                    <form action="PaymentServlet" method="post">
                        <div class="mt-3">

                            <h4>Address</h4>
                            <div class="custom-control custom-radio">
                                <input id="MyAddress" name="addr" type="radio" class="custom-control-input" onclick="changeAddr('myAddress')" required>
                                <label class="custom-control-label" for="MyAddress">My Address</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input id="NewAddress" name="addr" type="radio" class="custom-control-input" onclick="changeAddr('newAddress')">
                                <label class="custom-control-label" for="NewAddress">New Address</label>
                            </div>
                            <div><!--Use Javascript to Show-->
                                <div id="myAddress" class="mt-3" hidden><!--My Addr-->
                                    <div class="mb-3">
                                        <label>Address <span class="text-muted"></span></label>
                                        <input type="text" class="form-control" name="address" value="${account.address}" disabled>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5 mb-3">
                                            <label>Province</label>
                                            <input type="text" class="form-control" name="province" value="${account.province}" disabled>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label>Province</label>
                                            <input type="text" class="form-control" name="country" value="${account.country}" disabled>
                                        </div>
                                        <div class="col-md-3 mb-3">
                                            <label>Postal Code</label>
                                            <input type="text" class="form-control" name="postalCode" value="${account.postalcode}" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div id="newAddress" class="mt-3" hidden><!--New Addr-->
                                    <div class="mb-3">
                                        <label>Address <span class="text-muted"></span></label>
                                        <input type="text" class="form-control" name="address">
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
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div>
                            <h4>Payment</h4>
                            <div class="d-block my-3">
                                <div class="custom-control custom-radio">
                                    <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                                    <label class="custom-control-label" for="credit">Credit card</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                                    <label class="custom-control-label" for="debit">Debit card</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                                    <label class="custom-control-label" for="paypal">PayPal</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="cc-name">Name on card</label>
                                    <input type="text" class="form-control" id="cc-name" required>
                                    <small class="text-muted">Full name as displayed on card</small>

                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="cc-number">Credit card number</label>
                                    <input type="text" class="form-control" id="cc-number" required>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 mb-3">
                                    <label for="cc-expiration">Expiration</label>
                                    <input type="text" class="form-control" id="cc-expiration" required>


                                </div>
                                <div class="col-md-3 mb-3">
                                    <label for="cc-cvv">CVV</label>
                                    <input type="text" class="form-control" id="cc-cvv"  required>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <hr>
                            <input type="submit" class="btn btn-primary btn-lg btn-block" >Payment
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            function changeAddr(type) {
                if (type === 'myAddress') {
                    document.getElementById('myAddress').hidden = false;
                    document.getElementById('newAddress').hidden = true;
                } else {
                    document.getElementById('myAddress').hidden = true;
                    document.getElementById('newAddress').hidden = false;
                }
            }
        </script>                            

    </body>
</html>
