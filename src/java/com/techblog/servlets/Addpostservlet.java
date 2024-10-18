/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;
import com.techblog.entities.user;
import com.techblog.entities.Post;
import com.techblog.helper.Connectionprovider;
import com.techblog.dao.PostDao;
import java.io.File;
import com.techblog.helper.helper;
import com.techblog.dao.userdao;
//import com.techblog.servlets.Editservlet;

/**
 *
 * @author anjal
 */
@MultipartConfig 
public class Addpostservlet extends HttpServlet {

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
        int cid=Integer.parseInt(request.getParameter("cid"));
        String ptitle=request.getParameter("pTitle");
        String pcontent=request.getParameter("pContent");
        String pcode=request.getParameter("pCode");
        Part part=request.getPart("pic");
        //getting current user id
        HttpSession session=request.getSession();
        user u=(user) session.getAttribute("currentUser");
        out.println("your post  title is"+ ptitle);
        out.println(part.getSubmittedFileName());
        Post p=new Post( ptitle,pcontent, pcode,part.getSubmittedFileName(),null,cid,u.getId());
        
        PostDao dao=new PostDao(Connectionprovider.getConnection());
     
               if(dao.savePost(p))
              {
              
                  String path=request.getRealPath("/")+ "blog_pics" +File.separator + part.getSubmittedFileName();
                  helper.saveFile(part.getInputStream(), path);
                  out.println("done");
              }
                else{
                       out.println("error");
                    }

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
