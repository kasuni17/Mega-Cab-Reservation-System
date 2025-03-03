<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>

    <title>Manage Cabs</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');
        
        * {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding: 40px 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 30px;
            backdrop-filter: blur(10px);
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 2.5em;
            margin-bottom: 30px;
            position: relative;
            display: inline-block;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 4px;
            background: #3498db;
            border-radius: 2px;
            animation: underline 1.5s infinite;
        }

        @keyframes underline {
            0%, 100% { width: 60px; }
            50% { width: 80px; }
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 30px 0;
            overflow: hidden;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
            animation: slideIn 0.6s ease-in;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        th, td {
            padding: 15px;
            text-align: center;
            position: relative;
        }

        th {
            background: #3498db;
            color: white;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.8px;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        tr:hover {
            background-color: rgba(52, 152, 219, 0.05);
            transform: scale(1.02);
            transition: all 0.3s ease;
        }

        button {
            padding: 8px 20px;
            font-size: 14px;
            cursor: pointer;
            margin: 5px;
            border: none;
            border-radius: 8px;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        button i {
            font-size: 16px;
        }

        .edit-btn {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
        }

        .delete-btn {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
            box-shadow: 0 4px 15px rgba(231, 76, 60, 0.3);
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        }

        .message {
            padding: 15px;
            color: white;
            font-weight: bold;
            text-align: center;
            margin: 20px 0;
            border-radius: 10px;
            animation: slideDown 0.4s ease-out;
        }

        @keyframes slideDown {
            from { transform: translateY(-20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .success {
            background: linear-gradient(45deg, #2ecc71, #27ae60);
        }

        .error {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
        }

        img {
            max-width: 100px;
            height: auto;
            border-radius: 10px;
            transition: transform 0.3s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        img:hover {
            transform: scale(1.1);
        }

        .add-cab-form {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            margin-top: 40px;
            animation: fadeIn 0.8s ease-in-out;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 25px;
            margin-top: 20px;
        }

        .form-group {
            position: relative;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            border-color: #3498db;
            box-shadow: 0 0 10px rgba(52, 152, 219, 0.2);
            outline: none;
        }

        .form-group label {
            position: absolute;
            top: -10px;
            left: 15px;
            background: white;
            padding: 0 5px;
            color: #3498db;
            font-size: 14px;
            font-weight: 500;
        }

        .submit-btn {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
            padding: 12px 30px;
            font-size: 16px;
            border-radius: 8px;
            width: 200px;
            margin: 20px auto;
            display: block;
            transition: all 0.3s ease;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(52, 152, 219, 0.3);
        }

        .total-cabs {
            background: #3498db;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            display: inline-block;
            margin-bottom: 20px;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }
    </style>
</head>
<body>
<%@include file="Navbar.jsp"%>
    <div class="container">
        <h2>Manage Cabs</h2>

        <!-- Display Success/Error Message -->
        <c:if test="${not empty message}">
            <div class="message ${message eq 'success' ? 'success' : 'error'}">
                ${message}
            </div>
        </c:if>

        <c:if test="${not empty cabs}">
            <div class="total-cabs">
                Total Cabs: <strong>${cabs.size()}</strong>
            </div>
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
                                 alt="Cab Image"
                                 onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/default-image.jpg';">
                        </td>
                        <td>${cab.description}</td>
                        <td>${cab.capacity}</td>
                        <td>${cab.useCase}</td>
                        <td>${cab.fareRange}</td>
                        <td>
                            <a href="editCab?id=${cab.id}">
                                <button class="edit-btn">
                                    <i class="fas fa-edit"></i> Edit
                                </button>
                            </a>
                            <form action="deleteCab" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${cab.id}">
                                <button type="submit" class="delete-btn" onclick="return confirm('Are you sure?');">
                                    <i class="fas fa-trash"></i> Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Add New Cab Form -->
        <div class="add-cab-form">
            <h3 style="text-align: center; margin-bottom: 20px; color: #2c3e50;">Add New Cab</h3>
            <form action="addCab" method="POST" enctype="multipart/form-data">
                <div class="form-grid">
                    <div class="form-group">
                        <input type="text" name="name" id="name" required>
                        <label for="name">Cab Name</label>
                    </div>
                    <div class="form-group">
                        <input type="file" name="image" id="image" accept="image/*" required>
                        <label for="image">Cab Image</label>
                    </div>
                    <div class="form-group">
                        <input type="text" name="description" id="description" required>
                        <label for="description">Description</label>
                    </div>
                    <div class="form-group">
                        <input type="number" name="capacity" id="capacity" required>
                        <label for="capacity">Capacity</label>
                    </div>
                    <div class="form-group">
                        <input type="text" name="useCase" id="useCase" required>
                        <label for="useCase">Use Case</label>
                    </div>
                    <div class="form-group">
                        <input type="text" name="fareRange" id="fareRange" required>
                        <label for="fareRange">Fare Range</label>
                    </div>
                </div>
                <button type="submit" class="submit-btn">
                    <i class="fas fa-plus"></i> Add New Cab
                </button>
            </form>
        </div>
    </div>

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</body>
</html>