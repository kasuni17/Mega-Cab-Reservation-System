<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %> <!-- Enable EL -->
<html>
<head>
    <title>Edit Cab</title>
    <style>
        
        body {
            font-family: 'Arial', sans-serif;
            background-color: #000;
            color: #FFD700;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }

      
        .sidebar {
            width: 250px;
            height: 100vh;
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
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .sidebar a:hover {
            background-color: #333;
        }

        
        .main-content {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
        }

        .container {
            background-color: #1a1a1a;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.5);
            width: 400px;
            margin: 0 auto;
            text-align: center;
        }

        h1 {
            font-size: 2rem;
            margin-bottom: 1.5rem;
            color: #FFD700;
        }

      
        form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            gap: 0.5rem;
        }

        label {
            font-size: 1rem;
            color: #FFD700;
            font-weight: bold;
        }

        input[type="text"], textarea, input[type="file"] {
            padding: 0.5rem;
            border: 2px solid #FFD700;
            border-radius: 5px;
            background-color: #333;
            color: #FFD700;
            font-size: 1rem;
            width: 100%;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, textarea:focus, input[type="file"]:focus {
            border-color: #FFA500;
            outline: none;
        }

        input[type="submit"] {
            padding: 0.75rem;
            background-color: #FFD700;
            color: #000;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #FFA500;
        }

       
        .error-message {
            color: #FF0000;
            font-weight: bold;
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
            <h1>Edit Cab</h1>
            
            <!-- Display error message if any -->
            <c:if test="${not empty errorMessage}">
                <p class="error-message">${errorMessage}</p>
            </c:if>

            <form action="EditCabServlet" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${cab.id}">

                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="${cab.name}" required>
                </div>

                <div class="form-group">
                    <label for="image">Cab Image:</label>
                    <input type="file" id="image" name="image" accept="image/*">
                    <c:if test="${not empty cab.image}">
                        <p>Current Image: <img src="${cab.image}" alt="Cab Image" width="100"></p>
                    </c:if>
                </div>

                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea id="description" name="description" required>${cab.description}</textarea>
                </div>

                <div class="form-group">
                    <label for="capacity">Capacity:</label>
                    <input type="text" id="capacity" name="capacity" value="${cab.capacity}" required>
                </div>

                <div class="form-group">
                    <label for="use_case">Use Case:</label>
                    <input type="text" id="use_case" name="use_case" value="${cab.useCase}" required>
                </div>

                <div class="form-group">
                    <label for="fare_range">Fare Range:</label>
                    <input type="text" id="fare_range" name="fare_range" value="${cab.fareRange}" required>
                </div>

                <input type="submit" value="Update">
            </form>
        </div>
    </div>
</body>
</html>