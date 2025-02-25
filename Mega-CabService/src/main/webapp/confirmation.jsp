<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmation</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }
        .container { max-width: 500px; margin: auto; padding: 20px; border: 1px solid #ccc; border-radius: 10px; }
        h2 { color: green; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Booking Confirmed!</h2>
        <p>Thank you for booking your ride with us.</p>
        <p>Your booking details:</p>
        <table border="1" align="center">
            <tr><th>Field</th><th>Details</th></tr>
            <%
                try {
                    String bookingId = request.getParameter("booking_id");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mega_cab_service", "root", "12345");
                    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM booking WHERE booking_id = ?");
                    stmt.setInt(1, Integer.parseInt(bookingId));
                    ResultSet rs = stmt.executeQuery();
                    if (rs.next()) {
            %>
                        <tr><td>Booking ID</td><td><%= rs.getInt("booking_id") %></td></tr>
                        <tr><td>Name</td><td><%= rs.getString("user_name") %></td></tr>
                        <tr><td>Pickup</td><td><%= rs.getString("pickup_location") %></td></tr>
                        <tr><td>Drop</td><td><%= rs.getString("drop_location") %></td></tr>
                        <tr><td>Date</td><td><%= rs.getDate("ride_date") %></td></tr>
                        <tr><td>Time</td><td><%= rs.getTime("ride_time") %></td></tr>
                        <tr><td>Payment</td><td><%= rs.getString("payment_type") %></td></tr>
                        <tr><td>Status</td><td><%= rs.getString("status") %></td></tr>
            <%
                    }
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
        <br>
        <a href="index.jsp">Return to Home</a>
    </div>
</body>
</html>
