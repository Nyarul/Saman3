package controller;

import Dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/delete-user")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserDAO userDAO = new UserDAO();

        boolean success = userDAO.deleteUser(userId);
        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp?deleted=true");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp?error=delete");
        }
    }
}
