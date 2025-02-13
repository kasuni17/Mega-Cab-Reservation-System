<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Cab</title>
    <style>
        .error-message { color: red; }
        .image-preview img { max-width: 150px; border: 2px solid #333; margin-top: 10px; }
    </style>
</head>
<body>

    <h2>Edit Cab</h2>

    <!-- Display error message if any -->
    <c:if test="${not empty errorMessage}">
        <p class="error-message">${errorMessage}</p>
    </c:if>

    <form action="editCab" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${cab.id}" />

        <label>Cab Name:</label>
        <input type="text" name="name" value="${cab.name}" required><br><br>

        <label>Description:</label>
        <input type="text" name="description" value="${cab.description}" required><br><br>

        <label>Capacity:</label>
        <input type="number" name="capacity" value="${cab.capacity}" required><br><br>

        <label>Use Case:</label>
        <input type="text" name="useCase" value="${cab.useCase}" required><br><br>

        <label>Fare Range:</label>
        <input type="text" name="fareRange" value="${cab.fareRange}" required><br><br>

        <!-- Image Upload -->
        <label>Cab Image:</label>
        <input type="file" name="image"><br><br>

        <!-- Display Current Image -->
        <c:if test="${not empty cab.image}">
            <div class="image-preview">
                <p>Current Image:</p>
                <img src="${pageContext.request.contextPath}/${cab.image}" alt="Cab Image">
            </div>
        </c:if>

        <!-- Hidden field to keep track of existing image -->
        <input type="hidden" name="existingImage" value="${cab.image}" />

        <button type="submit">Update Cab</button>
    </form>

    <br>
    <a href="manageCabs">Back to Cab List</a>

</body>
</html>
