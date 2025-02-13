<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Cabs</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
        }
        h2 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
        button {
            padding: 8px 12px;
            font-size: 14px;
            cursor: pointer;
            margin: 5px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 4px;
        }
        button:hover {
            background-color: #0056b3;
        }
        .delete-btn {
            background-color: red;
        }
        .delete-btn:hover {
            background-color: darkred;
        }
        .message {
            padding: 10px;
            color: white;
            font-weight: bold;
            text-align: center;
            margin-bottom: 15px;
        }
        .success {
            background-color: green;
        }
        .error {
            background-color: red;
        }
        img {
            max-width: 100px;
            height: auto;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h2>Manage Cabs</h2>

    <!-- Display Success/Error Message -->
    <c:if test="${not empty message}">
        <div class="message ${message eq 'success' ? 'success' : 'error'}">
            ${message}
        </div>
    </c:if>

    <c:if test="${not empty cabs}">
        <p>Total Cabs: <strong>${cabs.size()}</strong></p>
    </c:if>

    <c:if test="${empty cabs}">
        <p style="text-align: center; font-size: 18px; color: gray;">No cabs available.</p>
    </c:if>

    <!-- Display Cab List -->
    <table>
        <thead>
            <tr>
                <th>Cab Name</th>
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
                    <td>${cab.name}</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/${cab.image != null ? cab.image : 'default-image.jpg'}" 
                             alt="Cab Image" width="80" 
                             onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/default-image.jpg';">
                    </td>
                    <td>${cab.description}</td>
                    <td>${cab.capacity}</td>
                    <td>${cab.useCase}</td>
                    <td>${cab.fareRange}</td>
                    <td>
                        <a href="editCab?id=${cab.id}"><button>Edit</button></a>
                        <form action="deleteCab" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="${cab.id}">
                            <button type="submit" class="delete-btn" onclick="return confirm('Are you sure you want to delete this cab?');">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h3>Add New Cab</h3>
    <form action="addCab" method="POST" enctype="multipart/form-data">
        <label for="name">Cab Name:</label>
        <input type="text" name="name" id="name" required><br><br>
        
        <label for="image">Cab Image:</label>
        <input type="file" name="image" id="image" accept="image/*" required><br><br>
        
        <label for="description">Description:</label>
        <input type="text" name="description" id="description" required><br><br>
        
        <label for="capacity">Capacity:</label>
        <input type="number" name="capacity" id="capacity" required><br><br>
        
        <label for="useCase">Use Case:</label>
        <input type="text" name="useCase" id="useCase" required><br><br>
        
        <label for="fareRange">Fare Range:</label>
        <input type="text" name="fareRange" id="fareRange" required><br><br>
        
        <button type="submit">Add Cab</button>
    </form>
</body>
</html>