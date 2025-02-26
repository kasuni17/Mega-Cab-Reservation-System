<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Updated</title>
<style>
/* General Reset */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* Body Styling */
body {
	font-family: 'Arial', sans-serif;
	background-color: #000; /* Black background */
	color: #FFD700; /* Yellow text */
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	text-align: center;
}

/* Container */
.container {
	background-color: #1a1a1a; /* Dark gray background */
	padding: 2rem;
	border-radius: 10px;
	box-shadow: 0 4px 15px rgba(255, 215, 0, 0.2); /* Yellow shadow */
	max-width: 400px;
	width: 100%;
}

/* Heading */
h1 {
	font-size: 2rem;
	margin-bottom: 1.5rem;
	color: #FFD700; /* Yellow */
}

/* Link Styling */
a {
	display: inline-block;
	padding: 0.75rem 1.5rem;
	background-color: #FFD700; /* Yellow background */
	color: #000; /* Black text */
	text-decoration: none;
	border-radius: 5px;
	font-size: 1rem;
	font-weight: bold;
	transition: background-color 0.3s ease;
	
}

a:hover {
	background-color: #FFA500; /* Orange on hover */
}

a+br+a {
	margin-top: 1rem; /* Adjust as needed */
	display: inline-block;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Profile Updated Successfully!</h1>
		<a href="editProfile.jsp">Edit Profile Again</a> <br> <a
			href="index.jsp"> ⬅️ Back to Home Page</a>
	</div>
</body>
</html>