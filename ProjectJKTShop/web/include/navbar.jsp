<%-- 
    Document   : Navbar
    Created on : Nov 9, 2018, 1:37:08 AM
    Author     : jatawatsafe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    legend .active{
        color: red;
    }
</style>
<script>
    $(function () {
        $(document).scroll(function () {
            var $nav = $(".navbar-fixed-top");
            $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
        });
    });

    $(function () {
        $(document).scroll(function () {
            var $nav = $(".navbar-brand");
            $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
            if ($(this).scrollTop() > $nav.height()) {
                document.getElementById("logoSR").innerHTML = '<img src="images/content/logo_2.svg" style="margin-top: -10px; margin-right: -15px; width: 45px;" alt="logo">';
            } else {
                document.getElementById("logoSR").innerHTML = '<img src="images/content/logo_2.svg" style="margin-top: -10px; margin-right: -15px; width: 45px;" alt="logo">';
            }
        });
    });
</script>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="container-fluid">
        <div>
            <a id="logoSR" class="navbar-brand" href="index.jsp"><img src="images/content/logo_2.svg" style="margin-top: -10px; margin-right: -15px; width: 45px;" alt="logo"></a>
            <a class="navbar-brand" href="index.jsp">JKT SHOP</a>
        </div>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <ul class="navbar-nav">
                <li class="nav-item <c:if test="${AboutProductPage!=null}">active</c:if>">
                    <a class="nav-link" href="AboutProductServlet">Products</a>
                </li>
                <li class="nav-item <c:if test="${AboutUsPage!=null}">active</c:if>">
                    <a class="nav-link" href="AboutUsServlet">About Us</a>
                </li>
            </ul>
        </div>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <ul class="navbar-nav ml-auto">
                <c:choose>
                    <c:when test="${account==null}">
                        <li class="nav-item">
                            <a class="nav-link" href="LoginServlet?from=${pageContext.request.requestURI}"><i class="material-icons md-light">person</i>Register/Login</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons md-light">person</i>${account.nickname}</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="AccountServlet">Account</a>
                                <a class="dropdown-item" href="HistoryServlet">History</a>
                                <a class="dropdown-item" href="LogoutServlet">Logout</a>
                            </div>
                        </li> 
                    </c:otherwise>
                </c:choose>
                <li class="nav-item <c:if test="${CartPage!=null}">active</c:if>">
                    <a class="nav-link" href="CartServlet"><i class="material-icons md-light">shopping_cart</i>Cart
                        <c:if test="${cart!=null}">(${cart.totalQuantity})</c:if>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>