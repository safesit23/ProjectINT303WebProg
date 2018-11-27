<%-- 
    Document   : Message
    Created on : Nov 15, 2018, 3:09:05 PM
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
        <div class="container jktcontent" style="min-height: 550px;">
            <h1>Message</h1>
            <h3>${message}</h3>
            <c:if test="${activatekey!=null}">
                <h4>Please Activate Email by this link<br><a href="#">${activatekey}</a></h4>
            </c:if>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
