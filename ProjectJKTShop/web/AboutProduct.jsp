<%-- 
    Document   : AboutProduct
    Created on : Nov 13, 2018, 3:58:19 PM
    Author     : jatawatsafe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                    <div class="mb-4" style="margin-top: 5px;">
                        <form class="form-inline my-2 my-lg-0" action="SearchItemServlet" method="post">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="shoename">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="material-icons">search</i></button>
                        </form>
                    </div>
                    <p class="lead" >Brand</p>
                    <div class="list-group mb-4">
                        <a href="AboutProductServlet" class="list-group-item">All</a>
                        <a href="SearchItemServlet?brand=nike" class="list-group-item">Nike</a>
                        <a href="SearchItemServlet?brand=adidas" class="list-group-item">Adidas</a>
                        <a href="SearchItemServlet?brand=fila" class="list-group-item">Fila</a>
                        <a href="SearchItemServlet?brand=skechers" class="list-group-item">Skechers</a>
                        <a href="SearchItemServlet?brand=new balance" class="list-group-item">New Balance</a>
                    </div>
                    <p class="lead">Gender</p>
                    <div class="list-group mb-4">
                        <a href="AboutProductServlet" class="list-group-item">ALL</a>
                        <a href="SearchItemServlet?gender=MEN" class="list-group-item">MEN</a>
                        <a href="SearchItemServlet?gender=WOMEN" class="list-group-item">WOMEN</a>
                    </div>
                    <form action="SearchItemServlet" method="post">
                        <p class="lead">Price</p>
                        <select class="custom-select mb-4" name="price" onchange="this.form.submit()">
                            <option>Select Price</option>
                            <option value="1000,2000">1000-2000</option>
                            <option value="2000,3000">2000-3000</option>
                            <option value="3000,4000">3000-4000</option>
                            <option value="4000,5000">4000-5000</option>
                            <option value="5000,6000">5000-6000</option>
                            <option value="6000,100000">more than 6000</option>
                        </select>
                    </form>
                    <form action="SearchItemServlet" method="post">
                    <p class="lead">Color</p>
                        <select class="custom-select mb-4" name="color" onchange="this.form.submit()">
                            <option>Select Color</option>
                            <option value="black">Black</option>
                            <option value="white">White</option>
                            <option value="grey">Grey</option>
                            <option value="navy">Navy</option>
                        </select>
                    </form>
                </div>
                <!--/List.-->
                <!--Product col-md-9 -->
                <div class="col-md-9">
                    <div class="row">
                        <c:forEach items="${shoeList}" var="shoe">
                            <!-- 1 card-->
                            <div class="col-lg-4 col-md-4 col-sm-6 portfolio-item">
                                <div class="card h-100">
                                    <c:set var="shoeid" value="${shoe.shoeid}" />
                                    <img class="card-img-top" src="images/shoes/${fn:substringBefore(shoeid, "SH")}_01.jpg" alt="${fn:substringBefore(shoeid, "SH")}_01|${shoe.shoename}">
                                    <div class="card-body">
                                        <h5 class="card-title">
                                            <a href="ProductDetailsServlet?shoeId=${shoe.shoeid}">${shoe.shoename}</a>
                                        </h5>
                                        <p class="card-text">${shoe.price} THB</p>
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
