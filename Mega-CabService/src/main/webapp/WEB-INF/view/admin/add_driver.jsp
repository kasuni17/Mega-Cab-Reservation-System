<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Driver - Admin</title>
   
    <style>
        .content {
            margin-left: 250px;
            padding: 20px;
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
    </style>
</head>
<body>
    <div class="sidebar">
        <a href="admin/home.jsp" class="<%= request.getRequestURI().endsWith("home.jsp") ? "active" : "" %>">Dashboard</a>
        <a href="admin/view_drivers.jsp" class="<%= request.getRequestURI().endsWith("view_drivers.jsp") ? "active" : "" %>">View Drivers</a>
        <a href="admin/add_driver.jsp" class="<%= request.getRequestURI().endsWith("add_driver.jsp") ? "active" : "" %>">Add Driver</a>
        <a href="admin/view_users.jsp">View Users</a>
        <a href="admin/view_bookings.jsp">View Bookings</a>
        <a href="logout">Logout</a>
    </div>

    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card card-shadow">
                        <div class="card-header bg-dark text-white">
                            <h4 class="mb-0">Add New Driver</h4>
                        </div>
                        <div class="card-body">
                            <form action="addDriver" method="post">
                                <div class="form-group">
                                    <label>Full Name</label>
                                    <input type="text" name="name" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" name="email" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" name="password" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>License Number</label>
                                    <input type="text" name="license" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Phone Number</label>
                                    <input type="text" name="phone" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <textarea name="address" class="form-control" rows="3" required></textarea>
                                </div>
                                <button class="btn btn-dark">Add Driver</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>