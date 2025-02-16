<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>View Cabs</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #000;
            color: #FFD700;
            margin: 0;
            padding: 0;
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: #1a1a1a;
            padding: 20px;
            box-shadow: 2px 0 10px rgba(255, 215, 0, 0.5);
        }

        .sidebar h2 {
            color: #FFD700;
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar a {
            color: #FFD700;
            text-decoration: none;
            display: block;
            padding: 12px;
            margin: 8px 0;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #333;
            transform: translateX(5px);
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            padding: 30px;
            overflow-x: auto;
        }

        .container {
            background-color: #1a1a1a;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.5);
            animation: fadeIn 0.5s ease-in-out;
        }

        h1 {
            font-size: 2.5rem;
            margin-bottom: 2rem;
            color: #FFD700;
            text-align: center;
        }

        /* Table Styles */
        .cab-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .cab-table th,
        .cab-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #333;
        }

        .cab-table th {
            background-color: #333;
            font-weight: bold;
        }

        .cab-table tr:hover {
            background-color: #222;
        }

        .cab-table img {
            width: 100px;
            border-radius: 5px;
            box-shadow: 0 0 8px rgba(255, 215, 0, 0.3);
        }

        /* Action Buttons */
        .action-buttons a {
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 4px;
            margin: 0 5px;
            transition: all 0.3s ease;
        }

        .edit-btn {
            background-color: #FFD700;
            color: #000;
        }

        .delete-btn {
            background-color: #ff4444;
            color: white;
        }

        .action-buttons a:hover {
            opacity: 0.8;
            transform: scale(1.05);
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Panel</h2>
        <a href="viewCabs">View Cabs</a>
        <a href="${pageContext.request.contextPath}/AddCabServlet">Add New Cab</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <h1>Cab List</h1>
            
            <table class="cab-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Description</th>
                        <th>Capacity</th>
                        <th>Use Case</th>
                        <th>Fare Range</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cab" items="${cabs}">
                        <tr>
                            <td>${cab.id}</td>
                            <td>${cab.name}</td>
                            <td><img src="${cab.image}" alt="Cab Image"></td>
                            <td>${cab.description}</td>
                            <td>${cab.capacity}</td>
                            <td>${cab.useCase}</td>
                            <td>${cab.fareRange}</td>
                            <td class="action-buttons">
                                <a href="EditCabServlet?id=${cab.id}" class="edit-btn">Edit</a>
                                <a href="DeleteCabServlet?id=${cab.id}" class="delete-btn" 
                                   onclick="return confirm('Are you sure you want to delete this cab?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>