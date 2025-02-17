<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Home</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <!-- Font Awesome Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* Red top row */
       

        /* User card styling */
        .user-card {
           
            color: #fff;
            border-radius: 10px; /* Reduced radius */
            padding: 10px; /* Reduced padding */
            text-align: left;
           
           
            cursor: pointer;
            position: fixed;
            top: 0px; /* Adjust top to make room for the red top row */
            right: 150px; /* Position it to the right side */
            width: 100px; /* Smaller width */
            z-index: 1001;
            height: 80px;
        }
        
        .user-card p {
            margin: 8px 0;
            font-size: 0.9em; /* Smaller font size */
            display: none;
        }
        .user-icon {
            font-size: 50px; /* Icon size */
            margin: 10px 0;
            text-align: center;
        }
        .update-button {
            margin-top: 10px;
            padding: 6px 12px; /* Smaller button */
            border: none;
            border-radius: 10px;
            background: #fff;
            color: red;
            font-size: 0.8em; /* Smaller font size */
            cursor: pointer;
            transition: background 0.3s;
            text-decoration: none;
            display: none;
        }
        .update-button:hover {
            background: #ccc;
            color: #000;
        }
    </style>
    <script>
        function toggleDetails() {
            const details = document.querySelectorAll('.user-card p');
            const button = document.querySelector('.update-button');
            details.forEach(detail => detail.style.display = detail.style.display === 'none' ? 'block' : 'none');
            button.style.display = button.style.display === 'none' ? 'inline-block' : 'none';
        }
    </script>
</head>
<body>
    <!-- Red top row -->
    <div class="top-row"></div>

    <!-- User card positioned at the top-right corner -->
    <div class="user-card" onclick="toggleDetails()">
        <div class="user-icon">
            <!-- Font Awesome user icon -->
            <i class="fa fa-user" aria-hidden="true"></i>
        </div>
        
        <c:if test="${not empty userobj}">
            <p><strong>Name:</strong> ${userobj.name}</p>
            <p><strong>Email:</strong> ${userobj.email}</p>
        </c:if>
        <a href="updateProfile.jsp" class="update-button">Update Profile</a>
    </div>

    
</body>
</html>

