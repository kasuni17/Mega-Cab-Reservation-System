<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %> <!-- Ensure EL is enabled -->
<html>
<head>
    <title>View Users</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid black; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
        a { color: blue; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1>User List</h1>
    <c:choose>
        <c:when test="${empty users}">
            <p>No users found!</p>
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
                        <td>${user.user_id}</td>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.phoneNumber}</td>
                        <td>${user.nic}</td>
                        <td>${user.address}</td>
                        <td>
                            <a href="EditUserServlet?id=${user.user_id}">Edit</a> |
                            <a href="DeleteUserServlet?id=${user.user_id}" onclick="return confirm('Delete user?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</body>
</html>