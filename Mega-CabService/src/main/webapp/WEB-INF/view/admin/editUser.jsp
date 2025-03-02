<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %> <!-- Enable EL -->
<html>
<head>
    <title>Edit User</title>
    <style>
        
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #1a1a1a, #000000); 
            margin: 0;
            padding: 20px;
            color: #fff; 
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            color: #FFD700; 
            font-size: 2.5em;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            
        }

        @keyframes glow {
            from {
                text-shadow: 0 0 10px #FFD700, 0 0 20px #FFD700, 0 0 30px #FFD700;
            }
            to {
                text-shadow: 0 0 20px #FFD700, 0 0 30px #FFD700, 0 0 40px #FFD700;
            }
        }

       
        .form-container {
            background: #2a2a2a; 
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(255, 215, 0, 0.2); 
            padding: 30px;
            max-width: 500px;
            width: 100%;
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
            color: #FFD700; 
        }

        input[type="text"] {
            padding: 10px;
            border: 1px solid #444; 
            border-radius: 5px;
            background: #333; 
            color: #fff; 
            font-size: 1em;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #FFD700; 
            box-shadow: 0 0 10px rgba(255, 215, 0, 0.5); 
            outline: none;
        }

        input[type="submit"] {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background: linear-gradient(135deg, #FFD700, #ffcc00);
            color: #1a1a1a; 
            font-size: 1em;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 10px rgba(255, 215, 0, 0.4);
        }

        
        @media (max-width: 600px) {
            .form-container {
                padding: 20px;
            }

            h1 {
                font-size: 2em;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Edit User</h1>
        <form action="EditUserServlet" method="post">
            <input type="hidden" name="user_id" value="${user.user_id}">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${user.name}" required>

            <label for="email">Email:</label>
            <input type="text" id="email" name="email" value="${user.email}" required>

            <label for="phone_number">Phone Number:</label>
            <input type="text" id="phone_number" name="phone_number" value="${user.phoneNumber}" required>

            <label for="nic">NIC:</label>
            <input type="text" id="nic" name="nic" value="${user.nic}" required>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="${user.address}" required>

            <input type="submit" value="Update">
        </form>
    </div>
</body>
</html>