<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>My Bookings</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>My Bookings</h1>
    <c:if test="${not empty userBookings}">
        <table>
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
    </c:if>
    <c:if test="${empty userBookings}">
        <p>No bookings found.</p>
        <p>Debug: userBookings is empty or null.</p>
    </c:if>
    <br>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>