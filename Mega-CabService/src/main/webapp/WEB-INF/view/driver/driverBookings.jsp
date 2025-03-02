<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Bookings</title>
    <style>
       
        body {
            font-family: 'Arial', sans-serif;
            background-color: #000000; 
            color: #FFD700; 
            margin: 0;
            padding: 20px;
        }

        
        h1 {
            text-align: center;
            color: #FFD700; 
            font-size: 2.5em;
            margin-bottom: 20px;
        }

        
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
            background-color: #1A1A1A; 
            color: #FFD700; 
            border: 2px solid #FFD700; 
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #FFD700; 
        }

        th {
            background-color: #333333; 
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:hover {
            background-color: #444444; 
        }

        
        .btn {
            background-color: #FFD700; 
            color: #000000; 
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
            background-color: #FFC300; 
        }

        
        .table-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #1A1A1A; 
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.3); 
        }

        
        footer {
            text-align: center;
            margin-top: 20px;
            color: #FFD700; 
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