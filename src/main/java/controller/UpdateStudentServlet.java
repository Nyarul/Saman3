package controller;

import Dao.UserDAO;
import model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (password == null || password.trim().isEmpty()) {
            password = currentUser.getPassword(); // ✅ preserve old password if input is blank
        }

        User user = new User();
        user.setId(id);
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);

        UserDAO dao = new UserDAO();
        boolean success = false;
        try {
            success = dao.updateStudent(user);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UpdateStudentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (success) {
            session.setAttribute("user", user); // update session info
            response.sendRedirect("/student/dashboard.jsp");
        } else {
            response.sendRedirect("student/updateStudent.jsp?error=1");
        }
    }
}
