<%-- 
    Document   : ProductDetails
    Created on : Nov 15, 2018, 5:58:05 PM
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
        <div class="container jktcontent">
            <h1>Product Details: ${shoe.shoeid}</h1>
            <c:forEach begin = "1" end = "5" var="number">
            <img src="images/shoes/${shoepic}_0${number}.jpg" alt="${shoepic}_0${number}">
            </c:forEach>
            <form action="AddItemServlet" method="post">
                <select name="shoeSize">
                    <c:forEach items="${shoeSize}" var="size">
                        <option value="${size}">US ${size}</option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-primary" name="shoeId" value="${shoe.shoeid}">Buy</button>
            </form>
            <div style="height: 300px;"></div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
