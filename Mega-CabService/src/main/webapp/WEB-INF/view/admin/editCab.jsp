<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Cab</title>
</head>
<body>
    <h2>Edit Cab Information</h2>

    <form action="updateCab" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${cab.id}">

        <label for="name">Cab Name:</label>
        <input type="text" name="name" id="name" value="${cab.name}" required><br><br>

        <label for="image">Cab Image:</label>
        <input type="file" name="image" id="image"><br><br>

        <label for="description">Description:</label>
        <input type="text" name="description" id="description" value="${cab.description}" required><br><br>

        <label for="capacity">Capacity:</label>
        <input type="text" name="capacity" id="capacity" value="${cab.capacity}" required><br><br>

        <label for="useCase">Use Case:</label>
        <input type="text" name="useCase" id="useCase" value="${cab.useCase}" required><br><br>

        <label for="fareRange">Fare Range:</label>
        <input type="text" name="fareRange" id="fareRange" value="${cab.fareRange}" required><br><br>

        <button type="submit">Update Cab</button>
    </form>

</body>
</html>
