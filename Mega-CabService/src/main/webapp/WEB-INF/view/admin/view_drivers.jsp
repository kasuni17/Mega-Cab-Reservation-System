<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Drivers - Admin</title>
    <style>
        .card-shadow {
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .action-btn {
            width: 100px;
        }
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            padding-top: 20px;
        }
        .sidebar a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .sidebar .active {
            background-color: #007bff;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
        .alert {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 4px;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
        }
        .table th, .table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .table th {
            background-color: #f2f2f2;
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
        <div class="container-fluid p-4">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-shadow">
                        <div class="card-header bg-dark text-white">
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
                            <table class="table table-bordered">
                                <thead class="bg-light">
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
                                                   class="btn btn-danger btn-sm action-btn"
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
            </div>
        </div>
    </div>
</body>
</html>