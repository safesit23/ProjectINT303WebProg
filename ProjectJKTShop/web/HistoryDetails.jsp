<%-- 
    Document   : HistoryDetails
    Created on : Nov 29, 2018, 2:38:47 AM
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
            <h1 class="mb-3">OrderNo: ${orderid}</h1>
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Shoe</th>
                        <th scope="col">Size</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${orderDetails}" var="orderDetail" varStatus="vs">
                        <tr>
                            <th scope="row">${vs.count}</th>
                            <td>${orderDetail.shoe.shoename}</td>
                            <td>${orderDetail.orderDetailPK.shoesize}</td>
                            <td>${orderDetail.quantity}</td>
                            <td>${orderDetail.price}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="row">
                <div class="col-md-2">
                    <a href="HistoryServlet"><button class="btn btn-outline-secondary btn-lg btn-block" role="button" aria-pressed="true">Back</button></a>
                </div>
            </div>
        </div><!--/Container-->
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
