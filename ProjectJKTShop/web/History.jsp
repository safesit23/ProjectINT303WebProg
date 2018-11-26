<%-- 
    Document   : History
    Created on : Nov 26, 2018, 5:02:37 PM
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
            <h1>History</h1>
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">OrderId</th>
                        <th scope="col">OrderDate</th>
                        <th scope="col">Shipped To</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${history}" var="order" varStatus="vs">
                    <tr>
                        <th scope="row">${vs.count}</th>
                        <td>${order.orderid}</td>
                        <td>${order.orderdate}</td>
                        <td>${order.shipto}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div><!--/Container-->
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
