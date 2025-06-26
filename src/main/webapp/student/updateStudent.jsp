<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"student".equals(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Update Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            padding: 40px;
        }
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            width: 400px;
            margin: 0 auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            background-color: #3498db;
            color: white;
            padding: 10px;
            border: none;
            width: 100%;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Update Profile</h2>
        <form action="../UpdateStudentServlet" method="post">
            <input type="hidden" name="id" value="<%= user.getId() %>">
            <label>Full Name:</label>
            <input type="text" name="fullName" value="<%= user.getFullName() %>" required>

            <label>Email:</label>
            <input type="email" name="email" value="<%= user.getEmail() %>" required>

            <label>Phone:</label>
            <input type="text" name="phone" value="<%= user.getPhone() %>" required>

            <label>Password (leave blank to keep current):</label>
            <input type="password" name="password" placeholder="Leave blank to keep current password">

            <button type="submit">Update</button>
        </form>
    </div>
</body>
</html>
