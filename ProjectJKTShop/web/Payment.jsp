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
                            <!--TypeOfAddr: My Addr-->
                            <div class="custom-control custom-radio">
                                <input type="radio" id="MyAddress" name="TypeOfAddr" value="MyAddress"  class="custom-control-input" onclick="changeAddr('myAddress')" checked>
                                <label class="custom-control-label" for="MyAddress">My Address</label>
                            </div>
                            <!--Use Javascript to Show-->
                            <div id="myAddress" class="mt-2 mb-2" hidden>
                                <span>Address: ${account.address} , ${account.province} , ${account.country} ${account.postalcode}</span>
                            </div>
                            
                            
                            
                            <!--TypeOfAddr: NewAddress-->
                            <div class="custom-control custom-radio">
                                <input type="radio" id="NewAddress" name="TypeOfAddr" value="NewAddress" class="custom-control-input" onclick="changeAddr('newAddress')" checked>
                                <label class="custom-control-label" for="NewAddress">New Address</label>
                            </div>
                            <!--Use Javascript to Show-->
                            <div id="newAddress" class="mt-2" hidden><!--New Addr-->
                                <div class="mb-2">
                                    <label>Address <span class="text-muted"></span></label>
                                    <input type="text" id="address" class="form-control" name="address" required>
                                </div>
                                <div class="row">
                                    <div class="col-md-5 mb-2">
                                        <label>Province</label>
                                        <input type="text" id="province" class="form-control" name="province" required>
                                    </div>
                                    <div class="col-md-4 mb-2">
                                        <label>Province</label>
                                        <input type="text" id="country" class="form-control" name="country" required>
                                    </div>
                                    <div class="col-md-3 mb-2">
                                        <label>Postal Code</label>
                                        <input type="text" id="postalCode" class="form-control" name="postalCode" required>
                                    </div>
                                </div>
                            </div>
                            <!--/close script--->
                            
                            <hr>
                            <h4>Payment</h4>
                            <div class="d-block my-3">
                                <div class="custom-control custom-radio">
                                    <input id="credit" name="paymentMethod" value="Credit Card" type="radio" class="custom-control-input" required>
                                    <label class="custom-control-label" for="credit">Credit card</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input id="debit" name="paymentMethod" value="Debit Card" type="radio" class="custom-control-input" required>
                                    <label class="custom-control-label" for="debit">Debit card</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="cc-name">Name on card</label>
                                    <input type="text" class="form-control" id="cc-name" name="cc-name" required>
                                    <small class="text-muted">Full name as displayed on card</small>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="cc-number">Credit card number</label>
                                    <input type="text" class="form-control" id="cc-number" name="cc-number" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 mb-3">
                                    <label for="cc-expiration">Expiration</label>
                                    <input type="text" class="form-control" id="cc-expiration" name="cc-expiration" required>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label for="cc-cvv">CVV</label>
                                    <input type="text" class="form-control" id="cc-cvv"  name="cc-cvv" required>
                                </div>
                            </div>
                            <button type="submit" class="mb-3 btn btn-primary btn-lg btn-block">Payment</button>
                        </div>  
                    </form>
                </div><!--col-md-8-->
            </div>
        </div>
        <script>
            function changeAddr(type) {
                if (type === 'myAddress') {
                    document.getElementById('myAddress').hidden = false;
                    document.getElementById('address').value = 'address';
                    document.getElementById('province').value = 'province';
                    document.getElementById('country').value = 'country';
                    document.getElementById('postalCode').value = 'postalCode';
                    document.getElementById('newAddress').hidden = true;
                } else {
                    document.getElementById('myAddress').hidden = true;
                    document.getElementById('newAddress').hidden = false;
                }
            }
        </script>                            

    </body>
</html>
