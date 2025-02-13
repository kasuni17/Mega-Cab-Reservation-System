<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Driver Profile - Mega Cab Service</title>
    
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

    <!-- Profile Information -->
    <div class="dashboard-container">
        <h2>Driver Profile</h2>
        <p><strong>Name:</strong> ${driverobj.name}</p>
        <p><strong>Email:</strong> ${driverobj.email}</p>
        <p><strong>License Number:</strong> ${driverobj.licenseNumber}</p>
        <p><strong>Phone Number:</strong> ${driverobj.phoneNumber}</p>
        <p><strong>Address:</strong> ${driverobj.address}</p>
        <p><strong>Status:</strong> ${driverobj.status}</p>
    </div>

</body>
</html>