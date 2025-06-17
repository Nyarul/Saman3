<%-- 
    Document   : dashboard
    Created on : 11 Jun 2025, 11:04:38 pm
    Author     : SHAHRUL
--%>

<%@page import="Dao.SummonsDAO"%>
<%@page import="model.User"%>
<%-- File: WebContent/student/dashboard.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Summons" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"student".equals(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
    
    SummonsDAO summonsDAO = new SummonsDAO();
    List<Summons> summonsList = summonsDAO.getSummonsForStudent(user.getId());
%>
<html>
<head>
    <title>Student Dashboard</title>
    <style>
        body {
            background-image: url('https://png.pngtree.com/thumb_back/fh260/background/20201029/pngtree-technological-background-concept-and-idea-for-the-internet-of-things-communication-image_443783.jpg'); /* Replace with your actual path */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

    * {
        box-sizing: border-box;
    }

    html {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f7f9;
        color: #333;
    }

    h1 {
        color:white;
        margin-top: 20px;
    }

    h2 {
        color: white;
        margin-bottom: 15px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #ffffff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
    }

    th, td {
        padding: 12px 16px;
        border-bottom: 1px solid #e0e0e0;
        text-align: left;
    }

    th {
        background-color: #3498db;
        color: white;
        font-weight: normal;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #eef3f8;
    }

    a {
        color: #3498db;
        text-decoration: none;
        font-weight: bold;
        transition: color 0.3s ease;
    }

    a:hover {
        color: #21618c;
        text-decoration: underline;
    }

    p {
        margin-top: 25px;
        font-size: 15px;
    }
</style>
</head>
<body>
    <h1>Welcome,  <%= user.getFullName() %></h1>
    
    <h2>Your Summons</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Violation</th>
            <th>Location</th>
            <th>Amount (RM)</th>
            <th>Status</th>
            <th>Issued Date</th>
        </tr>
        <% for (Summons summons : summonsList) { %>
        <tr>
            <td><%= summons.getId() %></td>
            <td><%= summons.getViolationType() %></td>
            <td><%= summons.getLocation() %></td>
            <td><%= String.format("%.2f", summons.getAmount()) %></td>
            <td><%= summons.getStatus() %></td>
            <td><%= summons.getIssuedAt() %></td>
        </tr>
        <% } %>
    </table>
    
    <p><a style="color: white" href="../logout">Logout</a></p>
</body>
</html>