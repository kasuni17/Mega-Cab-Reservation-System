<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.megacabservice.entity.Booking, com.megacabservice.dao.BookingDAOImpl, java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Bookings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
       
        body {
            background: #000;
            font-family: 'Poppins', sans-serif;
            color: #fff;
            margin: 0;
            padding: 0;
        }

        .container {
            margin-top: 50px;
            padding: 20px;
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        h2 {
            text-align: center;
            font-weight: bold;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: #ffc107;
        }

        .table {
            border-radius: 10px;
            overflow: hidden;
        }

        .table thead {
            background: #ffc107;
            color: #000;
        }

        .table tbody tr {
            transition: 0.3s ease;
        }

        .table tbody tr:hover {
            background: rgba(255, 193, 7, 0.1);
            transform: scale(1.02);
            box-shadow: 0 2px 10px rgba(255, 193, 7, 0.2);
        }

        .btn-custom {
            padding: 8px 12px;
            border-radius: 8px;
            font-weight: bold;
            text-transform: uppercase;
            transition: 0.3s ease;
        }

        .btn-warning {
            background: linear-gradient(135deg, #ffc107, #ffdd57);
            color: #000;
            border: none;
        }

        .btn-danger {
            background: linear-gradient(135deg, #dc3545, #ff5c75);
            color: #fff;
            border: none;
        }

        .btn-warning:hover, .btn-danger:hover {
            transform: scale(1.05);
        }

        .btn-back {
            display: block;
            width: 150px;
            margin: 20px auto;
            text-align: center;
            background: linear-gradient(135deg, #ffc107, #ffdd57);
            color: #000;
            font-weight: bold;
            padding: 10px 15px;
            border-radius: 8px;
            text-decoration: none;
            transition: 0.3s ease;
        }

        .btn-back:hover {
            transform: scale(1.05);
        }

        
        @media (max-width: 768px) {
            .table {
                font-size: 14px;
            }
            .btn-custom {
                padding: 5px 10px;
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>All Bookings</h2>
        <div class="table-responsive">
            <table class="table table-dark table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>User Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Pickup</th>
                        <th>Drop</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Passengers</th>
                        <th>Luggage</th>
                        <th>Payment</th>
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
                        <td><%= booking.getUser_email() %></td>
                        <td><%= booking.getUser_phone() %></td>
                        <td><%= booking.getPickup_location() %></td>
                        <td><%= booking.getDrop_location() %></td>
                        <td><%= booking.getRide_date() %></td>
                        <td><%= booking.getRide_time() %></td>
                        <td><%= booking.getPassenger_count() %></td>
                        <td><%= booking.getLuggage_count() %></td>
                        <td><%= booking.getPayment_type() %></td>
                        <td><%= booking.getStatus() %></td>
                        <td>
                            <a href="<%= request.getContextPath() %>/admin/editBooking?id=<%= booking.getBooking_id() %>" class="btn btn-warning btn-custom">Edit</a>
                            <a href="<%= request.getContextPath() %>/admin/deleteBooking?id=<%= booking.getBooking_id() %>" class="btn btn-danger btn-custom" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        
    </div>
</body>
</html>
