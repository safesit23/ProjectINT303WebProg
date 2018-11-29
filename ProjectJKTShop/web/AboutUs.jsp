<%-- 
    Document   : AboutUs
    Created on : Nov 29, 2018, 3:37:46 PM
    Author     : kkachain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include/header.jsp" />
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    </head>
    <body>
        <style>
            img {
                border-radius: 50%;
            }
        </style>
        <jsp:include page="include/navbar.jsp"/>
        <div class="container jktcontent" style="min-height: 550px;">
            <div class="row">
                <div class="col-6">
                    <br>
                    <h1>Contact</h1>
                    <div>
                        <br>
                        <h1>
                            &nbsp;&nbsp;&nbsp;&nbsp;JKT Shop
                        </h1>
                        <br>
                        <p><h3><img src="images/content/tel.png" width="30" height="30">&nbsp; Tel : 02-303-2018</h3></p>
                        <p><h3><img src="images/content/email.png" width="30" height="30">&nbsp; Email : jktshop303@gmail.com</h3></p>
                        <p><h3><img src="images/content/location.png" width="30" height="30">&nbsp; Address : 126 Pracha U-thit rd. 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bangmod Thungkru 
                            Bangkok 10140</h3></p>
                    </div>
                </div>
                <div class="col-md">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1920.5709400434966!2d100.49325425897423!3d13.651465726313102!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x2fd829cd26be9e23!2z4LiE4LiT4Liw4LmA4LiX4LiE4LmC4LiZ4LmC4Lil4Lii4Li14Liq4Liy4Lij4Liq4LiZ4LmA4LiX4Lio!5e0!3m2!1sth!2sth!4v1527582785877" 
                            style="border:0; width:100%; height:450px;" frameborder="0" allowfullscreen></iframe>
                </div>
            </div>
            <br />
            <hr>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <h1>CO-FOUNDER @JKT Shop</h1>
                </div>

                <div class="col-md-6 col-sm-12">
                    <div class="col-4 col-8">   
                        <img src="images/content/safe.jpg" alt="Avatar" width="200" height="200">
                        <div>
                            <h3>Jatawat Xie</h3>
                            <p>60130500009</p>
                            <p>jatawat.xie@mail.kmutt.ac.th</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="col-4 col-8">   
                        <img src="images/content/jed.jpg" alt="Avatar" width="200" height="200">
                        <div>
                            <h3>Thirajed Jaipetch</h3>
                            <p>60130500035</p>
                            <p>Thirajed.jed@mail.kmutt.ac.th</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="col-4 col-8">   
                        <img src="images/content/uho.jpg" alt="Avatar" width="200" height="200">
                        <div>
                            <h3>Kachain Thitisirisawas</h3>
                            <p>60130500007</p>
                            <p>kachain.xx@mail.kmutt.ac.th</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div>
                        <br>
                        <br>
                        <h3>INT 303 Web Programming</h3>
                        <h3>School of Information Technology</h3>
                        <h3>King Mongkut's University of Technology Thonburi</h3>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
