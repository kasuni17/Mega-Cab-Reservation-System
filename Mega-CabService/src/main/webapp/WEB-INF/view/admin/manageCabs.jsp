<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Cabs</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 8px 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        button {
            padding: 6px 12px;
            font-size: 14px;
            cursor: pointer;
            margin: 5px;
        }
    </style>
</head>
<body>
    <h2>Manage Cabs</h2>

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
                    <td><img src="${cab.image}" alt="Cab Image" width="50"></td>
                    <td>${cab.description}</td>
                    <td>${cab.capacity}</td>
                    <td>${cab.useCase}</td>
                    <td>${cab.fareRange}</td>
                    <td>
                        <a href="editCab?id=${cab.id}"><button>Edit</button></a>
                        <a href="deleteCab?id=${cab.id}" onclick="return confirm('Are you sure you want to delete this cab?');"><button>Delete</button></a>
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
        <input type="file" name="image" id="image" required><br><br>

        <label for="description">Description:</label>
        <input type="text" name="description" id="description" required><br><br>

        <label for="capacity">Capacity:</label>
        <input type="text" name="capacity" id="capacity" required><br><br>

        <label for="useCase">Use Case:</label>
        <input type="text" name="useCase" id="useCase" required><br><br>

        <label for="fareRange">Fare Range:</label>
        <input type="text" name="fareRange" id="fareRange" required><br><br>

        <button type="submit">Add Cab</button>
    </form>

</body>
</html>
