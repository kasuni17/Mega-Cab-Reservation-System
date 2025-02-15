<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %> <!-- Enable EL -->
<html>
<head>
    <title>Edit User</title>
</head>
<body>
    <h1>Edit User</h1>
    <form action="EditUserServlet" method="post">
        <input type="hidden" name="user_id" value="${user.user_id}">
        Name: <input type="text" name="name" value="${user.name}"><br>
        Email: <input type="text" name="email" value="${user.email}"><br>
        Phone Number: <input type="text" name="phone_number" value="${user.phoneNumber}"><br>
        NIC: <input type="text" name="nic" value="${user.nic}"><br>
        Address: <input type="text" name="address" value="${user.address}"><br>
        <input type="submit" value="Update">
    </form>
</body>
</html>