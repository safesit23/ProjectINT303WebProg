<%-- 
    Document   : Navbar
    Created on : Nov 9, 2018, 1:37:08 AM
    Author     : jatawatsafe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background-color:rgba(0, 0, 0, 0.459);
      border: 0px;
      
    }
</style>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
            <a id="logoSR" class="navbar-brand" href="/ProjectWebApp/index.jsp"><img src="/ProjectWebApp/images/content/icon.png" width="45px" style="margin-top: -10px; margin-right: -15px;"></a>
            <a class="navbar-brand" href="/ProjectWebApp/pages/login.jsp">SR Running</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
            <li class="active"><a href="index.html">HOME</a></li>
            <li><a href="product.html">PRODUCT</a></li>
            <li><a href="contact.html">CONTACT</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="register.html"><span class="glyphicon glyphicon-user"></span> LOGIN/REGISTER</a></li>
            <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-shopping-cart"></span> CART <span id="numItems">(0)</span>
                    <ul class="dropdown-menu">
                      <li><a href="#" onclick="cartOrder()">Check Items</a> </li>
                      <li><a href="#" onclick="resetOrder()">Reset Order</a></li>
                    </ul>
                  </li>
        </ul>
        </div>
    </div>
</nav>
