<%-- 
    Document   : login
    Created on : 11 Jun 2025, 10:23:42 pm
    Author     : SHAHRUL
--%>

<%-- File: WebContent/login.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>UMT Transport Summons - Login</title>
    <style>
    body {
        background-image: url('https://png.pngtree.com/thumb_back/fh260/background/20201029/pngtree-technological-background-concept-and-idea-for-the-internet-of-things-communication-image_443783.jpg'); /* Replace with your actual path */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
    }

    .container {
        background-color: rgba(255, 255, 255, 0.95);
        padding: 30px 25px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        width: 350px;
        margin: 100px auto;
        text-align: center;
    }

    .container img.logo {
        
       font-size: 24px;
            font-weight: bold;
            color: #4e54c8;
            margin-bottom: 15px;
        }

        .avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 20px;
            border: 3px solid #4e54c8;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .avatar:hover {
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(78, 84, 200, 0.5);
        }

    h2 {
        margin-bottom: 20px;
        color: #333;
        font-size: 24px;
    }

    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-sizing: border-box;
    }

    button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px;
        width: 100%;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
    }

    button:hover {
        background-color: #0056b3;
    }

    p {
        margin-top: 15px;
        font-size: 14px;
        color: #444;
    }

    a {
        color: #007bff;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }

    .error-msg {
        color: red;
        margin-bottom: 15px;
        font-size: 14px;
    }
</style>

</head>
<body>
    <div class="container">
        <div class="logo"> UMT Transport Summons System</div>

        <!-- Clickable Avatar -->
        <a href="register.jsp" title="Click to register">
            <img src="https://www.bing.com/th/id/OIP.IzI7jC9h2cX66KgBBraKWgHaHa?w=204&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2" alt="Register Avatar" class="avatar">
        </a>
        <h2>UMT Transport Login</h2>
        <% if (request.getParameter("error") != null) { %>
            <p style="color:red;">Invalid credentials!</p>
        <% } %>
        <form action="login" method="post">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <p>New student? <a href="register.jsp">Register here</a></p>
    </div>
</body>
</html>