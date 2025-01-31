<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mega Cab Service - Register Page</title>
<%@include file="All_Components/AllCSS.jsp"%>

<style>/* General Styles */
body {
	font-family: 'Arial', sans-serif;
	background-image: url('images/background/register.png');
	background-size: cover;
	background-position: center;
	margin: 0;
	padding: 0;
	color: #333;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* Container */
.container {
	max-width: 700px;
	width: 100%;
	background: rgba(255, 255, 255, 0.3);
	border-radius: 15px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
	padding: 30px 40px;
	animation: fadeIn 1s ease-in-out;
	display: flex;
	flex-direction: column;
	align-items: center;
	backdrop-filter: blur(10px);
	-webkit-backdrop-filter: blur(10px);
}

/* Heading */
h1 {
	font-size: 28px;
	font-weight: 600;
	color: #020f31b3;
	margin-bottom: 20px;
	text-align: center;
	text-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

/* Form Styles */
form {
	display: grid;
	grid-template-columns: 1fr 1fr;
	column-gap: 45px;
	row-gap: 20px;
	width: 100%;
}

form>div {
	display: flex;
	flex-direction: column;
}

label {
	font-weight: bold;
	margin-bottom: 5px;
	text-align: left;
	color: #333;
}

input, textarea {
	width: 100%;
	padding: 12px 15px;
	border: 1px solid #ddd;
	border-radius: 10px;
	font-size: 14px;
	transition: all 0.3s;
	outline: none;
	background: #f9f9f9;
	box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
}

input:focus, textarea:focus {
	border-color: #4b79a1;
	box-shadow: 0 0 5px rgba(75, 121, 161, 0.5);
	background: #fff;
}

/* Full-Width Items */
textarea {
	grid-column: span 2;
}

/* Button */
button {
	grid-column: span 2;
	padding: 12px;
	font-size: 16px;
	color: #fff;
	background-image: linear-gradient(to right, #000000 0%, #434343 51%, #000000 100%);
	border: none;
	border-radius: 10px;
	font-weight: 600;
	text-transform: uppercase;
	cursor: pointer;
	transition: 0.5s;
	background-size: 200% auto;
	box-shadow: 0 0 20px #eee;
	display: block;
}

button:hover {
	background-position: right center;
	color: #fff;
	text-decoration: none;
	box-shadow: 0 0 25px rgba(0, 0, 0, 0.3);
}

.login-link {
	text-align: center;
	margin-top: 20px;
	font-size: 15px;
}

.login-link a {
	color: #020f31;
	text-decoration: none;
	font-weight: 600;
	transition: all 0.3s;
	background: linear-gradient(to right, #000000, #434343);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.login-link a:hover {
	text-decoration: underline;
	opacity: 0.9;
}

.text {
	font-size: 16px;
	font-weight: bold;
	color: red;
	text-align: center;
	margin-top: 10px;
}

/* Responsive Design */
@media ( max-width : 600px) {
	form {
		grid-template-columns: 1fr;
	}
	button {
		grid-column: span 1;
	}
}

/* Animation */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>
</head>
<body>
	<div class="container">
		<h1>Customer Registration</h1>

		<c:if test="${not empty message}">
			<p class="text" style="color: yellow;">${message}</p>
			<c:remove var="message" scope="session"/>

		</c:if>

		<c:if test="${not empty error}">
			<p class="text" style="color: red;">${error}</p>
			<c:remove var="error" scope="session"/>

		</c:if>

		<form method="POST" action="register">
			<div>
				<label for="name">Name:</label> <input type="text" id="name"
					name="name" placeholder="Enter your name" required>
			</div>
			<div>
				<label for="email">Email:</label> <input type="email" id="email"
					name="email" placeholder="Enter your email" required>
			</div>
			<div>
				<label for="phone_number">Phone Number:</label> <input type="text"
					id="phone_number" name="phone_number"
					placeholder="Enter your phone number" required>
			</div>
			<div>
				<label for="nic">NIC:</label> <input type="text" id="nic" name="nic"
					placeholder="Enter your NIC" required>
			</div>
			<br>
			<div>
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" placeholder="Enter your password"
					required>
			</div>

			<label for="address">Address:</label>
			<textarea id="address" name="address"
				placeholder="Enter your address" required></textarea>

			<button type="submit">Register</button>

		</form>
		<div class="login-link">
			Already have an account? <a href="login.jsp">Login here</a>
		</div>
	</div>

</body>
</html>