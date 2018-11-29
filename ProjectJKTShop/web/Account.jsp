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
                        <h3 class="mt-3 mb-1">Hello, ${account.nickname}</h3>
                        <p class="mb-4">${account.username}</p>
                        <a href="AccountServlet?editAccount=yes"><button class="btn btn-outline-dark btn-sm">Edit Profile</button></a>
                    </div>
                </div>
                <div class="col-md-9 pt-3" style="background-color: #EEEEEE;">
                    <div class="row" style="padding: 100px;">
                        <c:choose>
                            <c:when test="${editAccount!=null}">
                                <div class="col-md-12 mb-4">
                                    <form  action="AccountServlet" method="post">
                                        <h2>ข้อมูลทั่วไป</h2>
                                        <hr>
                                        <div class="form-row mb-4">
                                            <div class="col-md-4 mb-3">
                                                <label>ชื่อ</label>
                                                <input type="text" class="form-control"  value="${account.firstname}" required>
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <label>นามสกุล</label>
                                                <input type="text" class="form-control" value="${account.lastname}" required>
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <label>ชื่อเล่น</label>
                                                <input type="text" class="form-control" value="${account.nickname}" required>
                                            </div>
                                            
                                            <div class="col-md-4 mb-3">
                                                <label>เบอร์โทรศัพท์</label>
                                                <input type="tel" class="form-control" value="${account.phone}" required>
                                            </div>

                                            <div class="col-md-4 mb-3">
                                                <label>วันเกิด</label>
                                                <fmt:formatDate var="parsedDate" value="${account.dob}" pattern="yyyy-MM-dd" />
                                                <input class="form-control" type="date"  name="dob" value="${parsedDate}" required>
                                            </div>
                                            
                                            <div class="col-md-4 mb-3">
                                                <label>Gender<sup> *</sup></label>
                                                <div>
                                                    <input class="ml-3 mr-3" type="radio"  name="sex" value="M" <c:if test="${account.sex=='M'}">checked</c:if>>Male
                                                    <input class="ml-3 mr-3" type="radio"  name="sex" value="F" <c:if test="${account.sex=='F'}">checked</c:if>required>Female
                                                </div>
                                            </div>

                                        </div>
                                        <h2>ที่อยู่</h2>
                                        <hr>





                                    </form>
                                </div>
                            </c:when>
                            <c:otherwise>
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
                            </c:otherwise>
                        </c:choose>





                    </div><!--/ROW-->
                </div>
            </div>  
        </div>
    </body>
</html>
