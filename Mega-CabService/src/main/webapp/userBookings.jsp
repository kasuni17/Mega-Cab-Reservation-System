<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Bookings</title>
</head>
<body>
    <h1>Your Bookings</h1>

    <!-- Debug: Print the number of bookings retrieved -->
    <p>Number of bookings: ${userBookings.size()}</p>

    <table border="1">
        <tr>
            <th>Booking ID</th>
            <th>User Name</th>
            <th>Pickup Location</th>
            <th>Drop Location</th>
            <th>Ride Date</th>
            <th>Ride Time</th>
            <th>Status</th>
        </tr>
        <c:forEach var="booking" items="${userBookings}">
            <tr>
                <td>${booking.booking_id}</td>
                <td>${booking.user_name}</td>
                <td>${booking.pickup_location}</td>
                <td>${booking.drop_location}</td>
                <td>${booking.ride_date}</td>
                <td>${booking.ride_time}</td>
                <td>${booking.status}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>