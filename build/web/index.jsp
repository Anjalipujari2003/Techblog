<%-- 
    Document   : index
    Created on : 18-Apr-2024, 10:12:20 pm
    Author     : anjal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.techblog.helper.Connectionprovider"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
   
    <body>
        <!-- Navbar -->
        <%@include file="normal_navbar.jsp" %>
        <!--banner-->
        <div class="container-fluid p-0 m-0 bg-light  ">
            <div class="jumbotron">
                <div class="container">
                <h3 class="display-3">Welcome to Techblog</h3>
                
                <p>Welcome to technical blog,world of technology,Programming languages are described in terms of their syntax (form) and semantics (meaning), usually defined by a formal language. Languages usually provide features such as a type system, variables and mechanisms for error handling. </p>
                <p>The term computer language is sometimes used interchangeably with programming language.However, the usage of both terms varies among authors, including the exact scope of each. One usage describes programming languages as a subset of computer languages</p>
                <button class="btn btn-outline-dark btn-lg">Start Now!</button>
                <a href="login_page.jsp" class="btn btn-outline-dark btn-lg">Login</a>
                </div>
            </div>
        </div>
    <br>
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                       
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-dark">Learn now</a>
                        </div>
                      </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                       
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-dark">Learn now</a>
                        </div>
                      </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                       
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-dark">Learn now</a>
                        </div>
                      </div>
                </div>
            </div>
       
             <div class="row">
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                       
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-dark">Learn now</a>
                        </div>
                      </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                       
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-dark">Learn now</a>
                        </div>
                      </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                       
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-dark">Learn now</a>
                        </div>
                      </div>
                </div>
            </div>
            
            
        </div>
        
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
            
        </script>
    </body>
</html>
