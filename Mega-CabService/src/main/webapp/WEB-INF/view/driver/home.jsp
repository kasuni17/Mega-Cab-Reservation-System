<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Driver Dashboard - Mega Cab Service</title>
   
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            font-size: 16px;
        }

        .navbar a:hover {
            color: #4CAF50;
        }

        .welcome-message {
            text-align: center;
            margin-top: 50px;
            font-size: 24px;
            color: #333;
        }

        .dashboard-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .dashboard-container h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .dashboard-options {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .dashboard-options a {
            background-color: #4CAF50;
            color: white;
            padding: 15px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin: 10px;
            text-align: center;
            flex: 1 1 200px;
        }

        .dashboard-options a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <div>
            <a href="driver/home.jsp">Home</a>
            <a href="driver/profile.jsp">Profile</a>
            <a href="driver/trips.jsp">Trips</a>
        </div>
        <div>
            <a href="login.jsp">Logout</a>
        </div>
    </div>

    <!-- Welcome Message -->
    <div class="welcome-message">
        <h1>Welcome, ${driverobj.name}!</h1>
        <p>You are logged in as a Driver.</p>
    </div>

    <!-- Dashboard Options -->
    <div class="dashboard-container">
        <h2>Driver Dashboard</h2>
        <div class="dashboard-options">
            <a href="profile.jsp">View Profile</a>
            <a href="driver/trips.jsp">View Trips</a>
            <a href="driver/updateProfile.jsp">Update Profile</a>
            <a href="driver/changePassword.jsp">Change Password</a>
        </div>
    </div>

</body>
</html>