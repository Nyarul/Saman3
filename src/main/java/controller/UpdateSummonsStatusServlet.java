/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import Dao.SummonsDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SHAHRUL
 */
@WebServlet("/admin/update-summons")
public class UpdateSummonsStatusServlet extends HttpServlet {

    private SummonsDAO summonsDAO = new SummonsDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String summonsIdStr = request.getParameter("summonsId");
        String status = request.getParameter("status");

        if (summonsIdStr != null && status != null) {
            try {
                int summonsId = Integer.parseInt(summonsIdStr);
                summonsDAO.updateSummonStatus(summonsId, status);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("/admin/dashboard.jsp");
    }
}
