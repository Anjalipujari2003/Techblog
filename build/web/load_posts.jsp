<%@page import="com.techblog.helper.Connectionprovider" %>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="java.util.List"%>
<div class="row">
<%
    Thread.sleep(1000);//remove after
PostDao d=new PostDao(Connectionprovider.getConnection());
int cid=Integer.parseInt(request.getParameter("cid"));
List<Post>posts =null;
if(cid==0)
{
posts=d.getAllPosts();

}
else{
    posts=d.getPostByCatId(cid);
}
if(posts.size()==0)
{
out.println("<h3><center>No Posts in this Category....</center></h3>");
return;
}
for(Post p:posts){
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <!--<img src="blog_pics/<%= p.getPpic()%>" class="card-img-top" alt="card">         video madla ahe-->
            <img src="blog_pics/default1.png" class="card-img-top" alt="card" style="height:200px">

            <div class="card-body">
                <b><%= p.getPtitle()%></b>
                <p><%= p.getPcontent()%></p>
                
            </div>
                <div class="card-footer bg-grey text-left">
                    <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-dark btn-sm ">Read More</a>
                    <a href="#" class="btn btn-outline-dark btn-sm "><i class="fa fa-heart"></i><span>10</span></a>
                    <a href="#" class="btn btn-outline-dark btn-sm "><i class="fa fa-commenting-o"></i><span>20</span></a>


                </div>
        </div>
    </div>
    
<%
    }


%>
</div>