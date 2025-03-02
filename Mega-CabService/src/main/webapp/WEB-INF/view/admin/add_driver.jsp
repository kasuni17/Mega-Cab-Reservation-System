<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Driver - Admin</title>
    <style>
        
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #1a1a1a, #000000); 
            margin: 0;
            padding: 0;
            color: #fff; 
        }

       
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background: #2a2a2a; 
            padding-top: 20px;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.5);
        }

        .sidebar a {
            padding: 15px 20px;
            text-decoration: none;
            font-size: 18px;
            color: #fff; 
            display: block;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #444; 
            transform: translateX(10px);
        }

        .sidebar .active {
            background-color: #007bff; 
        }

        
        .content {
            margin-left: 250px;
            padding: 20px;
        }

        
        .form-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 30px;
            background: #2a2a2a; 
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(255, 215, 0, 0.2); 
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-container h2 {
            text-align: center;
            color: #FFD700; 
            margin-bottom: 20px;
            font-size: 2em;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #FFD700; 
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="password"],
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #444; 
            border-radius: 5px;
            background: #333; 
            color: #fff; 
            font-size: 1em;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-group input[type="text"]:focus,
        .form-group input[type="email"]:focus,
        .form-group input[type="password"]:focus,
        .form-group textarea:focus {
            border-color: #FFD700; 
            box-shadow: 0 0 10px rgba(255, 215, 0, 0.5); 
            outline: none;
        }

        .form-group textarea {
            resize: vertical;
        }

        
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-primary {
            background: linear-gradient(135deg, #FFD700, #ffcc00); 
            color: #1a1a1a; 
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #ffcc00, #FFD700); 
            transform: translateY(-2px);
            box-shadow: 0 6px 10px rgba(255, 215, 0, 0.4);
        }

        .btn-secondary {
            background: linear-gradient(135deg, #6c757d, #5a6268); 
            color: #fff; 
            text-decoration: none;
        }

        .btn-secondary:hover {
            background: linear-gradient(135deg, #5a6268, #6c757d); 
            transform: translateY(-2px);
            box-shadow: 0 6px 10px rgba(108, 117, 125, 0.4);
        }

       
        .alert {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-size: 16px;
            animation: slideIn 0.5s ease-in-out;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .alert-success {
            background: linear-gradient(135deg, #d4edda, #c3e6cb);
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert-danger {
            background: linear-gradient(135deg, #f8d7da, #f5c6cb); 
            color: #721c24; 
            border: 1px solid #f5c6cb;
        }

        
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .content {
                margin-left: 0;
            }

            .form-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <a href="view_drivers" class="<%= request.getRequestURI().endsWith("view_drivers.jsp") ? "active" : "" %>">View Drivers</a>
        <a href="addDriver" class="<%= request.getRequestURI().endsWith("add_driver.jsp") ? "active" : "" %>">Add Driver</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <!-- Success and Error Messages -->
        <% String success = (String) session.getAttribute("succMsg");
           String failed = (String) session.getAttribute("failedMsg");
           if (success != null) { %>
            <div class="alert alert-success"><%= success %></div>
            <% session.removeAttribute("succMsg"); } %>
        <% if (failed != null) { %>
            <div class="alert alert-danger"><%= failed %></div>
            <% session.removeAttribute("failedMsg"); } %>

        <!-- Form Container -->
        <div class="form-container">
            <h2>Add New Driver</h2>
            <form action="addDriver" method="post">
                <div class="form-group">
                    <label for="name">Driver Name:</label>
                    <input type="text" id="name" name="name" required>
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>

                <div class="form-group">
                    <label for="license">License Number:</label>
                    <input type="text" id="license" name="license" required>
                </div>

                <div class="form-group">
                    <label for="phone">Phone Number:</label>
                    <input type="text" id="phone" name="phone" required pattern="[0-9]{10}" title="Enter 10-digit phone number">
                </div>

                <div class="form-group">
                    <label for="address">Address:</label>
                    <textarea id="address" name="address" rows="4" required></textarea>
                </div>

                <button type="submit" class="btn btn-primary">Add Driver</button>
                <a href="${pageContext.request.contextPath}/admin/view_drivers.jsp" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>
</body>
</html>