<%@ page import="com.megacabservice.dao.CabDAOImpl, com.megacabservice.entity.Cab, com.megacabservice.db.DBConn" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Our Fleet</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212;
            margin: 0;
            padding: 0;
            text-align: center;
            color: #fff;
        }
        .banner {
            position: relative;
            width: 100%;
            height: 570px;
            background: url('images/background/about.png') no-repeat center center/cover;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
        .banner h1 {
            font-size: 60px;
            color: white;
            background: rgba(0, 0, 0, 0.413);
            padding: 100px 600px;
            border-radius: 10px;
        }
        .filter-buttons {
            margin: 30px 0;
        }
        .filter-buttons button {
            padding: 10px 20px;
            margin: 5px;
            border: none;
            background-color: darkblue;
            color: yellow;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }
        .filter-buttons button:hover {
            background-color: yellow;
            color: black;
        }
        .fleet-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 20px 0;
        }
        .vehicle-card {
            width: 320px;
            margin: 15px;
            padding: 15px;
            background-color: #222;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(255, 255, 0, 0.6);
            text-align: center;
            transform: scale(1);
            transition: transform 0.3s ease-in-out;
        }
        .vehicle-card:hover {
            transform: scale(1.05);
        }
        .vehicle-card img {
            width: 100%;
            height: 180px;
            border-radius: 10px;
            object-fit: cover;
        }
        .vehicle-card h3 {
            margin: 15px 0 10px 0;
            color: #00c6ff;
            font-size: 1.5em;
        }
        .vehicle-card p {
            margin: 5px 0;
            text-align: left;
        }
        .book-now {
            margin-top: 10px;
            padding: 10px 15px;
            background-color: yellow;
            color: black;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            transition: 0.3s;
        }
        .book-now:hover {
            background-color: darkblue;
            color: white;
        }
        #category-heading {
            font-size: 2.2em;
            margin: 20px 0;
            color: #00c6ff;
        }
        @media (max-width: 768px) {
            .fleet-container {
                flex-direction: column;
                align-items: center;
            }
            .banner h1 {
                padding: 60px 100px;
                font-size: 40px;
            }
        }
    </style>
</head>
<body>
    <%@include file="All_Components/Navbar.jsp" %>
    <div class="banner">
        <h1>Our Fleet</h1>
    </div>

    <div class="fleet-container" id="fleetContainer">
        <%
            CabDAOImpl cabDAO = new CabDAOImpl(DBConn.getConnection());
            List<Cab> cabs = cabDAO.getAllCabs();
            for (Cab cab : cabs) {
        %>
            <div class="vehicle-card" data-category="<%= cab.getUseCase() %>">
                <img src="<%= request.getContextPath() + "/" + cab.getImage() %>" alt="<%= cab.getName() %>">
                <h3><%= cab.getName() %></h3>
                <p><strong>Description:</strong></p>
                <ul style="text-align: left; padding-left: 20px; margin: 5px 0;">
                    <% 
                        String[] descriptionPoints = cab.getDescription().split("\\.");
                        for (String point : descriptionPoints) {
                            if (!point.trim().isEmpty()) {
                    %>
                        <li><%= point.trim() %></li>
                    <%
                            }
                        }
                    %>
                </ul>
                <p><strong>Capacity:</strong> <%= cab.getCapacity() %></p>
                <p><strong>Use Case:</strong> <%= cab.getUseCase() %></p>
                <p><strong>Fare Range:</strong> <%= cab.getFareRange() %></p>
                
            </div>
        <%
            }
        %>
    </div>

    <script>
        function filterFleet(category) {
            const cards = document.querySelectorAll('.vehicle-card');
            cards.forEach(card => {
                const cardCategory = card.getAttribute('data-category');
                if (category === 'all' || cardCategory === category) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        }
    </script>
</body>
</html>