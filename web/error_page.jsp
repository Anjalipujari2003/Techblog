<%-- 
    Document   : error_page
    Created on : 20-Apr-2024, 9:22:35 am
    Author     : anjal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! something went wrong..</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="container text-center">
            <img src="img/user.png" class="img-fluid" style="height: 300px;width: 300px;margin-top: 20px">
            <h3 class="display-3">Sorry!Something went Wrong...</h3>
            <%=exception %>
            <a href="index.jsp" class="btn btn-dark btn-lg text-white">Home</a>
        </div>
    </body>
</html>
