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
</head>
<body>
    <div class="container">
        <h2>Edit Booking</h2>
        <form action="<%= request.getContextPath() %>/admin/editBooking" method="POST">
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
                <input type="text" class="form-control" id="status" name="status" value="${booking.status}" required>
            </div>
            <button type="submit" class="btn btn-primary">Update Booking</button>
        </form>
    </div>
</body>
</html>