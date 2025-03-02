<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
       
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

       
        body {
            font-family: 'Arial', sans-serif;
            background-color: #000; 
            color: #FFD700; 
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        
        .container {
            background-color: #1a1a1a; 
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(255, 215, 0, 0.2); 
            max-width: 400px;
            width: 100%;
        }

        
        h1 {
            font-size: 2rem;
            margin-bottom: 1.5rem;
            color: #FFD700; 
        }

      
        p {
            font-size: 1.25rem;
            margin-bottom: 1.5rem;
            color: #FF6347; 
        }

     
        a {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            background-color: #FFD700; 
            color: #000; 
            text-decoration: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #FFA500;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>An error occurred while updating your profile.</h1>
        <p>${param.message}</p> 
        <a href="editProfile.jsp">Try Again</a>
    </div>
</body>
</html>