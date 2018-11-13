<%-- 
    Document   : login
    Created on : Nov 9, 2018, 1:15:06 AM
    Author     : jatawatsafe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include/header.jsp" />
    </head>
    <body>
        <style>
            #content{
                padding-top: 100px;
            }
        </style>
        <jsp:include page="include/navbar.jsp"/>
        <div class="container jktcontent">
            <h1>Login</h1>
            <form action="LoginServlet" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>

    </body>
</html>
