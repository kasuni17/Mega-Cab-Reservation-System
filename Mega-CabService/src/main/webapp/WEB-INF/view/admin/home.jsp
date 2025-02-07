<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mega Cab Service: Admin Home</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
body {
	margin: 0;
	font-family: 'Arial', sans-serif;
	background-color: #1a1a1a; /* Dark background */
	color: #ffffff; /* White text */
}

nav {
	background-color: #262626; /* Dark nav background */
	padding: 15px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

nav ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
	align-items: center;
	gap: 20px;
}

nav ul li {
	margin-left: 20px;
}

nav ul li a {
	color: #ffdd57; /* Yellow text */
	text-decoration: none;
	font-size: 18px;
	transition: color 0.3s;
}

nav ul li a:hover {
	color: #ffffff; /* White text on hover */
}

.nav-right {
	margin-left: auto; /* Push logout button to the right */
}

main {
	text-align: center;
	padding: 30px 20px;
}

main h2 {
	font-size: 32px;
	margin-bottom: 30px;
	color: #ffdd57; /* Yellow text */
}

.dashboard {
	display: flex;
	justify-content: center;
	gap: 25px;
	flex-wrap: wrap;
	max-width: 1200px; /* Limit width for better alignment */
	margin: 0 auto; /* Center the dashboard */
}

.card {
	background: #262626; /* Dark card background */
	border-radius: 12px;
	box-shadow: 0 6px 10px rgba(0, 0, 0, 0.3);
	padding: 25px;
	text-align: center;
	width: calc(33.33% - 50px); /* 3 cards per row with gap */
	transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover {
	transform: translateY(-10px);
	box-shadow: 0 12px 20px rgba(255, 221, 87, 0.2); /* Yellow shadow */
}

.card i {
	font-size: 50px;
	margin-bottom: 15px;
	color: #ffdd57; /* Yellow icons */
}

.card a {
	text-decoration: none; /* Remove underline */
	color: inherit; /* Inherit the color from the parent */
}

.card a:hover {
	color: inherit; /* Ensure the color doesn't change on hover */
}

.card h3 {
	margin: 0;
	font-size: 20px;
	color: #ffffff; /* White text */
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.dashboard .card {
	animation: fadeIn 0.5s ease-in-out;
}

.dashboard .card:nth-child(1) {
	animation-delay: 0.1s;
}

.dashboard .card:nth-child(2) {
	animation-delay: 0.2s;
}

.dashboard .card:nth-child(3) {
	animation-delay: 0.3s;
}

.dashboard .card:nth-child(4) {
	animation-delay: 0.4s;
}

.dashboard .card:nth-child(5) {
	animation-delay: 0.5s;
}

.dashboard .card:nth-child(6) {
	animation-delay: 0.6s;
}

.dashboard .card:nth-child(7) {
	animation-delay: 0.7s;
}

.dashboard .card:nth-child(8) {
	animation-delay: 0.8s;
}

.dashboard .card:nth-child(9) {
	animation-delay: 0.9s;
}

.dashboard .card:nth-child(10) {
	animation-delay: 1s;
}

footer {
	background-color: #262626; /* Dark footer background */
	color: #ffffff; /* White text */
	text-align: center;
	padding: 15px 0;
	margin-top: 30px;
}

footer p {
	margin: 0;
}
</style>
</head>
<body>
	<%@include file="Navbar.jsp"%>

	<main>
		<h2>Welcome, Admin</h2>
		<div class="dashboard">
			<div class="card">
				<a href="manageCabs.jsp"> <i class="fas fa-car"></i>
    <h3>Manage Cabs</h3>
</a>

			</div>

			<div class="card">
				<a href="ManageDrivers.jsp"> <i class="fas fa-users"></i>
					<h3>Manage Drivers</h3>
				</a>
			</div>

			<div class="card">
				<a href="ManageUsers.jsp"> <i class="fas fa-user-cog"></i>
					<h3>Manage Users</h3>
				</a>
			</div>

			<div class="card">
				<a href="ManageBookings.jsp"> <i class="fas fa-calendar-alt"></i>
					<h3>Manage Bookings</h3>
				</a>
			</div>

			<div class="card">
				<a href="Payments.jsp"> <i class="fas fa-money-bill-wave"></i>
					<h3>Payments</h3>
				</a>
			</div>

			<div class="card">
				<a href="Settings.jsp"> <i class="fas fa-cog"></i>
					<h3>Settings</h3>
				</a>
			</div>

			<div class="card">
				<a href="Reports.jsp"> <i class="fas fa-file-alt"></i>
					<h3>Reports</h3>
				</a>
			</div>
		</div>
	</main>

	<%@include file="footer.jsp"%>
</body>
</html>

