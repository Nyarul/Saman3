/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// File: src/controller/RegisterServlet.java
package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.User;
import Dao.UserDAO;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        User user = new User();
        user.setMatricNo(request.getParameter("matricNo"));
        user.setFullName(request.getParameter("fullName"));
        user.setEmail(request.getParameter("email"));
        user.setPhone(request.getParameter("phone"));
        user.setPassword(request.getParameter("password"));
        
        String plateNumber = request.getParameter("plateNumber");
        
        UserDAO userDAO = new UserDAO();
        boolean success = userDAO.registerStudent(user, plateNumber);
        
        if (success) {
            response.sendRedirect("register.jsp?success=1");
        } else {
            response.sendRedirect("register.jsp?error=1");
        }
    }
}
