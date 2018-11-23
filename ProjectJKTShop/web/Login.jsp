<%-- 
    Document   : Login
    Created on : Nov 15, 2018, 1:54:45 PM
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
        <link href="css/css_login.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="include/navbar.jsp"/>
        <div class="container jktcontent" style="min-height: 650px;">
            <form class="form-signin" action="LoginServlet" method="post">
                <div class="justify-content-md-center jktform">
                    <img class="mb-4" src="images/content/logo_1.svg" alt="logo" width="72" height="72">
                </div>
                <div class="justify-content-md-center jktform">
                    <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
                </div>
                <label for="inputEmail" class="sr-only">Email address</label>
                <input type="email" id="inputEmail" class="form-control" placeholder="Username" name="username" required autofocus>
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                <div class="justify-content-md-center mt-3 text-center">
                    <a href="RegisterServlet">Sign Up Click here</a>
                    <p class="mt-1 mb-3 text-muted">&copy; 2018-2019</p>
                </div>
            </form>
            <c:if test="${loginmessage!=null}">
                <div class="alert alert-danger" role="alert">${loginmessage}</div>
            </c:if>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
