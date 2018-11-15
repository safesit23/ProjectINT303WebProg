<%-- 
    Document   : Navbar
    Created on : Nov 9, 2018, 1:37:08 AM
    Author     : jatawatsafe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">JKT SHOP</a>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="AboutProductServlet">Products<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About Us</a>
                </li>
            </ul>
        </div>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <ul class="navbar-nav ml-auto">
                <c:choose>
                    <c:when test="${user==null}">
                        <li class="nav-item">
                            <a class="nav-link" href="Login.jsp"><i class="material-icons md-light">person</i>Register/Login</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="Login.jsp"><i class="material-icons md-light">person</i>Name</a>
                        </li> 
                    </c:otherwise>
                </c:choose>
                <li class="nav-item">
                    <a class="nav-link" href="Login.jsp"><i class="material-icons md-light">shopping_cart</i>Cart()</a>
                </li>
            </ul>
        </div>
    </div>
</nav>