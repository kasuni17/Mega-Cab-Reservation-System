<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    </style>
</head>
<body>
	 <%@include file="All_Components/Navbar.jsp" %>
	 
	 <div class="banner">
        <h1>Our Fleet</h1>
    </div>
    <div class="filter-buttons">
        <button onclick="filterFleet('all')">All</button>
        <button onclick="filterFleet('sedan')">Sedan</button>
        <button onclick="filterFleet('suv')">SUV</button>
        <button onclick="filterFleet('van')">Van</button>
    </div>
    <h2 id="category-heading">All Vehicles</h2>
    <div class="fleet-container" id="fleet"></div>
	 
	 <!-- footer -->
	<%@include file="All_Components/footer.jsp"%>
	
	  <script>
        const vehicles = [
            { name: "Toyota Corolla", type: "sedan", image: "corolla.jpg", description: "A comfortable and fuel-efficient sedan.", capacity: "4 passengers", useCase: "City Rides", fareRange: "$30 - $50" },
            { name: "Honda CR-V", type: "suv", image: "crv.jpg", description: "A spacious and reliable SUV.", capacity: "5 passengers", useCase: "Family Trips", fareRange: "$50 - $80" },
            { name: "Mercedes V-Class", type: "van", image: "vclass.jpg", description: "A luxury van for group travel.", capacity: "7 passengers", useCase: "Airport Transfers", fareRange: "$70 - $100" },
            { name: "Nissan X-Trail", type: "suv", image: "xtrail.jpg", description: "A powerful and stylish SUV.", capacity: "5 passengers", useCase: "Adventure Trips", fareRange: "$60 - $90" },
            { name: "Hyundai Elantra", type: "sedan", image: "elantra.jpg", description: "A sleek and modern sedan.", capacity: "4 passengers", useCase: "Business Travel", fareRange: "$40 - $60" }
        ];

        function displayFleet(filterType) {
            const fleetContainer = document.getElementById("fleet");
            fleetContainer.innerHTML = ""; // Clear previous entries

            vehicles.forEach(vehicle => {
                if (filterType === "all" || vehicle.type === filterType) {
                    fleetContainer.innerHTML += `
                        <div class="vehicle-card">
                            <img src="${vehicle.image}" alt="${vehicle.name}">
                            <h3>${vehicle.name}</h3>
                            <p><strong>Description:</strong> ${vehicle.description}</p>
                            <p><strong>Capacity:</strong> ${vehicle.capacity}</p>
                            <p><strong>Use Case:</strong> ${vehicle.useCase}</p>
                            <p><strong>Fare Range:</strong> ${vehicle.fareRange}</p>
                            <a href="booking.html" class="book-now">Book Now</a>
                        </div>
                    `;
                }
            });
        }

        function filterFleet(type) {
            const categoryHeading = document.getElementById("category-heading");
            if (type === "all") {
                categoryHeading.textContent = "All Vehicles";
            } else {
                categoryHeading.textContent = `${type.charAt(0).toUpperCase() + type.slice(1)} Vehicles`;
            }
            displayFleet(type);
        }

        // Load all vehicles initially
        displayFleet("all");
    </script>
	
</body>
</html>