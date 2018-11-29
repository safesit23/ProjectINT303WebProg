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
        <link href="https://fonts.googleapis.com/css?family=Prompt" rel="stylesheet">
        <jsp:include page="include/header.jsp" />
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    </head>
    <body>
        <style>
            body{
                font-family: "Prompt";
            }
        </style>
        <jsp:include page="include/navbar.jsp"/>
        <div class="container-fluid">
            <div class="row" style="min-height: 800px;">
                <div class="col-md-3 pt-3">
                    <div class="row justify-content-center" style="padding: 100px;">
                        <img src="images/content/IconPeople.svg" alt="icon">
                        <h4 class="mt-3 mb-1">${account.nickname}</h4>
                        <p class="mb-4">${account.username}</p>
                        <a href="AccountServlet?editAccount=yes"><button class="btn btn-outline-dark btn-sm">Edit Profile</button></a>
                    </div>

                </div>
                <div class="col-md-9 pt-3" style="background-color: #3bbdff14;">
                    <div class="row" style="padding: 100px;">
                        <c:choose>
                            <c:when test="${editAccount!=null}">
                                <div class="col-md-12 mb-4">
                                    <form  action="AccountServlet" method="post">
                                        <div class="col-md-12 mb-4">
                                            <h2 style="color: blueviolet">ข้อมูลทั่วไป</h2>
                                            <hr>
                                            <h5>ชื่อ: ${account.firstname}  <span class="pr-4"></span>นามสกุล: ${account.lastname}</h5>

                                            <h5>เพศ: 
                                                <c:if test="${account.sex=='M'}">ชาย</c:if>
                                                <c:if test="${account.sex=='F'}">หญิง</c:if>
                                                </h5>
                                                <h5>วันเกิด: <fmt:formatDate value="${account.dob}" type = "date" /> </h5>
                                            <h5>เบอร์โทรศัพท์: ${account.phone}</h5>

                                        </div><!--Closed Row-->
                                        <h2>ที่อยู่</h2>
                                        <hr>
                                        <div class="form-row mb-4">
                                            <div class="col-md-12 mb-3">
                                                <label>ที่อยู่</label>
                                                <input type="text" class="form-control" name="address" value="${account.address}">
                                            </div>

                                            <div class="col-md-5 mb-3">
                                                <label>Province</label>
                                                <input type="text" class="form-control" name="province" value="${account.province}">
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <label>Province</label>
                                                <input type="text" class="form-control" name="country" value="${account.country}">
                                            </div>
                                            <div class="col-md-3 mb-3">
                                                <label>Postal Code</label>
                                                <input type="text" class="form-control" name="postalCode" value="${account.postalcode}">
                                            </div>

                                        </div><!--Closed Row-->
                                        <input type="text" name="editData" value="true" hidden>
                                        <button type="submit" class="mt-4 mb-4 btn btn-outline-danger btn-lg ">Save</button>
                                    </form>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-md-12 mb-4">
                                    <h2>ข้อมูลทั่วไป</h2>
                                    <hr>
                                    <h5>ชื่อ: ${account.firstname}  <span class="pr-4"></span>นามสกุล: ${account.lastname}</h5>

                                    <h5>เพศ: 
                                        <c:if test="${account.sex=='M'}">ชาย</c:if>
                                        <c:if test="${account.sex=='F'}">หญิง</c:if>
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
