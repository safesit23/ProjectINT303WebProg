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
        <link href="css/css_jktshop.css" rel="stylesheet" >
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
                    <div class="list-group" style="margin-bottom: 10px">
                        <a href="#" class="list-group-item" onclick="">Nike</a>
                        <a href="#" class="list-group-item" onclick="">Adidas</a>
                        <a href="#" class="list-group-item" onclick="">Fila</a>
                        <a href="#" class="list-group-item" onclick="">Skechers</a>
                        <a href="#" class="list-group-item" onclick="">New Balance</a>
                    </div>
                    <p class="lead">Gender</p>
                    <div class="list-group">
                        <a href="#" class="list-group-item" onclick="">1</a>
                        <a href="#" class="list-group-item" onclick="">2</a>
                        <a href="#" class="list-group-item" onclick="">3</a>
                        <a href="#" class="list-group-item" onclick="">4</a>
                    </div>
                </div>
                <!--/List.-->
                <!--Product col-md-9 -->
                <div class="col-md-9">
                    <div class="row">
                        <%--<c:forEach items="${shoeList}" var="product" varStatus="vs">--%>
                        <!-- 1 card-->
                        <div class="col-lg-4 col-md-4 col-sm-6 portfolio-item">
                            <div class="card h-100">
                                <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="#">Project One</a>
                                    </h4>
                                    <p class="card-text">About Product</p>
                                </div>
                            </div>
                        </div>
                        <!-- /end 1 card-->
                        <%--</c:forEach>--%>
                        
                    </div> <!--End Row Product-->
                </div> <!--end col md 9-->
            </div> <!-- /.row -->
        </div> <!--End Container-->
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
