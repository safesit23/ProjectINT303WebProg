<%-- 
    Document   : AboutProduct
    Created on : Nov 13, 2018, 3:58:19 PM
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
        <style>
            .portfolio-item {
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="include/navbar.jsp" />
        <div class="container jktcontent">
            <h1>SHOPPING PAGE</h1>
            <div class="row">
                <!--List col-md-3 -->
                <div class="col-md-3">
                    <p class="lead" style="margin-top: 5px;">Brand</p>
                    <div class="list-group mb-4">
                        <a href="AboutProductServlet" class="list-group-item">All</a>
                        <a href="SearchItemServlet?brand=nike" class="list-group-item">Nike</a>
                        <a href="SearchItemServlet?brand=adidas" class="list-group-item">Adidas</a>
                        <a href="SearchItemServlet?brand=fila" class="list-group-item">Fila</a>
                        <a href="SearchItemServlet?brand=skechers" class="list-group-item">Skechers</a>
                        <a href="SearchItemServlet?brand=new balance" class="list-group-item">New Balance</a>
                    </div>
                    <p class="lead">Gender</p>
                    <div class="list-group">
                        <a href="AboutProductServlet" class="list-group-item">ALL</a>
                        <a href="SearchItemServlet?gender=MEN" class="list-group-item">MEN</a>
                        <a href="SearchItemServlet?gender=WOMEN" class="list-group-item">WOMEN</a>
                    </div>
                </div>
                <!--/List.-->
                <!--Product col-md-9 -->
                <div class="col-md-9">
                    <div class="row">
                        <c:forEach items="${shoeList}" var="shoe">
                            <!-- 1 card-->
                            <div class="col-lg-4 col-md-4 col-sm-6 portfolio-item">
                                <div class="card h-100">
                                    <img class="card-img-top" src="images/shoes/demo.jpg" alt="${shoe.shoename}">
                                    <div class="card-body">
                                        <h4 class="card-title">
                                            <a href="ProductDetailsServlet?shoeId=${shoe.shoeid}">${shoe.shoename}</a>
                                        </h4>
                                        <p class="card-text">About Product</p>
                                    </div>
                                </div>
                            </div>
                            <!-- /end 1 card-->
                        </c:forEach>

                    </div> <!--End Row Product-->
                </div> <!--end col md 9-->
            </div> <!-- /.row -->
        </div> <!--End Container-->
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
