/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.dao;
import java.sql.*;
import java.io.IOException;
import com.techblog.entities.user;
//inserting data in database
public class userdao {
    private Connection con;

    public userdao(Connection con) {
        this.con = con;
    }
    
    //method to insert data to database
    public boolean saveUser(user u)                     //user from entities to take values
    {
        
        try{
            
            String q="insert into user(name,email,password,gender) values(?,?,?,?)";
            PreparedStatement p=this.con.prepareStatement(q);
            p.setString(1,u.getName());
            p.setString(2,u.getEmail());
            p.setString(3, u.getPassword());
            p.setString(4,u.getGender());
            p.executeUpdate();
            return true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }
    //get useremail and password
        public user getuserByIdEmailPassword(String email,String password)
        {
           user u=null;
           try{
               String q="select * from  user where email=? and password=?";
               PreparedStatement p=con.prepareStatement(q);
               p.setString(1,email);
               p.setString(2,password);
               ResultSet set=p.executeQuery();
               if(set.next())
               {
                   u=new user();
                   //data from db
                   String name=set.getString("name");
                   //set to user object
                   u.setName(name);
                   u.setId(set.getInt("id"));
                   u.setEmail(set.getString("email"));
                   u.setPassword(set.getString("password"));
                   u.setGender(set.getString("gender"));
                   u.setDateTime(set.getTimestamp("rdate"));
                   u.setProfile(set.getString("profile"));
              }
           }
           catch(Exception e)
           {
               e.printStackTrace();
           }
           return u;
        }
        
        public boolean updateUser(user u)
        {   boolean f=false;
            try{
                
                String q="update user set name=?,email=?,password=?,gender=?,profile=? where id=?";
                PreparedStatement p=con.prepareStatement(q);
                p.setString(1,u.getName());
                p.setString(2,u.getEmail());
                p.setString(3,u.getPassword());
                p.setString(4,u.getGender());
                p.setString(5,u.getProfile());
                p.setInt(6, u.getId());
                
                p.executeUpdate();
                f=true;
            }
            catch(Exception e){
                e.printStackTrace();
            }
            return f;
        }
    
}
