/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.techblog.servlets;

import com.techblog.dao.userdao;
import com.techblog.entities.Message;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.techblog.entities.user;
import javax.servlet.http.HttpSession;
import com.techblog.helper.Connectionprovider;
import javax.servlet.annotation.MultipartConfig; // Import the necessary annotation
import java.io.*;
import com.techblog.helper.helper;
/**
 *
 * @author anjal
 */
@MultipartConfig
public class Editservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Editservlet</title>");            
            out.println("</head>");
            out.println("<body>");
            //fetch all data
            String useremail=request.getParameter("user_email");
            String username=request.getParameter("user_name");
            String userpassword=request.getParameter("user_password");
            Part part=request.getPart("image");
            String imagename=part.getSubmittedFileName();
            
            //get user from seesion
            HttpSession s=request.getSession();
            user u=(user) s.getAttribute("currentUser");
            u.setName(username);
            u.setEmail(useremail);
            u.setPassword(userpassword);
            String oldimg=u.getProfile();
            
            u.setProfile(imagename);
            //user database update
            userdao dao=new userdao(Connectionprovider.getConnection());
            boolean ans=dao.updateUser(u);
            if(ans)
            {
                
               
                String path=request.getRealPath("/")+ "pics" +File.separator+ u.getProfile();
                String oldpath=request.getRealPath("/")+ "pics" +File.separator+oldimg;
                    if(!oldimg.equals("default.jpg"))
                    {
                    helper.deleteFile(oldpath);
                    }
                    if(helper.saveFile(part.getInputStream(), path))
                    {   
                         
                         Message msg=new Message("Profile details updated...","success","alert-success");
                        
                         s.setAttribute("msg",msg);
                    }
                    else{
                        //////
                        Message msg=new Message("Something went wrong...","error","alert-danger");
                        s.setAttribute("msg",msg);
                    }
                
            }
            else{
                
                Message msg=new Message("Something went wrong...","error","alert-danger");
                 s.setAttribute("msg",msg);
            }
            response.sendRedirect("profile.jsp");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
