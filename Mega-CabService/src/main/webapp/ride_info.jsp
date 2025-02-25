<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Ride Info</title>
</head>
<body>
	<h2>Enter Ride Information</h2>
	<form action="selectCab.jsp" method="post">
		Pickup Location: <input type="text" name="pickup_location" required><br>
		Drop Location: <input type="text" name="drop_location" required><br>
		Ride Date: <input type="date" name="ride_date" required><br>
		Ride Time: <input type="time" name="ride_time" required><br>
		Passengers: <input type="number" name="passenger_count" required><br>
		Luggage Count: <input type="number" name="luggage_count" required><br>
		Special Request:
		<textarea name="special_request"></textarea>
		<br>
		<button type="submit">Next</button>
	</form>

</body>
</html>
