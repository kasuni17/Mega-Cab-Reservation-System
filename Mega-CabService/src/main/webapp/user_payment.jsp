<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.megacabservice.entity.user" %>
<!DOCTYPE html>
<html>
<head>
    <title>User & Payment Info</title>
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
            height: 100vh;
        }
        .container {
            background-color: #1A1A1A;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.5);
            width: 400px;
        }
        h2 {
            color: #FFD700;
            text-align: center;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="email"], input[type="date"], textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #FFD700;
            border-radius: 5px;
            background-color: #333333;
            color: #FFD700;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #FFD700;
            color: #000000;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #FFC700;
        }
        .card-details {
            display: none;
            margin-top: 10px;
        }
        .card-details input {
            margin-bottom: 10px;
        }
    </style>
    <script>
        function toggleCardDetails() {
            var paymentType = document.querySelector('input[name="payment_type"]:checked').value;
            document.getElementById("cardDetails").style.display = (paymentType === "card") ? "block" : "none";
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Enter Your Details</h2>
        <form action="BookingServlet" method="post">
            <%
                user loggedInUser = (user) session.getAttribute("userobj");
                if (loggedInUser != null) {
            %>
            Name: <input type="text" name="user_name" value="<%= loggedInUser.getName() %>" required><br>
            Email: <input type="email" name="user_email" value="<%= loggedInUser.getEmail() %>" required><br>
            Phone: <input type="text" name="user_phone" value="<%= loggedInUser.getPhoneNumber() %>" required><br>
            Address: <textarea name="user_address"><%= loggedInUser.getAddress() %></textarea><br>
            <input type="hidden" name="user_id" value="<%= loggedInUser.getUser_id() %>">
            <%
                } else {
                    response.sendRedirect("login.jsp");
                }
            %>
            <input type="hidden" name="pickup_location" value="<%= request.getParameter("pickup_location") %>">
            <input type="hidden" name="drop_location" value="<%= request.getParameter("drop_location") %>">
            <input type="hidden" name="ride_date" value="<%= request.getParameter("ride_date") %>">
            <input type="hidden" name="ride_time" value="<%= request.getParameter("ride_time") %>">
            <input type="hidden" name="passenger_count" value="<%= request.getParameter("passenger_count") %>">
            <input type="hidden" name="luggage_count" value="<%= request.getParameter("luggage_count") %>">
            <input type="hidden" name="driver_id" value="<%= request.getParameter("driver_id") %>">
            <input type="hidden" name="cab_id" value="<%= request.getParameter("cab_id") %>">
            Payment Type: 
            <input type="radio" name="payment_type" value="cash" onclick="toggleCardDetails();" checked>Cash 
            <input type="radio" name="payment_type" value="card" onclick="toggleCardDetails();">Card
            <div id="cardDetails" class="card-details">
                Card Number: <input type="text" name="card_number"><br>
                Expiry Date: <input type="date" name="card_expiry"><br>
                CVC: <input type="text" name="card_cvc"><br>
            </div>
            <button type="submit">Book Now</button>
        </form>
    </div>
</body>
</html>