<%-- 
    Document   : Account.jsp
    Created on : Nov 28, 2018, 3:58:08 PM
    Author     : jatawatsafe
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <div class="container-fluid">
            <div class="row" style="min-height: 800px;">
                <div class="col-md-3 pt-3">
                    <div class="row justify-content-center" style="padding: 100px;">
                        <img src="images/content/IconPeople.svg">
                        <h3 class="mt-3 mb-3">Hello, ${account.nickname}</h3>
                        <a href=""><button class="btn btn-outline-dark btn-sm">Edit Profile</button></a>
                    </div>
                </div>
                <div class="col-md-9 pt-3" style="background-color: #EEEEEE;">
                    <div class="row" style="padding: 100px;">
                        <div class="col-md-12 mb-4">
                            <h2>ข้อมูลทั่วไป</h2>
                            <hr>
                            <h5>ชื่อ: ${account.firstname}  <span class="pr-4"></span>นามสกุล: ${account.lastname}</h5>
                            <h5>ชื่อเล่น: ${account.nickname}</h5>
                            <h5>เพศ: 
                                <c:choose>
                                    <c:when test="${account.sex=='M'}">ชาย</c:when>
                                    <c:otherwise>หญิง</c:otherwise>
                                </c:choose>
                            </h5>
                            <h5>วันเกิด: <fmt:formatDate value="${account.dob}" type = "date" /> </h5>
                            <h5>เบอร์โทรศัพท์: ${account.phone}</h5>

                        </div>
                        <div class="col-md-12 mt-4">
                            <h2>ที่อยู่</h2>
                            <hr>
                            <h5>${account.address}, ${account.province}, ${account.country} ${account.postalcode}</h5>
                        </div>




                    </div><!--/ROW-->
                </div>
            </div>  
        </div>
    </body>
</html>
