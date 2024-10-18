

package com.techblog.helper;

import java.sql.*;


public class Connectionprovider {
    private static Connection con;
    
    public static Connection getConnection(){
        try{
        if(con==null)
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/techblog";
            String user="root";
            String password="#Anjali@2003";
            con=DriverManager.getConnection(url,user,password);
            
            
        }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return con;
    }  
}