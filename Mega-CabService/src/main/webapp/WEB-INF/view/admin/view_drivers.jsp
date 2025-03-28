<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Drivers - Admin</title>
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

        
        .card-shadow {
            background: #2a2a2a; 
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(255, 215, 0, 0.2); 
            padding: 20px;
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

        .card-header {
            background: linear-gradient(135deg, #FFD700, #ffcc00); 
            color: #1a1a1a;
            padding: 15px;
            border-radius: 10px 10px 0 0;
            font-size: 1.5em;
            font-weight: bold;
        }

       
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .table th, .table td {
            padding: 12px;
            border: 1px solid #444;
            text-align: left;
        }

        .table th {
            background: linear-gradient(135deg, #FFD700, #ffcc00); 
            color: #1a1a1a; 
            font-weight: bold;
        }

        .table tr:nth-child(even) {
            background-color: rgba(255, 215, 0, 0.05); 
        }

        .table tr:hover {
            background-color: rgba(255, 215, 0, 0.1); 
            transform: scale(1.01);
            transition: transform 0.2s ease-in-out, background-color 0.3s ease;
        }

        
        .action-btn {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-danger {
            background: linear-gradient(135deg, #DC3545, #a71d2a); 
            color: #fff; 
        }

        .btn-danger:hover {
            background: linear-gradient(135deg, #a71d2a, #DC3545); 
            transform: translateY(-2px);
            box-shadow: 0 6px 10px rgba(220, 53, 69, 0.4);
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

            .table th, .table td {
                padding: 8px;
            }
        }
    </style>
</head>
<body>
<%@include file="Navbar.jsp"%>
    <!-- Sidebar -->
    <div class="sidebar">
     <a href="${pageContext.request.contextPath}/home">Back to Dashboard</a>
        <a href="view_drivers" class="<%= request.getRequestURI().endsWith("view_drivers.jsp") ? "active" : "" %>">View Drivers</a>
        <a href="addDriver" class="<%= request.getRequestURI().endsWith("add_driver.jsp") ? "active" : "" %>">Add Driver</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <div class="card-shadow">
            <div class="card-header">
                <h4 class="mb-0">All Drivers</h4>
            </div>
            <div class="card-body">
                <!-- Success and Error Messages -->
                <c:if test="${not empty succMsg}">
                    <div class="alert alert-success">${succMsg}</div>
                    <c:remove var="succMsg" scope="session"/>
                </c:if>
                <c:if test="${not empty failedMsg}">
                    <div class="alert alert-danger">${failedMsg}</div>
                    <c:remove var="failedMsg" scope="session"/>
                </c:if>

                <!-- Drivers Table -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>License No</th>
                            <th>Phone</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${driverList}" var="driver">
                            <tr>
                                <td>${driver.driverId}</td>
                                <td>${driver.name}</td>
                                <td>${driver.email}</td>
                                <td>${driver.licenseNumber}</td>
                                <td>${driver.phoneNumber}</td>
                                <td>${driver.status}</td>
                                <td>
                                    <a href="deleteDriver?id=${driver.driverId}" 
                                       class="action-btn btn-danger"
                                       onclick="return confirm('Are you sure you want to delete this driver?')">
                                        Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>