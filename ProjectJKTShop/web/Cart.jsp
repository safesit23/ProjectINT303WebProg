<%-- 
    Document   : Cart
    Created on : Nov 15, 2018, 2:08:57 PM
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
            <c:choose>
                <c:when test="${cart==null||cart.totalQuantity==0}">
                    <div class="alert alert-danger" role="alert">
                        ไม่มีสินค้า
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="row">
                        <div class="col-md-12" style="margin-top: 50px;">
                            <h1 class="d-flex justify-content-between align-items-center mb-3">
                                <span class="text-muted">Your cart</span>
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
                                            <a href="AddItemServlet?shoeId=${line.shoe.shoeid}&shoeSize=${line.shoeSize}&page=cart.jsp" class="mr-2"><i class="material-icons">add_shopping_cart</i></a>
                                            <a href="RemoveItemServlet?shoeId=${line.shoe.shoeid}&shoeSize=${line.shoeSize}&page=cart.jsp" class="mr-4"><i class="material-icons">remove_shopping_cart</i></a>
                                            <span class="text-muted">${line.quantity} x ${line.shoe.price} THB</span>
                                        </span>
                                    </li>
                                </c:forEach>
                                <!--                                <li class="list-group-item d-flex justify-content-between bg-light">
                                                                    <div class="text-success">
                                                                        <h6 class="my-0">Promo code</h6>
                                                                        <small>EXAMPLECODE</small>
                                                                    </div>
                                                                    <span class="text-success">-$5</span>
                                                                </li>-->
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>Total (THB)</span>
                                    <strong>${sessionScope.cart.totalPrice}</strong>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 offset-9">
                            <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
