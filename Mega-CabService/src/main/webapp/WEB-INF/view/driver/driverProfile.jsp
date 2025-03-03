<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.megacabservice.entity.Driver" %>
<%@ page isELIgnored="false" %>
<%
    Driver driver = (Driver) session.getAttribute("driverobj");
    if (driver == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Driver Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #000;
            color: #FFD700;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #222;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(255, 215, 0, 0.5);
            width: 400px;
            text-align: center;
        }
        h1 {
            color: #FFD700;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            margin-bottom: 20px;
        }
        table td {
            padding: 10px;
            text-align: left;
        }
        table td:first-child {
            font-weight: bold;
            color: #FFD700;
        }
        select, input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #FFD700;
            border-radius: 5px;
            background-color: #333;
            color: #FFD700;
        }
        input[type="submit"] {
            background-color: #FFD700;
            color: #000;
            font-weight: bold;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #FFC200;
        }
        a {
            color: #FFD700;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
        }
        a:hover {
            text-decoration: underline;
        }
        .success {
            color: #00FF00;
        }
        .error {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Driver Profile</h1>

        <% if (success != null) { %>
            <p class="success">Status updated successfully!</p>
        <% } %>

        <% if (error != null) { %>
            <p class="error">Failed to update status. Please try again.</p>
        <% } %>

        <form action="${pageContext.request.contextPath}/UpdateDriverStatus" method="post">
            <table>
                <tr>
                    <td>Name:</td>
                    <td><%= driver.getName() %></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><%= driver.getEmail() %></td>
                </tr>
                <tr>
                    <td>License Number:</td>
                    <td><%= driver.getLicenseNumber() %></td>
                </tr>
                <tr>
                    <td>Phone Number:</td>
                    <td><%= driver.getPhoneNumber() %></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><%= driver.getAddress() %></td>
                </tr>
                <tr>
                    <td>Status:</td>
                    <td>
                        <select name="status">
                            <option value="active" <%= driver.getStatus().equals("active") ? "selected" : "" %>>Active</option>
                            <option value="inactive" <%= driver.getStatus().equals("inactive") ? "selected" : "" %>>Inactive</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Update Status">
                    </td>
                </tr>
            </table>
        </form>
        <a href="<%= request.getContextPath() %>/driver/home">Back to Dashboard</a>

    </div>
</body>
</html>