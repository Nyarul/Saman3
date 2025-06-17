<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>
    <style>
        body {
            background-image: url('https://png.pngtree.com/thumb_back/fh260/background/20201029/pngtree-technological-background-concept-and-idea-for-the-internet-of-things-communication-image_443783.jpg'); /* Replace with your actual path */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #ffffff;
            padding: 25px 30px;
            border: 1px solid #ddd;
            border-radius: 6px;
            width: 320px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-top: 10px;
            margin-bottom: 5px;
            font-size: 14px;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            margin-top: 10px;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        p {
            text-align: center;
            margin-top: 12px;
            font-size: 14px;
        }

        p a {
            color: #007bff;
            text-decoration: none;
        }

        p a:hover {
            text-decoration: underline;
        }

        .message {
            text-align: center;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .message.success {
            color: green;
        }

        .message.error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Student Registration</h2>

        <% if (request.getParameter("success") != null) { %>
            <p class="message success">Registration successful! Please login.</p>
        <% } %>
        <% if (request.getParameter("error") != null) { %>
            <p class="message error">Registration failed! Please try again.</p>
        <% } %>

        <form action="register" method="post">
            <label for="matricNo">Matric Number</label>
            <input type="text" id="matricNo" name="matricNo" required>

            <label for="fullName">Full Name</label>
            <input type="text" id="fullName" name="fullName" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
            
            <label for="phone">Phone Number</label>
            <input type="text" id="phone" name="phone">

            <label for="plateNumber">Vehicle Plate Number</label>
            <input type="text" id="plateNumber" name="plateNumber" required>

            
            <button type="submit">Register</button>
        </form>

        <p>Already registered? <a href="login.jsp">Login here</a></p>
    </div>
</body>
</html>
