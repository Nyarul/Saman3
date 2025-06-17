/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// File: src/controller/LoginServlet.java
package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.User;
import Dao.UserDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        UserDAO userDAO = new UserDAO();
        User user = userDAO.login(email, password);
        
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            switch (user.getRole()) {
                case "student":
                    response.sendRedirect("student/dashboard.jsp");
                    break;
                case "staff":
                    response.sendRedirect("staff/dashboard.jsp");
                    break;
                case "admin":
                    response.sendRedirect("admin/dashboard.jsp");
                    break;
                default:
                    response.sendRedirect("login.jsp?error=1");
            }
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}