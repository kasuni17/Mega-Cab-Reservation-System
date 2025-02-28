<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> <!-- Enable EL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Booking</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #000000; /* Black background */
            color: #FFD700; /* Yellow text */
            font-family: 'Arial', sans-serif;
        }
        .container {
            background-color: #1A1A1A; /* Dark gray container */
            padding: 2rem;
            border-radius: 10px;
            margin-top: 2rem;
            box-shadow: 0 4px 8px rgba(255, 215, 0, 0.2); /* Yellow shadow */
        }
        h2 {
            color: #FFD700; /* Yellow heading */
            text-align: center;
            margin-bottom: 1.5rem;
        }
        .form-control {
            background-color: #333333; /* Dark gray input background */
            color: #FFD700; /* Yellow text */
            border: 1px solid #FFD700; /* Yellow border */
        }
        .form-control:focus {
            background-color: #444444; /* Slightly lighter gray on focus */
            color: #FFD700;
            border-color: #FFD700;
            box-shadow: 0 0 8px rgba(255, 215, 0, 0.6); /* Yellow glow on focus */
        }
        .btn-primary {
            background-color: #FFD700; /* Yellow button */
            border-color: #FFD700;
            color: #000000; /* Black text */
            font-weight: bold;
        }
        .btn-primary:hover {
            background-color: #FFC700; /* Slightly darker yellow on hover */
            border-color: #FFC700;
        }
        label {
            color: #FFD700; /* Yellow labels */
        }
        select.form-control {
            background-color: #333333;
            color: #FFD700;
            border: 1px solid #FFD700;
        }
        select.form-control:focus {
            background-color: #444444;
            border-color: #FFD700;
            box-shadow: 0 0 8px rgba(255, 215, 0, 0.6);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Booking</h2>
        <form action="${pageContext.request.contextPath}/admin/editBooking" method="POST">
            <input type="hidden" name="booking_id" value="${booking.booking_id}" />
            
            <div class="form-group">
                <label for="user_name">User Name:</label>
                <input type="text" class="form-control" id="user_name" name="user_name" value="${booking.user_name}" required>
            </div>
            <div class="form-group">
                <label for="user_email">User Email:</label>
                <input type="email" class="form-control" id="user_email" name="user_email" value="${booking.user_email}" required>
            </div>
            <div class="form-group">
                <label for="user_phone">User Phone:</label>
                <input type="text" class="form-control" id="user_phone" name="user_phone" value="${booking.user_phone}" required>
            </div>
            <div class="form-group">
                <label for="user_address">User Address:</label>
                <input type="text" class="form-control" id="user_address" name="user_address" value="${booking.user_address}" required>
            </div>
            <div class="form-group">
                <label for="pickup_location">Pickup Location:</label>
                <input type="text" class="form-control" id="pickup_location" name="pickup_location" value="${booking.pickup_location}" required>
            </div>
            <div class="form-group">
                <label for="drop_location">Drop Location:</label>
                <input type="text" class="form-control" id="drop_location" name="drop_location" value="${booking.drop_location}" required>
            </div>
            <div class="form-group">
                <label for="ride_date">Ride Date:</label>
                <input type="date" class="form-control" id="ride_date" name="ride_date" value="<fmt:formatDate value='${booking.ride_date}' pattern='yyyy-MM-dd' />" required>
            </div>
            <div class="form-group">
                <label for="ride_time">Ride Time:</label>
                <input type="time" class="form-control" id="ride_time" name="ride_time" value="<fmt:formatDate value='${booking.ride_time}' pattern='HH:mm' />" required>
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <select class="form-control" id="status" name="status" required>
                    <option value="assigned" ${booking.status == 'assigned' ? 'selected' : ''}>Assigned</option>
                    <option value="completed" ${booking.status == 'completed' ? 'selected' : ''}>Completed</option>
                    <option value="canceled" ${booking.status == 'canceled' ? 'selected' : ''}>Canceled</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Update Booking</button>
        </form>
    </div>
</body>
</html>