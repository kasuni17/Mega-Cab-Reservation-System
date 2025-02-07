<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Taxi Service Admin Panel</title>
<!-- Add Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    /* General Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Arial', sans-serif;
        background-color: #1a1a1a; /* Dark background */
        color: #fff;
    }

    /* Navbar Styling */
    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #000000; /* Black */
        padding: 10px 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
    }

    /* Logo Styling */
    .logo img {
        height: 50px;
        transition: transform 0.3s ease;
    }

    .logo img:hover {
        transform: scale(1.1);
    }

    /* Nav Links Styling */
    .nav-links {
        list-style: none;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-grow: 1;
    }

    .nav-links li {
        margin: 0 15px;
    }

    .nav-links a {
        text-decoration: none;
        color: #FFD700; /* Yellow */
        font-size: 18px;
        padding: 10px 15px;
        border-radius: 5px;
        transition: all 0.3s ease;
        position: relative;
    }

    /* Hover effect for nav links */
    .nav-links a::after {
        content: '';
        position: absolute;
        width: 0;
        height: 2px;
        background: #FFD700; /* Yellow */
        bottom: 0;
        left: 50%;
        transition: all 0.3s ease;
    }

    .nav-links a:hover::after {
        width: 100%;
        left: 0;
    }

    .nav-links a:hover {
        color: #ffffff; /* White */
        background-color: rgba(255, 215, 0, 0.1); /* Light yellow overlay */
    }

    /* Home Button Styling */
    .home-button {
        font-weight: bold;
    }

    /* Logout Button Styling */
    .logout {
        display: flex;
        align-items: center;
    }

    .logout-button {
        text-decoration: none;
        color: #000000; /* Black */
        font-size: 18px;
        padding: 10px 20px;
        border-radius: 30px; /* Rounded corners */
        background-color: #FFD700; /* Yellow */
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
        border: 2px solid transparent;
        box-shadow: 0 4px 6px rgba(255, 215, 0, 0.3);
        display: flex;
        align-items: center;
        gap: 8px; /* Space between icon and text */
        font-weight: bold; /* Bold text */
    }

    /* Hover effect for logout button */
    .logout-button::before {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        width: 300%;
        height: 300%;
        background: radial-gradient(circle, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0) 70%);
        transform: translate(-50%, -50%) scale(0);
        transition: transform 0.5s ease, opacity 0.5s ease;
        opacity: 0;
        border-radius: 50%;
    }

    .logout-button:hover::before {
        transform: translate(-50%, -50%) scale(1);
        opacity: 1;
    }

    .logout-button:hover {
        background-color: #FFA500; /* Orange-yellow for hover */
        border-color: #ffffff; /* White border */
        box-shadow: 0 6px 12px rgba(255, 165, 0, 0.5);
        transform: translateY(-2px);
    }

    /* Animation for Navbar */
    @keyframes slideIn {
        from {
            opacity: 0;
            transform: translateY(-50px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .navbar {
        animation: slideIn 0.5s ease-out;
    }
</style>
</head>
<body>
    <nav class="navbar">
        <!-- Logo on the left -->
        <div class="logo">
            <img src="/Mega-CabService/images/background/logo3.png" alt="Taxi Service Logo">
        </div>
        <!-- Home button in the middle -->
        <ul class="nav-links">
            <li><a href="/Mega-CabService/admin/home.jsp" class="home-button">Home</a>
</li>
        </ul>
        <!-- Logout button on the right -->
        <div class="logout">
            <a href="#" class="logout-button">
                <i class="fas fa-sign-out-alt"></i> <!-- Font Awesome logout icon -->
                Logout
            </a>
        </div>
    </nav>
</body>
</html>