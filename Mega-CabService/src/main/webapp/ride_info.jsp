<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ride Info</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #000000;
            color: #FFD700;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #1A1A1A;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.5);
            width: 400px;
        }
        h2 {
            color: #FFD700;
            text-align: center;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="date"], input[type="time"], input[type="number"], textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #FFD700;
            border-radius: 5px;
            background-color: #333333;
            color: #FFD700;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #FFD700;
            color: #000000;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #FFC700;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Enter Ride Information</h2>
        <form action="selectCab.jsp" method="post">
            Pickup Location: <input type="text" name="pickup_location" required><br>
            Drop Location: <input type="text" name="drop_location" required><br>
            Ride Date: <input type="date" name="ride_date" required><br>
            Ride Time: <input type="time" name="ride_time" required><br>
            Passengers: <input type="number" name="passenger_count" required><br>
            Luggage Count: <input type="number" name="luggage_count" required><br>
            Special Request: <textarea name="special_request"></textarea><br>
            <button type="submit">Next</button>
        </form>
    </div>
</body>
</html>