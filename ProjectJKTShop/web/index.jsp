<%-- 
    Document   : index
    Created on : Nov 9, 2018, 1:10:59 PM
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
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="images/carousel/banner01.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/carousel/banner02.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/carousel/banner03.jpg" alt="Third slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/carousel/banner04.jpg" alt="Four slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/carousel/banner05.jpg" alt="Fifth slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/carousel/banner06.jpg" alt="Sixth slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/carousel/banner07.jpg" alt="Sixth slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <div class="container jktcontent">
            <h1>What News</h1>
            <div class="row">
                <div class="col-md-3">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="images/content/pm1.png" alt="Promote">
                        <div class="card-body">
                            <p class="card-text text-center">CODE: NEW100<br> เมื่อมียอดสั่งซื้อ 11000 ขึ้นไป</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 offset-1">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="images/content/pm1.png" alt="Promote">
                        <div class="card-body">
                            <p class="card-text text-center">CODE: NEW100<br> เมื่อมียอดสั่งซื้อ 11000 ขึ้นไป</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 offset-1">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="images/content/pm1.png" alt="Promote">
                        <div class="card-body">
                            <p class="card-text text-center">CODE: NEW100<br> เมื่อมียอดสั่งซื้อ 11000 ขึ้นไป</p>
                        </div>
                    </div>
                </div>
            </div>



            <div class="row mt-3">
                <c:if test="${account!=null}">
                    <c:choose>
                        <c:when test="${account.sex=='M'}">
                            <div class="col-md-3">
                                <div class="card" style="width: 18rem;">
                                    <img class="card-img-top" src="images/content/pm1.png" alt="Promote">
                                    <div class="card-body">
                                        <p class="card-text text-center">MALE</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 offset-1">
                                <div class="card" style="width: 18rem;">
                                    <img class="card-img-top" src="images/content/pm1.png" alt="Promote">
                                    <div class="card-body">
                                        <p class="card-text text-center">MALE</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 offset-1">
                                <div class="card" style="width: 18rem;">
                                    <img class="card-img-top" src="images/content/pm1.png" alt="Promote">
                                    <div class="card-body">
                                        <p class="card-text text-center">MALE</p>
                                    </div>
                                </div>
                            </div>

                        </c:when>
                        <c:otherwise>
                            <div class="col-md-3">
                                <div class="card" style="width: 18rem;">
                                    <img class="card-img-top" src="images/content/pm1.png" alt="Promote">
                                    <div class="card-body">
                                        <p class="card-text text-center">FEMALE</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 offset-1">
                                <div class="card" style="width: 18rem;">
                                    <img class="card-img-top" src="images/content/pm1.png" alt="Promote">
                                    <div class="card-body">
                                        <p class="card-text text-center">FEMALE</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 offset-1">
                                <div class="card" style="width: 18rem;">
                                    <img class="card-img-top" src="images/content/pm1.png" alt="Promote">
                                    <div class="card-body">
                                        <p class="card-text text-center">FEMALE</p>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </div>
        </div><!--Container-->
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>