<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #000; /* Black background */
            color: #FFD700; /* Yellow text */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Form Container */
        .form-container {
            background-color: #1a1a1a; /* Dark gray background */
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(255, 215, 0, 0.2); /* Yellow shadow */
            width: 100%;
            max-width: 400px;
        }

        /* Heading */
        h1 {
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 2rem;
            color: #FFD700; /* Yellow */
        }

        /* Form Input Fields */
        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
            color: #FFD700; /* Yellow */
        }

        .form-group input {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid #FFD700; /* Yellow border */
            border-radius: 5px;
            background-color: #333; /* Dark gray input background */
            color: #FFF; /* White text */
            font-size: 1rem;
        }

        .form-group input:focus {
            outline: none;
            border-color: #FFA500; /* Orange border on focus */
        }

        /* Submit Button */
        button[type="submit"] {
            width: 100%;
            padding: 0.75rem;
            background-color: #FFD700; /* Yellow background */
            color: #000; /* Black text */
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #FFA500; /* Orange on hover */
        }

        /* Hidden Field */
        input[type="hidden"] {
            display: none;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Edit Profile</h1>
        <form method="POST" action="updateProfile">
            <!-- Hidden field for user_id -->
            <input type="hidden" name="user_id" value="${userobj.user_id}">

            <div class="form-group">
                <label for="name">Name:</label> 
                <input type="text" id="name" name="name" placeholder="Enter your name" required value="${userobj.name}">
            </div>
            <div class="form-group">
                <label for="email">Email:</label> 
                <input type="email" id="email" name="email" placeholder="Enter your email" required value="${userobj.email}">
            </div>
            <div class="form-group">
                <label for="nic">NIC:</label> 
                <input type="text" id="nic" name="nic" placeholder="Enter your NIC" required value="${userobj.nic}">
            </div>
            <div class="form-group">
                <label for="password">Password:</label> 
                <input type="password" id="password" name="password" placeholder="Enter your new password" required>
            </div>
            <br>
            <button type="submit">Update</button>
        </form>
    </div>
</body>
</html>