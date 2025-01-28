<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mega Cab Service - Register Page</title>
<%@include file="All_Components/AllCSS.jsp"%>

<style>/* General Styles */
/* General Styles */
body {
    font-family: 'Arial', sans-serif;
    background-image: url('images/background/register.png');
    background-size: cover;
    background-position: center;
    margin: 0;
    padding: 0;
    color: #333;
    height: 100vh; /* Full viewport height */
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Container */
.container {
    max-width: 700px; /* Increased width of the form */
    width: 100%;
    background: rgba(255, 255, 255, 0.3); /* Slightly transparent white background */
    border-radius: 15px;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
    padding: 30px 40px;
    animation: fadeIn 1s ease-in-out;
    display: flex;
    flex-direction: column;
    align-items: center; /* Center content inside the container */
    backdrop-filter: blur(10px); /* Apply blur effect to the background */
    -webkit-backdrop-filter: blur(10px); /* For Safari support */
}

/* Heading */
h1 {
    font-size: 28px;
    font-weight: 600;
    color: #4b79a1;
    margin-bottom: 20px;
    text-align: center; /* Centered heading */
    text-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

/* Form Styles */
form {
    display: grid;
    grid-template-columns: 1fr 1fr; /* Two equal columns */
    column-gap: 20px; /* Horizontal gap between columns */
    row-gap: 15px; /* Vertical gap between rows */
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
    grid-column: span 2; /* Full width across both columns */
}

/* Button */
button {
    grid-column: span 2; /* Center button across both columns */
    padding: 12px;
    font-size: 16px;
    color: #fff;
    background: linear-gradient(90deg, #667eea, #764ba2);
    border: none;
    border-radius: 8px;
    font-weight: 600;
    text-transform: uppercase;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

button:hover {
    background: linear-gradient(90deg, #764ba2, #667eea);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
}

/* Responsive Design */
@media (max-width: 600px) {
    form {
        grid-template-columns: 1fr; /* Single column for smaller screens */
    }
    button {
        grid-column: span 1; /* Adjust button span */
    }
}

/* Animation */
@keyframes fadeIn {
    from {
        opacity: 0;
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
		<form method="POST" action="">
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
			<div>
				<label for="dob">Date of Birth:</label> <input type="date" id="dob"
					name="dob" required>
			</div>
			<div>
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" placeholder="Enter your password"
					required>
			</div>
			<!-- Address section placed below Password -->

			<label for="address">Address:</label>
			<textarea id="address" name="address"
				placeholder="Enter your address" required></textarea>

			<button type="submit">Register</button>
		</form>
	</div>

</body>
</html>