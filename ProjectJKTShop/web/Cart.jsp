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
        <div class="container jktcontent" style="min-height: 550px;">
            <h1>Cart</h1>
            <c:choose>
                <c:when test="${cart==null||cart.totalQuantity==0}">
                    <div class="alert alert-danger" role="alert">
                        ไม่มีสินค้า
                    </div>
                    </c:when>
                    <c:otherwise>
                        <div class="row">
                        <div class="col-md-9">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Shoe Name</th>
                                        <th scope="col">Size</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total Price</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${sessionScope.cart.cartDetails}" var="line" varStatus="vs">
                                        <tr>
                                            <th scope="row">${vs.count}</th>
                                            <td>${line.shoe.shoename}</td>
                                            <td>${line.shoeSize}</td>
                                            <td>${line.quantity}</td>
                                            <td>${line.totalPrice}</td>
                                            <td>
                                                <a href="AddItemServlet?shoeId=${line.shoe.shoeid}&shoeSize=${line.shoeSize}&page=cart.jsp"><i class="material-icons">add_shopping_cart</i></a>
                                                <span style="padding: 0px 5px;"></span>
                                                <a href="RemoveItemServlet?shoeId=${line.shoe.shoeid}&shoeSize=${line.shoeSize}&page=cart.jsp"><i class="material-icons">remove_shopping_cart</i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-3" style="background-color: #ffc107;height:100px ; width: auto">
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
