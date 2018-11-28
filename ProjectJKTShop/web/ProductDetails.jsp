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
            <div class="row">
                <div class="col-md-4" style="color: yellow; height: 100px;">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                        </ol>
                        <div class="carousel-inner">
                            <c:forEach begin = "1" end = "4" var="number">
                                <div class="carousel-item <c:if test="${number==1}">active</c:if>">
                                    <img class="d-block w-100" src="images/shoes/${shoepic}_0${number}.jpg" alt="${shoepic}_0${number}">
                                </div>
                            </c:forEach>

                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div><!--/Carousel-->
                </div><!--col-md-4-->
                
                <div class="col-md-6 offset-1">
                    <h1>${shoe.shoename}</h1>
                    <div class="row mt-4">
                        <div class="col-md-5 offset-1">
                            <h5>ID: ${shoe.shoeid}</h5>
                            <p>TYPE: ${shoe.shoetype}</p>
                            <p>Brand: ${shoe.brand}</p>
                            <form action="AddItemServlet" method="post" class="form-inline">
                                <label class="my-1 mr-2" for="inlineFormCustomSelectPref">Size:</label>
                                <select name="shoeSize" class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                                    <c:forEach items="${shoeSize}" var="size">
                                        <option value="${size}">US ${size}</option>
                                    </c:forEach>
                                </select>
                                <input type="hidden" name="from" value="${pageContext.request.requestURI}">
                                <button type="submit" class="btn btn-primary" name="shoeId" value="${shoe.shoeid}">Buy</button>
                            </form>
                        </div>
                        <div class="col-md-5">
                            <p>Color: ${shoe.color}</p>
                            <p>Gender: ${shoe.shoetype2}</p>
                            <p>Price: ${shoe.price}</p>
                        </div>
                    </div>
                </div>
            </div><!--/Row-->

        </div><!--/Container-->
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
