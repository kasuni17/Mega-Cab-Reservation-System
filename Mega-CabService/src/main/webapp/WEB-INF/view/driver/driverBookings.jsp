<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Bookings</title>
    <style>
        /* General body styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #000000; /* Black background */
            color: #FFD700; /* Yellow text */
            margin: 0;
            padding: 20px;
        }

        /* Heading styling */
        h1 {
            text-align: center;
            color: #FFD700; /* Yellow */
            font-size: 2.5em;
            margin-bottom: 20px;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
            background-color: #1A1A1A; /* Dark gray background */
            color: #FFD700; /* Yellow text */
            border: 2px solid #FFD700; /* Yellow border */
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #FFD700; /* Yellow border */
        }

        th {
            background-color: #333333; /* Dark gray header */
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:hover {
            background-color: #444444; /* Light gray hover effect */
        }

        /* Button styling (if you add buttons later) */
        .btn {
            background-color: #FFD700; /* Yellow */
            color: #000000; /* Black */
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 0;
            cursor: pointer;
            border-radius: 5px;
        }

        .btn:hover {
            background-color: #FFC300; /* Darker yellow on hover */
        }

        /* Container for the table */
        .table-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #1A1A1A; /* Dark gray */
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.3); /* Yellow shadow */
        }

        /* Footer styling (optional) */
        footer {
            text-align: center;
            margin-top: 20px;
            color: #FFD700; /* Yellow */
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <h1>Your Assigned Bookings</h1>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>User Name</th>
                    <th>Pickup Location</th>
                    <th>Drop Location</th>
                    <th>Ride Date</th>
                    <th>Ride Time</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${driverBookings}">
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
            </tbody>
        </table>
    </div>
    <!-- Optional Footer -->
    <footer>
        &copy; 2024 Mega Cab Service. All rights reserved.
    </footer>
</body>
</html>