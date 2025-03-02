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
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        
        body {
            font-family: 'Arial', sans-serif;
            background-color: #000; 
            color: #FFD700; 
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        
        .form-container {
            background-color: #1a1a1a; 
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(255, 215, 0, 0.2); 
            width: 100%;
            max-width: 400px;
        }

        
        h1 {
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 2rem;
            color: #FFD700; 
        }

        
        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
            color: #FFD700; 
        }

        .form-group input {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid #FFD700; 
            border-radius: 5px;
            background-color: #333; 
            color: #FFF;
            font-size: 1rem;
        }

        .form-group input:focus {
            outline: none;
            border-color: #FFA500; 
        }

        
        button[type="submit"] {
            width: 100%;
            padding: 0.75rem;
            background-color: #FFD700; 
            color: #000; 
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #FFA500; 
        }

        
        input[type="hidden"] {
            display: none;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Edit Profile</h1>
        <form method="POST" action="updateProfile">
           
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