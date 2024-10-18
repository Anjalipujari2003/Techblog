<%-- 
    Document   : login_page
    Created on : 19-Apr-2024, 8:10:37 pm
    Author     : anjal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.techblog.entities.Message"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
            <%@include file="normal_navbar.jsp" %>
        <main class="d-flex align-items-center" style="height: 70vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header bg-dark text-white" style="font-size: 20px">
                                <p>Login here</p>
                            </div>
                                <%
                                    Message m=(Message)session.getAttribute("msg");
                                    if(m!=null)
                                    {
                                    %>
                                      <div class="alert alert-primary" <%= m.getCssClass() %>role="alert">
                                          <%= m.getContent()%>
                                      </div>
                                    <%
                                        session.removeAttribute("msg");
                                }
                                %>
                            <div class="card-body">
                              <form action="Loginservlet" method="POST">
                                        <div class="mb-3">
                                          <label for="exampleInputEmail1" class="form-label">Email address</label>
                                          <input type="email" name="email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                          <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                        </div>
                                        <div class="mb-3">
                                          <label for="exampleInputPassword1" class="form-label">Password</label>
                                          <input type="password" name="password" required class="form-control" id="exampleInputPassword1">
                                        </div>
                                  <div class="container text-center">
                                        <button type="submit" class="btn btn-dark">Submit</button>

                                  </div>
                                      </form>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>


<!-- error page,userdao me getuseremailpass(email,pass),login system -->