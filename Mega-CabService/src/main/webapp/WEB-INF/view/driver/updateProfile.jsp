<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Profile - Mega Cab Service</title>
   
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

    <!-- Update Profile Form -->
    <div class="dashboard-container">
        <h2>Update Profile</h2>
        <form action="updateDriverProfile" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${driverobj.name}" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${driverobj.email}" required>

            <label for="licenseNumber">License Number:</label>
            <input type="text" id="licenseNumber" name="licenseNumber" value="${driverobj.licenseNumber}" required>

            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" value="${driverobj.phoneNumber}" required>

            <label for="address">Address:</label>
            <textarea id="address" name="address" required>${driverobj.address}</textarea>

            <button type="submit">Update Profile</button>
        </form>
    </div>

</body>
</html>