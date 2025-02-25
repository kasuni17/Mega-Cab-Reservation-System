<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.megacabservice.entity.user" %>
<!DOCTYPE html>
<html>
<head>
    <title>User & Payment Info</title>
    <script>
        function toggleCardDetails() {
            var paymentType = document.querySelector('input[name="payment_type"]:checked').value;
            document.getElementById("cardDetails").style.display = (paymentType === "card") ? "block" : "none";
        }
    </script>
</head>
<body>
    <h2>Enter Your Details</h2>
    <form action="BookingServlet" method="post">
        <%
            // Retrieve the logged-in user from the session
            user loggedInUser = (user) session.getAttribute("userobj");
            if (loggedInUser != null) {
        %>
        <!-- User Details (Pre-filled from session) -->
        Name: <input type="text" name="user_name" value="<%= loggedInUser.getName() %>" required><br>
        Email: <input type="email" name="user_email" value="<%= loggedInUser.getEmail() %>" required><br>
        Phone: <input type="text" name="user_phone" value="<%= loggedInUser.getPhoneNumber() %>" required><br>
        Address: <textarea name="user_address"><%= loggedInUser.getAddress() %></textarea><br>
        <input type="hidden" name="user_id" value="<%= loggedInUser.getUser_id() %>">
        <%
            } else {
                // If no user is logged in, redirect to the login page
                response.sendRedirect("login.jsp");
            }
        %>

        <!-- Hidden Fields for Ride Details -->
        <input type="hidden" name="pickup_location" value="<%= request.getParameter("pickup_location") %>">
        <input type="hidden" name="drop_location" value="<%= request.getParameter("drop_location") %>">
        <input type="hidden" name="ride_date" value="<%= request.getParameter("ride_date") %>">
        <input type="hidden" name="ride_time" value="<%= request.getParameter("ride_time") %>">
        <input type="hidden" name="passenger_count" value="<%= request.getParameter("passenger_count") %>">
        <input type="hidden" name="luggage_count" value="<%= request.getParameter("luggage_count") %>">
        <input type="hidden" name="driver_id" value="<%= request.getParameter("driver_id") %>">
        <input type="hidden" name="cab_id" value="<%= request.getParameter("cab_id") %>">

        <!-- Payment Details -->
        Payment Type: 
        <input type="radio" name="payment_type" value="cash" onclick="toggleCardDetails();" checked>Cash 
        <input type="radio" name="payment_type" value="card" onclick="toggleCardDetails();">Card

        <div id="cardDetails" style="display: none;">
            Card Number: <input type="text" name="card_number"><br>
            Expiry Date: <input type="date" name="card_expiry"><br>
            CVC: <input type="text" name="card_cvc"><br>
        </div>

        <button type="submit">Book Now</button>
    </form>
</body>
</html>