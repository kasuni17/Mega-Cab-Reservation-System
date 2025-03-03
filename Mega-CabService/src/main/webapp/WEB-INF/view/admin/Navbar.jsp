
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Taxi Service Admin Panel</title>
<!-- Add Font Awesome for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Arial', sans-serif;
	background-color: #1a1a1a;
	color: #fff;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #000000;
	padding: 10px 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
}

.logo img {
	height: 50px;
	transition: transform 0.3s ease;
}

.logo img:hover {
	transform: scale(1.1);
}

.nav-links {
	list-style: none;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-grow: 1;
}

.nav-links li {
	margin: 0 15px;
}

.nav-links a {
	text-decoration: none;
	color: #FFD700;
	font-size: 18px;
	padding: 10px 15px;
	border-radius: 5px;
	transition: all 0.3s ease;
	position: relative;
}

.nav-links a::after {
	content: '';
	position: absolute;
	width: 0;
	height: 2px;
	background: #FFD700;
	bottom: 0;
	left: 50%;
	transition: all 0.3s ease;
}

.nav-links a:hover::after {
	width: 100%;
	left: 0;
}

.nav-links a:hover {
	color: #ffffff;
	background-color: rgba(255, 215, 0, 0.1);
}

.home-button {
	font-weight: bold;
}

.logout {
	display: flex;
	align-items: center;
}

.logout-button {
	text-decoration: none;
	color: #000000;
	font-size: 18px;
	padding: 10px 20px;
	border-radius: 30px;
	background-color: #FFD700;
	transition: all 0.3s ease;
	position: relative;
	overflow: hidden;
	border: 2px solid transparent;
	box-shadow: 0 4px 6px rgba(255, 215, 0, 0.3);
	display: flex;
	align-items: center;
	gap: 8px;
	font-weight: bold;
}

.logout-button::before {
	content: '';
	position: absolute;
	top: 50%;
	left: 50%;
	width: 300%;
	height: 300%;
	background: radial-gradient(circle, rgba(255, 255, 255, 0.4),
		rgba(255, 255, 255, 0) 70%);
	transform: translate(-50%, -50%) scale(0);
	transition: transform 0.5s ease, opacity 0.5s ease;
	opacity: 0;
	border-radius: 50%;
}

.logout-button:hover::before {
	transform: translate(-50%, -50%) scale(1);
	opacity: 1;
}

.logout-button:hover {
	background-color: #FFA500;
	border-color: #ffffff;
	box-shadow: 0 6px 12px rgba(255, 165, 0, 0.5);
	transform: translateY(-2px);
}

@
keyframes slideIn {from { opacity:0;
	transform: translateY(-50px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.navbar {
	animation: slideIn 0.5s ease-out;
}
</style>
</head>
<body>
	<nav class="navbar">
		<!-- Logo on the left -->
		<div class="logo">
			<img src="/Mega-CabService/images/background/logo3.png"
				alt="Taxi Service Logo">
		</div>
		<!-- Home button in the middle -->
		<ul class="nav-links">
			<li><a href="${pageContext.request.contextPath}/home" class="home-button">Home</a></li>
		</ul>
		<div class="logout">
			<a href="login.jsp" class="logout-button" id="logoutButton"> <i
				class="fas fa-sign-out-alt"></i> Logout
			</a>
		</div>
	</nav>




</body>
</html>

