<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change Password - Mega Cab Service</title>
   
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
            <a href="logout">Logout</a>
        </div>
    </div>

    <!-- Change Password Form -->
    <div class="dashboard-container">
        <h2>Change Password</h2>
        <form action="changeDriverPassword" method="post">
            <label for="currentPassword">Current Password:</label>
            <input type="password" id="currentPassword" name="currentPassword" required>

            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required>

            <label for="confirmPassword">Confirm New Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>

            <button type="submit">Change Password</button>
        </form>
    </div>

</body>
</html>