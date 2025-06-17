<%-- 
    Document   : dashboard
    Created on : 11 Jun 2025, 11:03:15 pm
    Author     : SHAHRUL
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Staff Dashboard</title>
    <style>
    body {
        background-image: url('https://png.pngtree.com/thumb_back/fh260/background/20201029/pngtree-technological-background-concept-and-idea-for-the-internet-of-things-communication-image_443783.jpg'); /* Replace with your actual path */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f9fbfc;
        color: #333;
        margin: 0;
        padding: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }

    h1 {
        color: white;
        margin-bottom: 10px;
    }
    
     h2 {
        color: black;
        margin-bottom: 10px;
    }

    .form-container {
        background-color: #ffffff;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        max-width: 500px;
        width: 100%;
    }

    form label {
        display: block;
        margin-bottom: 10px;
        font-size: 15px;
    }

    input[type="text"],
    select {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
        box-sizing: border-box;
    }

    button[type="submit"] {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 18px;
        font-size: 15px;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.2s;
    }

    button[type="submit"]:hover {
        background-color: #0056b3;
    }

    p {
        font-size: 14px;
        margin-top: 15px;
    }

    a {
        color: #007bff;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }

    p[style*="color: green"] {
        background-color: #d4edda;
        color: #155724;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #c3e6cb;
        margin-top: 15px;
    }

    p[style*="color: red"] {
        background-color: #f8d7da;
        color: #721c24;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #f5c6cb;
        margin-top: 15px;
    }
</style>

</head>
<body>
    <h1>Welcome, Staff </h1>
    <div class="form-container">
    <h2>Issue Summons</h2>
    <form action="<%= request.getContextPath() %>/issueSummons" method="post">
        <label>Matric Number: <input type="text" name="matricNo" required></label><br>
        <label>Violation Type: 
            <select name="violationType" required>
                <option value="Illegal Parking">Illegal Parking</option>
                <option value="No Vehicle Sticker">No Vehicle Sticker</option>
                <option value="Speeding">Speeding</option>
            </select>
        </label><br>
        <label>Location: <input type="text" name="location" required></label><br>
        <button type="submit">Issue Summons</button>
    </form>
    </div>
    <%-- Display success/error messages --%>
    <% if (request.getParameter("success") != null) { %>
        <p style="color: green;">Summons issued successfully!</p>
    <% } %>
    <% if (request.getParameter("error") != null) { %>
        <p style="color: red;">Failed to issue summons. Please check matric number.</p>
    <% } %>
    
    <p><a style="color: white" href="../logout">Logout</a></p>
</body>
</html>
