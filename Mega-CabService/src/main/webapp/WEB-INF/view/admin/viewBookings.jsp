<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.megacabservice.entity.Booking, com.megacabservice.dao.BookingDAOImpl, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Bookings</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>All Bookings</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>User Name</th>
                    <th>Pickup Location</th>
                    <th>Drop Location</th>
                    <th>Ride Date</th>
                    <th>Ride Time</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    BookingDAOImpl bookingDAO = new BookingDAOImpl();
                    List<Booking> bookings = bookingDAO.getAllBookings();
                    for (Booking booking : bookings) {
                %>
                <tr>
                    <td><%= booking.getBooking_id() %></td>
                    <td><%= booking.getUser_name() %></td>
                    <td><%= booking.getPickup_location() %></td>
                    <td><%= booking.getDrop_location() %></td>
                    <td><%= booking.getRide_date() %></td>
                    <td><%= booking.getRide_time() %></td>
                    <td><%= booking.getStatus() %></td>
                    <td>
                        <a href="<%= request.getContextPath() %>/admin/editBooking?id=<%= booking.getBooking_id() %>" class="btn btn-warning">Edit</a>
                        <a href="<%= request.getContextPath() %>/admin/deleteBooking?id=<%= booking.getBooking_id() %>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this booking?')">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>