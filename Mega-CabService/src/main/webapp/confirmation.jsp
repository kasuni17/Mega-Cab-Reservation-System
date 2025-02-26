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
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #ccc; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Booking Confirmed!</h2>
        <p>Thank you for booking your ride with us.</p>
        <p>Your booking details:</p>
        <table>
            <tr><th>Field</th><th>Details</th></tr>
            <%
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    // Retrieve the booking_id from the request
                    String bookingId = request.getParameter("booking_id");
                    System.out.println("Booking ID from request: " + bookingId); // Debug statement

                    if (bookingId == null || bookingId.isEmpty()) {
                        out.println("<tr><td colspan='2'>No booking ID provided.</td></tr>");
                    } else {
                        // Establish database connection
                        conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mega_cab_service", "root", "12345");
                        System.out.println("Database connection established."); // Debug statement

                        // Prepare SQL query
                        String sql = "SELECT * FROM bookings WHERE booking_id = ?";
                        stmt = conn.prepareStatement(sql);
                        stmt.setInt(1, Integer.parseInt(bookingId));
                        System.out.println("Executing SQL: " + sql); // Debug statement

                        // Execute query
                        rs = stmt.executeQuery();

                        // Check if the booking exists
                        if (rs.next()) {
                            System.out.println("Booking found in the database."); // Debug statement
            %>
                            <tr><td>Booking ID</td><td><%= rs.getInt("booking_id") %></td></tr>
                            <tr><td>Name</td><td><%= rs.getString("user_name") %></td></tr>
                            <tr><td>Pickup</td><td><%= rs.getString("pickup_location") %></td></tr>
                            <tr><td>Drop</td><td><%= rs.getString("drop_location") %></td></tr>
                            <tr><td>Date</td><td><%= rs.getDate("ride_date") %></td></tr>
                            <tr><td>Time</td><td><%= rs.getTime("ride_time") %></td></tr>
                            <tr><td>Passengers</td><td><%= rs.getInt("passenger_count") %></td></tr>
                            <tr><td>Luggage</td><td><%= rs.getInt("luggage_count") %></td></tr>
                            <tr><td>Payment</td><td><%= rs.getString("payment_type") %></td></tr>
                            <tr><td>Status</td><td><%= rs.getString("status") %></td></tr>
            <%
                        } else {
                            System.out.println("No booking found with the provided ID."); // Debug statement
                            out.println("<tr><td colspan='2'>No booking found with the provided ID.</td></tr>");
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<tr><td colspan='2'>An error occurred while retrieving booking details: " + e.getMessage() + "</td></tr>");
                } finally {
                    // Close database resources
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                    System.out.println("Database resources closed."); // Debug statement
                }
            %>
        </table>
        <br>
        <a href="index.jsp">Return to Home</a>
    </div>
</body>
</html>