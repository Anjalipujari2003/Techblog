<%-- 
    Document   : show_blog_page
    Created on : 07-Jun-2024, 3:04:39 pm
    Author     : anjal
--%>
<%@page import="com.techblog.entities.user"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.helper.Connectionprovider"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="com.techblog.entities.Category"%>
<%@page import="java.util.ArrayList" %>


<%@page errorPage="error_page.jsp"%>
<%
    user u=(user)session.getAttribute("currentUser");
    if(u==null)
    {
        response.sendRedirect("login_page.jsp");
    }
 %>
<%
   int postId=Integer.parseInt(request.getParameter("post_id")) ;
   PostDao d=new PostDao(Connectionprovider.getConnection());
   Post p=d.getPostByPostId(postId);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getPtitle()%>||Techblog by Learn Code with Anjali</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .post-title{
                    font-weight: 200;
                    
            }
            .post-content{
                font-weight: 100;
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark primary">
              <div class="container-fluid">
                  <span><a class="navbar-brand" href="index.jsp">AKP</a></span>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="profile.jsp">Learn with Anjali</a>
                    </li>
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Categories
                      </a>
                      <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">DSA</a></li>
                        <li><a class="dropdown-item" href="#">CNS</a></li>
                        <li><a class="dropdown-item" href="#">TOC</a></li>
                        <li><a class="dropdown-item" href="#">DM</a></li>


                      </ul>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" aria-disabled="true">Contact us</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="#!" data-bs-toggle="modal" data-bs-target="#add-post-modal" aria-disabled="true">Post</a>
                    </li>
                    
                  </ul>
                    <ul class="navbar-nav mr-right">
                         <li class="nav-item">
                      <a class="nav-link " href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal" aria-disabled="true"><span class="fa fa-user-circle"><%= u.getName()%></a>
                    </li>
                        <li class="nav-item">
                      <a class="nav-link active" href="logoutservlet" aria-disabled="true">Log out</a>
                    </li>
                    </ul>
                </div>
              </div>
            </nav>
                    <!--end of navbar-->
                    <!--main content of body-->
                    <div class="container">
                        <div class="row my-4">
                            <div class="col-md-8 offset-md-2">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="post-title"><%= p.getPtitle()%>
                                    </div>
                                    <div class="card-body bg-dark" style="color: white">
                                        <img src="blog_pics/default1.png" style="width: 500px;margin-left: 100px;border: 2px solid black;border-radius: 10px">
                                        
                                        <div class="row my-3 "  >
                                            <div class="col-md-8">
                                                <p><i> <a href="#!">Anjali Pujari</a> has posted..</i></p>  
                                            </div>
                                            <div class="col-md-4">
                                                <p><i><%= p.getPdate().toLocaleString()%></i></p> 
                                            </div>
                                        </div>
                                        <p class="post-content"><i><%= p.getPcontent()%></i></p>
                                        <br><br> 
                                        <div class="post-code container">
                                            <hr>
                                            <h5>Code:</h5>
                                        <pre><%= p.getPcode()%></pre>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                         <a href="#" class="btn btn-outline-dark btn-sm "><i class="fa fa-heart"></i><span>10</span></a>
                                         <a href="#" class="btn btn-outline-dark btn-sm "><i class="fa fa-commenting-o"></i><span>20</span></a>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>   
                    <!--end of main content of body-->
                    
                     <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header bg-dark text-white text-center">
                    <h5 class="modal-title fs-5" id="exampleModalLabel">TechBlog</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                      <div class="container text-center">
                          <img src="pics/<%=u.getProfile()%> " class="img" style="height: 100px;width:100px;border-radius: 50%">
                          <h1 class="modal-title fs-5" id="exampleModalLabel"><%= u.getName()%></h1>
                          
                          <!--details-->
                          <div class="profile-details">
                            <table class="table">
                            
                            <tbody>
                              <tr>
                                <th scope="row">ID</th>
                                <td><%= u.getId()%></td>
                                
                              </tr>
                              <tr>
                                <th scope="row">Email</th>
                                <td><%= u.getEmail()%></td>
                               
                              </tr>
                              <tr>
                                <th scope="row">Gender</th>
                                <td><%=u.getGender()%></td>   
                              </tr>
                              <tr>
                                <th scope="row">Registered on</th>
                                <td><%=u.getDateTime().toString()%></td>   
                              </tr>
                            </tbody>
                          </table>
                          </div>
                              <!--profile-edit-->
                              <div id="profile-edit" style="display: none">
                                  <h3 class="mt-2">Please Edit carefully</h3>
                                  <form action="Editservlet" method="post" enctype="multipart/form-data">  <!--//multipart-means it contains various type of data like img-->
                                      <table class="table">
                                          <tr>
                                              <td>Id:</td>
                                              <td><%= u.getId()%></td>
                                          </tr>
                                          
                                          <tr>
                                              <td>Email:</td>
                                              <td><input type="email" class="form-control" name="user_email" value="<%= u.getEmail()%>"></td>
                                          </tr>
                                          <tr>
                                              <td>Name:</td>
                                              <td><input type="text" class="form-control" name="user_name" value="<%= u.getName()%>"></td>
                                          </tr>
                                          <tr>
                                              <td>Password:</td>
                                              <td><input type="password" class="form-control" name="user_password" value="<%= u.getPassword()%>"></td>
                                          </tr>
                                          <tr>
                                              <td>Gender:</td>
                                              <td><%= u.getGender()%></td>
                                          </tr>
                                          <tr>
                                              <td>New Profile Pic</td>
                                              <td><input type="file" class="form-control" name="image" ></td>
                                          </tr>
                                      </table>
                                          <div class="container">
                                              <button type="submit" class="btn btn-outline-dark">Save</button>
                                          </div>
                                  </form>
                              </div>
                              <!--profile edit ends-->
                             </div>

                                            </div>
                                            <div class="modal-footer">
                                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                              <button type="button" id="edit-profile-btn" class="btn btn-primary">Edit</button>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                          <!-- Add post modal -->
                              
                    <!-- Modal -->
                    <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Provide Post Details....</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            
                              <form id="add-post-form" action="Addpostservlet" method="post">
                                  <div class="form-group"> 
                                  <select class="form-control" name="cid">
                                      <option selected disabled>---Select Categories--</option>
                                      <%
                                      PostDao dao=new PostDao(Connectionprovider.getConnection());
                                      ArrayList<Category>list=dao.getallCategories();
                                      for(Category c:list){
                                      
                                    
                                     %>
                                     <option value="<%= c.getCid()%>"><%= c.getName() %></option>
                                     
                                      <% } %>
                                  </select>
                                  </div>
                                  <br>
                                  <div class="form-group">
                                      <input name="pTitle" type="text"  placeholder="Enter the post title" class="form-control">
                                  </div><br>
                                  <div class="form-group">
                                      <textarea name="pContent" class="form-control" style="height:200px" placeholder="Enter post Details"></textarea>
                                  </div>
                                  <div class="form-group">
                                      <textarea name="pCode" class="form-control" style="height:200px" placeholder="Enter any program(if any)"></textarea>
                                  </div>
                                  <div class="form-group">
                                      <label>Select your pic:</label><br>
                                      <input type="file" name="pic">
                                  </div>
                                  <div class="container text-center">
                                      <button type="submit" class="btn btn-outline-dark ">Post</button>
                                  </div>
                              </form>
                              
                          </div>
                          
                        </div>
                      </div>
                    </div>
        <!--end of post modal-->
       
       
       
       
       
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
       
        <script>
            $(document).ready(function(){
                let editStatus=false;
                $('#edit-profile-btn').click(function(){
                    //alert("hjk");   
                    if(editStatus===false)
                    {
                    $(".profile-details").hide();
                    $("#profile-edit").show();
                    editStatus=true;
                    $(this).text("Back");
                    }
                    else
                    {
                    $(".profile-details").show();                      ////for toggle 
                    $("#profile-edit").hide();
                    editStatus=false;
                    $(this).text("Edit");
                    }
                
                });
            });
        </script>
        
        
        <!--now add post javascript-->
        
        <script>
            $(document).ready(function(e){
                $("#add-post-form").on("submit",function(event){
                    event.preventDefault();
                    console.log("submitted...");
                    let form=new FormData(this);
                    //requesting to servlet
                    $.ajax({
                        url:"Addpostservlet",
                        type:"POST",
                        data:form,
                        success:function(data,textStatus,jqXHR){
                            
                          console.log(data);
//                            if(data.trim()==='done')
//                            {
//                                swal("Good job!", "Saved Successfully!", "success");
//                            }
//                            else
//                            {
//                                swal("Error", "Something went wrong!Try again!", "error");
//                            }
                        },
                        error:function(jqXHR,textStatus,errorThrown){
//                            swal("Error", "Something went wrong!Try again!", "error");

                        },
                        processData:false,
                        contentType:false
                    });
                });
            });
        </script>
        
    </body>
</html>
