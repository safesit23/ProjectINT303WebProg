<%-- 
    Document   : AboutProduct
    Created on : Nov 13, 2018, 3:58:19 PM
    Author     : jatawatsafe
--%>

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
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">Project One</a>
                            </h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">Project Two</a>
                            </h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">Project Three</a>
                            </h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">Project Four</a>
                            </h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">Project Five</a>
                            </h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">Project Six</a>
                            </h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">Project Seven</a>
                            </h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#">Project Eight</a>
                            </h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius adipisci dicta dignissimos neque animi ea, veritatis, provident hic consequatur ut esse! Commodi ea consequatur accusantium, beatae qui deserunt tenetur ipsa.</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->


            <!-------------------------------------------------------------------------------------->
            <div class="row">
                <div class="col-md-3">
                    <p class="lead" style="margin-top: 5px;">Brand</p>
                    <div class="list-group" style="margin-bottom: 10px">
                        <a href="#" class="list-group-item" onclick="showOnlyLifeStyle()">Nike</a>
                        <a href="#" class="list-group-item" onclick="showOnlyRunning()">Adidas</a>
                        <a href="#" class="list-group-item" onclick="showOnlySport()">Fila</a>
                        <a href="#" class="list-group-item" onclick="showAll()">Skechers</a>
                        <a href="#" class="list-group-item" onclick="showAll()">New Balance</a>
                    </div>
                    <p class="lead">ประเภทรองเท้า</p>
                    <div class="list-group">
                        <a href="#" class="list-group-item" onclick="showOnlyLifeStyle()">1</a>
                        <a href="#" class="list-group-item" onclick="showOnlyRunning()">2</a>
                        <a href="#" class="list-group-item" onclick="showOnlySport()">3</a>
                        <a href="#" class="list-group-item" onclick="showAll()">4</a>
                    </div>
                </div>

                <div class="col-md-9">

                    <div class="row">
                        <!--   Open Items 1  *************** -->
                        <div class="col-sm-4 col-lg-4 col-md-4 runningShoes">
                            <div class="thumbnail">
                                <img id="p001" src="img/product001-1.jpg" alt="NIKE Run Swift">
                                <div class="caption">
                                    <h4>
                                        <a  id="p001name" href="#">NIKE Run Swift</a>
                                        <span class="ratings glyphicon glyphicon-star"></span>
                                    </h4>
                                    <h4><span id="p001price">2000</span> THB</h4>
                                    <p>Upper แบบผ้าตาข่ายช่วยระบายอากาศได้ดี และกระชับเข้ารูปเท้า</p>
                                </div>
                                <div class="ratings">
                                    <button class="pull-right" onclick="addToCart('p001')">Add to Cart</button>
                                    <p>
                                        Size:
                                        <select name="size">
                                            <option value="7" disabled>US 7</option>
                                            <option value="8">US 8</option>
                                            <option value="9">US 9</option>
                                            <option value="10">US 10</option>
                                            <option value="11" disabled>US 11</option>
                                            <option value="12">US 12</option>
                                        </select>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <!--Closed Items-->
                        <!--   Open Items 2  *************** -->
                        <div class="col-sm-4 col-lg-4 col-md-4 runningShoes">
                            <div class="thumbnail">
                                <div onmouseover='changepicIn("002")' onmouseout='changepicOut("002")'>
                                    <img id="p002" src="img/product002-1.jpg" alt="NIKE Epic React Flyknit">
                                </div>
                                <div class="caption">
                                    <h4>
                                        <a id="p002name" href="#">NIKE Epic React Flyknit</a>
                                        <span class="ratings glyphicon glyphicon-star"></span>
                                    </h4>
                                    <h4 ><span id="p002price">5500</span> THB</h4>
                                    <p>ดีดตัวได้ดี โดยโฟมจะตอบสนองต่อแรงกระทบจากแรงก้าวโดยการดีดกลับ</p>
                                </div>
                                <div class="ratings">
                                    <button class="pull-right" onclick="addToCart('p002')">Add to Cart</button>
                                    <p>
                                        Size:
                                        <select name="size">
                                            <option value="7" disabled>US 7</option>
                                            <option value="8" disabled>US 8</option>
                                            <option value="9" disabled>US 9</option>
                                            <option value="10">US 10</option>
                                            <option value="11">US 11</option>
                                            <option value="12">US 12</option>
                                        </select>
                                    </p>
                                </div>

                            </div>
                        </div>
                        <!--Closed Items-->
                        <!--  Open Items 3 *************** -->
                        <div class="col-sm-4 col-lg-4 col-md-4 runningShoes">
                            <div class="thumbnail">
                                <div onmouseover='changepicIn("003")' onmouseout='changepicOut("003")'>
                                    <img id="p003" src="img/product003-1.jpg" alt="NIKE Odyssey React">
                                </div>
                                <div class="caption">
                                    <h4>
                                        <a  id="p003name" href="#">NIKE Odyssey React</a>
                                    </h4>
                                    <h4><span id="p003price">4600</span> THB</h4>
                                    <p>ดีดตัวได้ดี โดยโฟมจะตอบสนองต่อแรงกระทบจากแรงก้าวโดยการดีดกลับ</p>
                                </div>
                                <div class="ratings">
                                    <button class="pull-right" onclick="addToCart('p003')">Add to Cart</button>
                                    <p>
                                        Size:
                                        <select name="size">
                                            <option value="7">US 7</option>
                                            <option value="8">US 8</option>
                                            <option value="9" disabled>US 9</option>
                                            <option value="10" disabled>US 10</option>
                                            <option value="11">US 11</option>
                                            <option value="12">US 12</option>
                                        </select>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <!--Closed Items-->

                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
