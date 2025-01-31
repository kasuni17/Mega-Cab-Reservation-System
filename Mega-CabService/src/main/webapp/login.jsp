<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mega Cab Service - Login Page</title>
<%@include file="All_Components/AllCSS.jsp"%>

<style>
/* General Styles */
body {
	font-family: 'Arial', sans-serif;
	background-image: url('images/background/login.png');
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
	border: 2px solid rgba(0, 0, 0, 0.2);
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
	grid-template-columns: 1fr;
	gap: 20px;
	width: 100%;
}

form>div {
	display: flex;
	flex-direction: column;
}

label {
	font-weight: bold;
	margin-bottom: 5px;
	color: #333;
}

/* Input Fields with Icons */
input {
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

input:focus {
	border-color: #4b79a1;
	box-shadow: 0 0 5px rgba(75, 121, 161, 0.5);
	background: #fff;
}

/* Adding Icons Inside Inputs */
input[type="text"], input[type="password"] {
	padding-left: 40px;
	background-size: 20px;
	background-position: 10px center;
	background-repeat: no-repeat;
}

input[type="text"]:focus, input[type="password"]:focus {
	padding-left: 40px;
}

/* Button */
button {
	padding: 12px;
	font-size: 16px;
	color: #fff;
	background-image: linear-gradient(to right, #000000 0%, #434343 51%, #000000 100%);
	border: none;
	border-radius: 10px;
	font-weight: 600;
	text-transform: uppercase;
	cursor: pointer;
	transition: 0.3s ease;
	background-size: 200% auto;
	box-shadow: 0 0 20px #eee;
	display: block;
	width: 100%;
}

button:hover {
	background-position: right center;
	color: #fff;
	box-shadow: 0 0 25px rgba(0, 0, 0, 0.3);
}

/* Forgot Password Link */
.forgot-password {
	font-size: 14px;
	color: #3a2f10;
	text-align: center;
	margin-top: 10px;
	text-decoration: none;
	transition: color 0.3s;
}

.forgot-password:hover {
	color: #000;
}

/* Register Section */
.register-link {
	font-size: 14px;
	color: #3a2f10;
	text-align: center;
	margin-top: 15px;
	text-decoration: none;
	transition: color 0.3s;
}

.register-link:hover {
	color: #000;
}

.error-message {
	color: red;
	font-size: 14px;
	text-align: center;
	margin-bottom: 15px;
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
		<h1>Login</h1>

		<c:if test="${not empty failedMsg}">
			<h5 class="error-message">${ failedMsg}</h5>
			<c:remove var="failedMsg" scope="session" />

		</c:if>

		<form method="POST" action="login">
			<div>
				<label for="email">E-mail:</label> <input type="text" id="email"
					name="email" placeholder="Enter your e-mail" required="required">
			</div>
			<div>
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" placeholder="Enter your password"
					required="required">
			</div>
			<button type="submit">Login</button>
			<a href="#" class="forgot-password">Forgot Password?</a> <a
				href="register.jsp" class="register-link">Don't have an account?
				Register here</a>

		</form>
	</div>
</body>
</html>
