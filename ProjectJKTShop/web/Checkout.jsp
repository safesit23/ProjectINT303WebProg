<%-- 
    Document   : Checkout
    Created on : Nov 16, 2018, 11:37:32 AM
    Author     : jatawatsafe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <div class="col-md-12" style="margin-top: 50px;">
                    <h1 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">Checkout</span>
                        <span class="badge badge-secondary badge-pill">${cart.totalQuantity}</span>
                    </h1>
                    <ul class="list-group mb-3">
                        <c:forEach items="${sessionScope.cart.cartDetails}" var="line" varStatus="vs">
                            <li class="list-group-item d-flex justify-content-between lh-condensed">
                                <div>
                                    <h6 class="my-0">${line.shoe.shoename}</h6>
                                    <small class="text-muted">Size: US${line.shoeSize}</small>
                                </div>
                                <span>
                                    <span class="text-muted">${line.quantity} x ${line.shoe.price} THB</span>
                                </span>
                            </li>
                        </c:forEach>
                        <c:if test="${voucher!=null}">
                            <li class="list-group-item d-flex justify-content-between bg-light">
                                <div class="text-success">
                                    <h6 class="my-0">Promo code</h6>
                                    <small>${voucher.voucherid}</small>
                                </div>
                                <span class="text-success">-THB ${voucher.vouchervalue}</span>
                            </li>
                        </c:if>

                        <li class="list-group-item d-flex justify-content-between">
                            <span>Total (THB)</span>
                            <strong>${sessionScope.cart.totalPrice}</strong>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <form class="card p-2">
                        <div class="input-group">
                            <input type="text" class="form-control" 
                                   placeholder="<c:choose><c:when test="${voucher!=null}">${voucher.voucherid}</c:when><c:otherwise>Promocode</c:otherwise></c:choose>" 
                                   name="voucherId" 
                                   <c:if test="${voucher!=null}">disabled</c:if>
                            >
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary" <c:if test="${voucher!=null}">disabled</c:if>>Redeem</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-3 offset-6">
                    <a href="#"><button class="btn btn-primary btn-lg btn-block" type="submit">Payment</button></a>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
