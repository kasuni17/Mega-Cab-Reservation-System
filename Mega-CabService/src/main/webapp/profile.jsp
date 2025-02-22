<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.megacabservice.entity.user" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .profile-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        .profile-container h2 {
            margin-bottom: 20px;
        }
        .profile-container p {
            text-align: left;
            margin: 10px 0;
        }
        .profile-container strong {
            display: inline-block;
            width: 100px;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <%
        // Retrieve the user object from the session
        user user = (user) session.getAttribute("user");
        if (user == null) {
            // Redirect to login page if the user is not logged in
            response.sendRedirect("profile.jsp");
            return;
        }

        // Format the created_at timestamp
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createdAt = dateFormat.format(user.getCreatedAt());
    %>
    <div class="profile-container">
        <h2>User Profile</h2>
        <p><strong>ID:</strong> <%= user.getUser_id() %></p>
        <p><strong>Name:</strong> <%= user.getName() %></p>
        <p><strong>Email:</strong> <%= user.getEmail() %></p>
        <p><strong>Phone:</strong> <%= user.getPhoneNumber() %></p>
        <p><strong>NIC:</strong> <%= user.getNic() %></p>
        <p><strong>Address:</strong> <%= user.getAddress() %></p>
        <p><strong>Joined:</strong> <%= createdAt %></p>

        <!-- Link to edit profile -->
        <a href="editProfile.jsp" class="btn">Edit Profile</a>
    </div>
</body>
</html>