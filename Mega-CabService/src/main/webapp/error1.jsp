<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .error-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        h1 {
            color: #d9534f; /* Bootstrap's danger color */
            margin-bottom: 20px;
        }
        p {
            color: #333;
            font-size: 18px;
        }
        a {
            color: #337ab7; /* Bootstrap's primary color */
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Oops! Something went wrong.</h1>
        <p><strong>Error:</strong> 
            <%= request.getParameter("message") != null ? request.getParameter("message") : "No error details available." %>
        </p>
        <p>Please try again or contact support if the problem persists.</p>
        <a href="index.jsp">Go back to Home</a>
    </div>
</body>
</html>