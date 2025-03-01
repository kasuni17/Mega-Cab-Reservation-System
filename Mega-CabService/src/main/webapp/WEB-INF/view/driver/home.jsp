<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Driver Dashboard - Mega Cab Service</title>
    <!-- Add Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #0A0A23; /* Midnight blue background */
            color: #E0E0E0; /* Light gray text */
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #1A1A2E; /* Dark blue navbar */
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        }

        .navbar a {
            color: #E0E0E0;
            text-decoration: none;
            margin: 0 15px;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        .navbar a:hover {
            color: #00BFFF; /* Bright blue hover effect */
        }

        .welcome-message {
            text-align: center;
            margin-top: 60px;
            font-size: 28px;
            color: #E0E0E0;
        }

        .welcome-message h1 {
            color: #00BFFF; /* Bright blue for the heading */
            margin-bottom: 10px;
        }

        .dashboard-container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 30px;
            background-color: #1A1A2E; /* Dark blue container */
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
        }

        .dashboard-container h2 {
            color: #00BFFF; /* Bright blue for the heading */
            margin-bottom: 25px;
            text-align: center;
            font-size: 26px;
        }

        .dashboard-options {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }

        .dashboard-options a {
            background-color: #00BFFF; /* Bright blue buttons */
            color: #1A1A2E; /* Dark blue text */
            padding: 20px 25px;
            text-decoration: none;
            border-radius: 10px;
            text-align: center;
            flex: 1 1 200px;
            font-size: 18px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px; /* Space between icon and text */
        }

        .dashboard-options a:hover {
            background-color: #009ACD; /* Slightly darker blue on hover */
            transform: translateY(-5px); /* Lift effect on hover */
            box-shadow: 0 5px 15px rgba(0, 191, 255, 0.4);
        }

        .dashboard-options a i {
            font-size: 20px; /* Icon size */
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <div>
            <a href="driver/home.jsp">Home</a>
            <a href="dprofile.jsp">Profile</a>
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
            <a href="${pageContext.request.contextPath}/driverProfile">
                <i class="fas fa-user"></i> <!-- Icon for View Profile -->
                View Profile
            </a>
            <a href="driver/trips.jsp">
                <i class="fas fa-road"></i> <!-- Icon for View Trips -->
                View Trips
            </a>
            <a href="driver/updateProfile.jsp">
                <i class="fas fa-edit"></i> <!-- Icon for Update Profile -->
                Update Profile
            </a>
            <a href="driver/changePassword.jsp">
                <i class="fas fa-key"></i> <!-- Icon for Change Password -->
                Change Password
            </a>
        </div>
    </div>

</body>
</html>