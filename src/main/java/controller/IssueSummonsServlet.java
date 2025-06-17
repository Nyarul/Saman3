/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// File: src/controller/IssueSummonsServlet.java
package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import Dao.SummonsDAO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;


@WebServlet("/issueSummons")
public class IssueSummonsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get current staff user from session
        HttpSession session = request.getSession();
        User staffUser = (User) session.getAttribute("user");
        
        if (staffUser == null || !"staff".equals(staffUser.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        // Correct parameter name to match form field
        String matricNo = request.getParameter("matricNo");
        String violationType = request.getParameter("violationType");
        String location = request.getParameter("location");
        
        SummonsDAO summonsDAO = new SummonsDAO();
        // Pass staff ID (not hardcoded 1)
        boolean success = false;
        try {
            success = summonsDAO.issueSummons(matricNo, staffUser.getId(), violationType, location);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(IssueSummonsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if (success) {
            response.sendRedirect("staff/dashboard.jsp?success=1");
        } else {
            response.sendRedirect("staff/dashboard.jsp?error=1");
        }
    }
}
