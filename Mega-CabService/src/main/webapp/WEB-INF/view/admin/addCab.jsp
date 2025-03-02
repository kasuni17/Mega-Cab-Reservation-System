<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Cab</title>
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
            background-color: #1a1a1a;
            padding: 1rem;
            box-shadow: 2px 0 10px rgba(255, 215, 0, 0.5);
        }

        .sidebar h2 {
            color: #FFD700;
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .sidebar ul li {
            margin: 1rem 0;
        }

        .sidebar ul li a {
            color: #FFD700;
            text-decoration: none;
            font-size: 1rem;
            display: block;
            padding: 0.5rem;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .sidebar ul li a:hover {
            background-color: #333;
        }

       
        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow-y: auto;
            padding: 2rem;
        }

        .container {
            background-color: #1a1a1a;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.5);
            width: 400px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        h1 {
            font-size: 2rem;
            margin-bottom: 1.5rem;
            color: #FFD700;
            animation: slideIn 1s ease-in-out;
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
            animation: shake 0.5s ease-in-out;
        }

        
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            50% { transform: translateX(10px); }
            75% { transform: translateX(-10px); }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Panel</h2>
        <ul>
            <li> <a href="viewCabs">View Cabs</a></li>
            <li><a href="${pageContext.request.contextPath}/AddCabServlet">Add New Cab</a></li>
           
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <h1>Add New Cab</h1>
            
            <!-- Display error message if any -->
            <% if (request.getAttribute("errorMessage") != null) { %>
                <p class="error-message"><%= request.getAttribute("errorMessage") %></p>
            <% } %>

            <form action="AddCabServlet" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" placeholder="Enter cab name" required>
                </div>

                <div class="form-group">
                    <label for="image">Cab Image:</label>
                    <input type="file" id="image" name="image" accept="image/*" required>
                </div>

                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea id="description" name="description" placeholder="Enter cab description" rows="3" required></textarea>
                </div>

                <div class="form-group">
                    <label for="capacity">Capacity:</label>
                    <input type="text" id="capacity" name="capacity" placeholder="Enter passenger capacity" required>
                </div>

                <div class="form-group">
                    <label for="use_case">Use Case:</label>
                    <input type="text" id="use_case" name="use_case" placeholder="Enter use case (e.g., city ride)" required>
                </div>

                <div class="form-group">
                    <label for="fare_range">Fare Range:</label>
                    <input type="text" id="fare_range" name="fare_range" placeholder="Enter fare range (e.g., $10-$50)" required>
                </div>

                <input type="submit" value="Add Cab">
            </form>
        </div>
    </div>
</body>
</html>