<%@ page import="com.megacabservice.dao.BookingDAO" %>
<%@ page import="com.megacabservice.dao.BookingDAOImpl" %>
<%@ page import="com.megacabservice.entity.Booking" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Bookings</title>
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
            margin: 20px 0;
            background-color: #1A1A1A; 
            color: #FFD700; 
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

        
        input[type="submit"] {
            background-color: #FFD700; 
            color: #000000; 
            border: none;
            padding: 8px 16px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #FFA500; 
        }

        
        form {
            margin: 0;
        }

       
        @media (max-width: 768px) {
            table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
    <h1>Admin Bookings</h1>
    <table>
        <tr>
            <th>Booking ID</th>
            <th>User Name</th>
            <th>User Email</th>
            <th>Pickup Location</th>
            <th>Drop Location</th>
            <th>Ride Date</th>
            <th>Ride Time</th>
            <th>Passenger Count</th>
            <th>Luggage Count</th>
            <th>Action</th>
        </tr>
        <%
            BookingDAO bookingDAO = new BookingDAOImpl();
            List<Booking> bookings = bookingDAO.getAllBookings();
            for (Booking booking : bookings) {
        %>
        <tr>
            <td><%= booking.getBooking_id() %></td>
            <td><%= booking.getUser_name() %></td>
            <td><%= booking.getUser_email() %></td>
            <td><%= booking.getPickup_location() %></td>
            <td><%= booking.getDrop_location() %></td>
            <td><%= booking.getRide_date() %></td>
            <td><%= booking.getRide_time() %></td>
            <td><%= booking.getPassenger_count() %></td>
            <td><%= booking.getLuggage_count() %></td>
            <td>
                <!-- Corrected form action -->
                <form action="<%= request.getContextPath() %>/admin/generateBill" method="post">
                    <input type="hidden" name="bookingId" value="<%= booking.getBooking_id() %>">
                    <input type="submit" value="Generate Bill">
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>