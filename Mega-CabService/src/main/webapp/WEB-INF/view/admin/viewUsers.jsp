<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>View Users</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background: linear-gradient(135deg, #1a1a1a, #000000);
	margin: 0;
	padding: 20px;
	color: #fff;
}

h1 {
	text-align: center;
	color: #FFD700;
	font-size: 3em;
	margin-bottom: 30px;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

@
keyframes glow {from { text-shadow:0010px#FFD700, 0020px#FFD700, 0030px#FFD700;
	
}

to {
	text-shadow: 0 0 20px #FFD700, 0 0 30px #FFD700, 0 0 40px #FFD700;
}

}
.card {
	background: #2a2a2a;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(255, 215, 0, 0.2);
	padding: 20px;
	margin: 20px auto;
	max-width: 1200px;
	overflow: hidden;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 0;
	background: transparent;
}

th, td {
	border: 1px solid #444;
	padding: 15px;
	text-align: left;
}

th {
	background: linear-gradient(135deg, #FFD700, #ffcc00);
	color: #1a1a1a;
	font-weight: bold;
	text-transform: uppercase;
}

tr:nth-child(even) {
	background-color: rgba(255, 215, 0, 0.05);
}

tr:hover {
	background-color: rgba(255, 215, 0, 0.1);
	transform: scale(1.01);
	transition: transform 0.2s ease-in-out, background-color 0.3s ease;
}

.action-buttons {
	display: flex;
	gap: 10px;
}

.action-buttons a {
	padding: 8px 15px;
	border-radius: 5px;
	color: #fff;
	font-weight: bold;
	text-decoration: none;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}

.action-buttons a.edit-btn {
	background: linear-gradient(135deg, #007BFF, #0056b3);
}

.action-buttons a.edit-btn:hover {
	background: linear-gradient(135deg, #0056b3, #007BFF);
	transform: translateY(-2px);
	box-shadow: 0 6px 10px rgba(0, 123, 255, 0.4);
}

.action-buttons a.delete-btn {
	background: linear-gradient(135deg, #DC3545, #a71d2a);
}

.action-buttons a.delete-btn:hover {
	background: linear-gradient(135deg, #a71d2a, #DC3545);
	transform: translateY(-2px);
	box-shadow: 0 6px 10px rgba(220, 53, 69, 0.4);
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
.card {
	animation: fadeIn 0.8s ease-in-out;
}

@media ( max-width : 768px) {
	table, thead, tbody, th, td, tr {
		display: block;
	}
	th {
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
	tr {
		border: 1px solid #555;
		margin-bottom: 10px;
		border-radius: 10px;
	}
	td {
		border: none;
		border-bottom: 1px solid #555;
		position: relative;
		padding-left: 50%;
	}
	td:before {
		position: absolute;
		top: 6px;
		left: 6px;
		width: 45%;
		padding-right: 10px;
		white-space: nowrap;
		content: attr(data-label);
		font-weight: bold;
		color: #FFD700;
	}
}

.no-users {
	text-align: center;
	color: #FFD700;
	font-size: 1.5em;
	margin-top: 20px;
	animation: glow 2s infinite alternate;
}
</style>
</head>
<body>
<%@include file="Navbar.jsp"%>
	<h1>User List</h1>
	<div class="card">
		<c:choose>
			<c:when test="${empty users}">
				<p class="no-users">No users found!</p>
			</c:when>
			<c:otherwise>
				<table>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Phone Number</th>
						<th>NIC</th>
						<th>Address</th>
						<th>Actions</th>
					</tr>
					<c:forEach var="user" items="${users}">
						<tr>
							<td data-label="ID">${user.user_id}</td>
							<td data-label="Name">${user.name}</td>
							<td data-label="Email">${user.email}</td>
							<td data-label="Phone Number">${user.phoneNumber}</td>
							<td data-label="NIC">${user.nic}</td>
							<td data-label="Address">${user.address}</td>
							<td data-label="Actions" class="action-buttons"><a
								href="EditUserServlet?id=${user.user_id}" class="edit-btn">Edit</a>
								<a href="DeleteUserServlet?id=${user.user_id}"
								class="delete-btn"
								onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>