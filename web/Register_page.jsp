<%-- 
    Document   : Register_page
    Created on : 19-Apr-2024, 9:08:40 pm
    Author     : anjal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        

    </head>
    <body>
         <%@include file="normal_navbar.jsp" %>
         <main class="d-flex align-items-center" style="height: 100vh">
             <div class="container">
                 <div class="col-md-6 offset-md-3">
                     <div class="card">
                         <div class="card-header bg-dark text-white">
                            Register Here 
                         </div>
                         <div class="card-body">
                             <form id="reg-form" action="Registerservlet" method="POST">
                                    <div class="mb-3">
                                      <label for="user_name" class="form-label">User Name</label>
                                      <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                                      
                                    </div>
                                    <div class="mb-3">
                                      <label for="exampleInputEmail1" class="form-label">Email address</label>
                                      <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                      <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>
                                 <div class="mb-3">
                                     <label for="gender" class="form-label">Select Gender</label><br>
                                      <input type="radio" id="gender" name="gender" value="Male">Male
                                      <input type="radio" id="gender" name="gender" value="Female">Female
                                    </div>
                                    <div class="mb-3">
                                      <label for="exampleInputPassword1" class="form-label">Password</label>
                                      <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <div class="mb-3 form-check">
                                      <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                      <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
                                    </div>
                                 <div class="container text-center" id="loader" style="display:none"><span class="fa fa-refresh fa-spin fa-3x"></span>
                                     <h6>Please wait...</h6></div>
                                    <button id="submit-btn" type="submit" class="btn btn-dark">Submit</button>
                                  </form>
                         </div>
                        
                     </div>
                 </div>
             </div>
         </main>
         <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        
<script>
    $(document).ready(function() {
        console.log("loaded..");
        $("#reg-form").on("submit", function(event) {
            event.preventDefault();
            let form = new FormData(this);

            $("#submit-btn").hide();
            $("#loader").show();
            $.ajax({
                url: "Registerservlet",
                type: "POST",
                data: form,
                success: function(data, textStatus, jqXHR) {
                    console.log(data);
                    $("#submit-btn").show();
                    $("#loader").hide();
                    if(data.trim()==='done'){
                    alert("Successfully Registered! Directing to login page");
                    window.location="login_page.jsp";
                }
                else{
                    alert(data);
                }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR);
                    $("#submit-btn").show();
                    $("#loader").hide();
                    alert("Please enter correct crendentials!");
                },
                processData: false,
                contentType: false
            });
        });
    });
</script>

    </body>
</html>
