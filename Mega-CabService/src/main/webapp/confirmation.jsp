<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmation</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #000000;
            color: #FFD700;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: #1A1A1A;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.3);
            max-width: 600px;
            width: 100%;
        }
        h2 {
            color: #FFD700;
            margin-bottom: 20px;
            font-size: 28px;
            text-shadow: 0 0 10px rgba(255, 215, 0, 0.3);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
            background-color: #2A2A2A;
        }
        th, td {
            padding: 15px;
            border: 1px solid #FFD700;
            text-align: left;
        }
        th {
            background-color: #333333;
            color: #FFD700;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #242424;
        }
        a {
            display: inline-block;
            padding: 12px 25px;
            background-color: #FFD700;
            color: #000000;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #FFC700;
        }
        .status-confirmed {
            color: #00FF00;
            font-weight: bold;
        }
        .error-message {
            color: #FF0000;
            padding: 15px;
            background-color: #330000;
            border-radius: 5px;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>🚖 Booking Confirmed!</h2>
        <p>Thank you for choosing MegaCab Service. Your ride is secured!</p>
        
        <table>
            <tr><th>Field</th><th>Details</th></tr>
            <%
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    String bookingId = request.getParameter("booking_id");
                    System.out.println("Booking ID from request: " + bookingId);

                    if (bookingId == null || bookingId.isEmpty()) {
                        out.println("<tr><td colspan='2' class='error-message'>No booking ID provided</td></tr>");
                    } else {
                        conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mega_cab_service", "root", "12345");
                        System.out.println("Database connection established.");

                        String sql = "SELECT * FROM bookings WHERE booking_id = ?";
                        stmt = conn.prepareStatement(sql);
                        stmt.setInt(1, Integer.parseInt(bookingId));
                        System.out.println("Executing SQL: " + sql);

                        rs = stmt.executeQuery();

                        if (rs.next()) {
                            System.out.println("Booking found in the database.");
            %>
                            <tr><td>Booking ID</td><td><%= rs.getInt("booking_id") %></td></tr>
                            <tr><td>Passenger Name</td><td><%= rs.getString("user_name") %></td></tr>
                            <tr><td>Pickup Location</td><td>📍 <%= rs.getString("pickup_location") %></td></tr>
                            <tr><td>Drop Location</td><td>🏁 <%= rs.getString("drop_location") %></td></tr>
                            <tr><td>Travel Date</td><td>📅 <%= rs.getDate("ride_date") %></td></tr>
                            <tr><td>Departure Time</td><td>⏰ <%= rs.getTime("ride_time") %></td></tr>
                            <tr><td>Passengers</td><td>👥 <%= rs.getInt("passenger_count") %></td></tr>
                            <tr><td>Luggage</td><td>🎒 <%= rs.getInt("luggage_count") %></td></tr>
                            <tr><td>Payment Method</td><td>💳 <%= rs.getString("payment_type") %></td></tr>
                            <tr><td>Status</td><td class='status-confirmed'>✅ <%= rs.getString("status") %></td></tr>
            <%
                        } else {
                            out.println("<tr><td colspan='2' class='error-message'>No booking found</td></tr>");
                        }
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='2' class='error-message'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </table>
        
        <a href="index.jsp">Return to Home</a>
    </div>
</body>
</html>