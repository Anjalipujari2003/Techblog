 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.dao;
import com.techblog.entities.Category;
import java.sql.*;
import com.techblog.entities.Post;
import java.util.ArrayList;
import java.util.List;
public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    public ArrayList<Category> getallCategories(){
        ArrayList<Category> list=new ArrayList<>();
        
        try{
            String q="select * from categories";
            Statement st=con.createStatement();
            ResultSet set=st.executeQuery(q);
            while(set.next())
            {
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                Category c=new Category(cid ,name,description);
                list.add(c);
            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean savePost(Post p)
    {
        boolean f=false;
        try{
            String q="insert into posts(ptitle,pcontent,pcode,ppic,cid,userId) values(?,?,?,?,?,?)";
            PreparedStatement p1=con.prepareStatement(q);
            p1.setString(1, p.getPtitle());
            p1.setString(2,p.getPcontent());
            p1.setString(3, p.getPcode());
            p1.setString(4,p.getPpic());
            p1.setInt(5, p.getCid());
            p1.setInt(6,p.getUserId());
            
            
            p1.executeUpdate();
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
     public List<Post> getAllPosts() {

        List<Post> list = new ArrayList<>();
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");

            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("ptitle");
                String pContent = set.getString("pcontent");
                String pCode = set.getString("pcode");
                String pPic = set.getString("ppic");
                Timestamp  date = set.getTimestamp("pdate");
                int cid = set.getInt("cid");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getPostByCatId(int cid) {
        List<Post> list = new ArrayList<>();
        //fetch all post by id
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from posts where cid=?");
            p.setInt(1, cid);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("ptitle");
                String pContent = set.getString("pcontent");
                String pCode = set.getString("pcode");
                String pPic = set.getString("ppic");
                Timestamp  date = set.getTimestamp("pdate");

                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Post getPostByPostId(int postId) {
        Post post = null;
        String q = "select * from posts where pid=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("ptitle");
                String pContent = set.getString("pcontent");
                String pCode = set.getString("pcode");
                String pPic = set.getString("ppic");
                Timestamp  date = set.getTimestamp("pdate");
                int cid=set.getInt("cid");
                int userId = set.getInt("userId");
                post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
    

}
