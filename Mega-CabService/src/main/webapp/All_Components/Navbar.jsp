<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

header {
	background-color: #333;
	color: white;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
}

.navbar img {
	height: 75px;
	width: 100px
}

.navbar .buttons button {
	background-color: #f90;
	border: none;
	padding: 10px 15px;
	margin-left: 10px;
	color: white;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
}

.navbar .buttons button:hover {
	background-color: #e68a00;
}

.nav-links {
	display: flex;
	justify-content: center;
	background-color: #555;
}

.nav-links a {
	text-decoration: none;
	color: white;
	padding: 15px 20px;
	display: block;
	font-weight: bold;
}

.nav-links a:hover, .nav-links a.book-now {
	background-color: #f90;
}
</style>

</head>
<body>

	<!-- First Navbar -->
	<header>
		<div class="navbar">
			<img src="images/background/logo3.png" alt="Cab Service Logo">

			<c:if test="${not empty userobj}">
				<div class="buttons">
					<a href="userBookings.jsp"><i class="fa-solid fa-calendar fa-xl" style="color: #FFD43B;"></i></a> 
						 <a href="editProfile.jsp">
                            <button>${userobj.name}</button>
                        </a>
				 <a href="login.jsp"><button>LogOut</button></a>
				</div>
			</c:if>

			<c:if test="${empty userobj}">
				<div class="buttons">

					<a href="login.jsp">
						<button>Login</button>
					</a> <a href="register.jsp"><button>Register</button></a>
				</div>
			</c:if>
		</div>
	</header>

	<!-- Second Navbar -->
	<nav class="nav-links">
		<a href="index.jsp">Home</a> <a href="about.jsp">About Us</a> <a
			href="fleet.jsp">Our Fleet</a> <a href="contactus.jsp">Contact Us</a>
		<a href="ride_info.jsp" class="book-now">BOOK NOW</a>
	</nav>
</body>
</html>