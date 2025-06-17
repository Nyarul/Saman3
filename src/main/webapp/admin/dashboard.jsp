<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="Dao.UserDAO" %>
<%@ page import="Dao.SummonsDAO" %>
<%@ page import="model.Summons" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }

    UserDAO userDAO = new UserDAO();
    List<User> students = userDAO.getAllStudents();

    SummonsDAO summonsDAO = new SummonsDAO();
%>
<html>
    <head>
        <title>Admin Dashboard</title>
        <style>
            /* Container */
            body {
                background-image: url('https://png.pngtree.com/thumb_back/fh260/background/20201029/pngtree-technological-background-concept-and-idea-for-the-internet-of-things-communication-image_443783.jpg'); /* Replace with your actual path */
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                color: #333;
                margin: 0;
                padding: 20px;
            }

            h1 {
                font-size: 28px;
                margin-bottom: 5px;
                color:white
            }

            h2 {
                font-size: 22px;
                margin-top: 20px;
                margin-bottom: 10px;
                color: white;
            }

            /* Table Styles */
            table {
                width: 100%;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            th, td {
                padding: 12px 15px;
                border: 1px solid #e0e0e0;
            }

            th {
                background-color: #007bff;
                color: #fff;
                font-weight: 600;
                text-transform: uppercase;
                font-size: 14px;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #f1f7ff;
            }

            /* List inside table cell */
            ul {
                margin: 5px 0 0 20px;
                padding: 0;
            }

            li {
                margin-bottom: 6px;
                font-size: 14px;
            }

            /* Inline forms/buttons */
            form {
                display: inline-block;
                margin-left: 5px;
            }

            input[type="submit"] {
                background-color: #28a745;
                color: #fff;
                border: none;
                padding: 6px 10px;
                border-radius: 4px;
                font-size: 13px;
                cursor: pointer;
                transition: background-color 0.2s;
            }

            input[type="submit"][value="Delete"] {
                background-color: #dc3545;
            }

            input[type="submit"]:hover {
                opacity: 0.9;
            }

            /* Logout link */
            a.logout {
                display: inline-block;
                margin-top: 20px;
                color: white;
                text-decoration: none;
                font-size: 14px;
            }

            a.logout:hover {
                text-decoration: underline;
                color: white;
            }
        </style>
    </head>
    <body>
        <h1>Welcome,  <%= user.getFullName()%></h1>

        <h2>Student List</h2>
        <table>
            <tr>
                <th>Matric No</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Summons</th>
            </tr>
            <% for (User student : students) {
                    // Fetch the student's summons
                    List<Summons> studentSummons = summonsDAO.getSummonsForStudent(student.getId());
            %>
            <tr>
                <td><%= student.getMatricNo()%></td>
                <td><%= student.getFullName()%></td>
                <td><%= student.getEmail()%></td>
                <td><%= student.getPhone()%></td>
                <td>
                    <% if (studentSummons != null && !studentSummons.isEmpty()) { %>
                    <ul>
                        <% for (Summons summons : studentSummons) {%>
                        <li>
                            <%= summons.getViolationType()%> - <%= summons.getStatus()%>

                            <% if ("Issued".equalsIgnoreCase(summons.getStatus())) {%>
                            <form action="update-summons" method="post">
                                <input type="hidden" name="summonsId" value="<%= summons.getId()%>"/>
                                <input type="hidden" name="status" value="Paid"/>
                                <input type="submit" value="Mark as Paid"/>
                            </form>
                            <form action="update-summons" method="post">
                                <input type="hidden" name="summonsId" value="<%= summons.getId()%>"/>
                                <input type="hidden" name="status" value="Appealed"/>
                                <input type="submit" value="Mark as Appealed"/>
                            </form>
                                
                            
                            <% } %>
                        </li>

                        <% } %>
                    </ul>
                    <% } else { %>
                    No summons
                    <% } %>
                    <form action="delete-user" method="post" style="display:inline;">
                                <input type="hidden" name="userId" value="<%= student.getId()%>"/>
                                <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete this user?');"/>
                            </form>   
                </td>
            </tr>
            <% }%>
        </table>
        <p><a style="color: white" href="../logout">Logout</a></p>
    </body>
</html>
