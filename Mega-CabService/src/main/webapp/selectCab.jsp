<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.megacabservice.dao.CabDAO, com.megacabservice.dao.CabDAOImpl, com.megacabservice.entity.Cab, java.util.List, java.sql.Connection"%>
<%@ page import="com.megacabservice.db.DBConn"%>
<%@ page import="com.megacabservice.dao.DriverDAO, com.megacabservice.dao.DriverDAOImpl, com.megacabservice.entity.Driver"%>
<!DOCTYPE html>
<html>
<head>
    <title>Select Cab and Driver</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #000000;
            color: #FFD700;
            margin: 0;
            padding: 20px;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .card {
            border: 1px solid #FFD700;
            border-radius: 10px;
            padding: 15px;
            margin: 15px;
            width: 300px;
            text-align: center;
            background-color: #1A1A1A;
            box-shadow: 0 0 10px rgba(255, 215, 0, 0.5);
        }
        .card img {
            width: 100%;
            height: 160px;
            object-fit: cover;
            border-radius: 5px;
        }
        h2, h3 {
            color: #FFD700;
            text-align: center;
        }
        select, input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #FFD700;
            border-radius: 5px;
            background-color: #333333;
            color: #FFD700;
        }
        input[type="submit"] {
            background-color: #FFD700;
            color: #000000;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #FFC700;
        }
    </style>
</head>
<body>
    <h2>Choose a Cab and Driver</h2>
    <form action="user_payment.jsp" method="POST">
        <input type="hidden" name="pickup_location" value="<%=request.getParameter("pickup_location")%>">
        <input type="hidden" name="drop_location" value="<%=request.getParameter("drop_location")%>">
        <input type="hidden" name="ride_date" value="<%=request.getParameter("ride_date")%>">
        <input type="hidden" name="ride_time" value="<%=request.getParameter("ride_time")%>">
        <input type="hidden" name="passenger_count" value="<%=request.getParameter("passenger_count")%>">
        <input type="hidden" name="luggage_count" value="<%=request.getParameter("luggage_count")%>">
        <label><b>Select Cab:</b></label>
        <select name="cab_id">
            <%
            Connection conn = DBConn.getConnection();
            CabDAO cabDAO = new CabDAOImpl(conn);
            List<Cab> cabs = cabDAO.getAllCabs();

            if (cabs == null || cabs.isEmpty()) {
                out.println("<option disabled>No cabs available!</option>");
            } else {
                for (Cab cab : cabs) {
                    out.println("<option value='" + cab.getId() + "'>" + cab.getName() + "</option>");
                }
            }
            %>
        </select><br><br>
        <label><b>Select Driver:</b></label>
        <select name="driver_id">
            <%
            DriverDAO driverDAO = new DriverDAOImpl(conn);
            List<Driver> drivers = driverDAO.getAllDrivers();

            if (drivers == null || drivers.isEmpty()) {
                out.println("<option disabled>No drivers available!</option>");
            } else {
                for (Driver driver : drivers) {
                    out.println("<option value='" + driver.getDriverId() + "'>" + driver.getName() + " - " + driver.getPhoneNumber() + "</option>");
                }
            }
            %>
        </select><br><br>
        <input type="submit" value="Next">
    </form>

    <h3>Available Cabs</h3>
    <div class="container">
        <%
        if (cabs != null && !cabs.isEmpty()) {
            for (Cab cab : cabs) {
        %>
        <div class="card">
            <img src="<%=cab.getImage()%>" alt="<%=cab.getName()%>">
            <h3><%=cab.getName()%></h3>
            <p><strong>Description:</strong> <%=cab.getDescription()%></p>
            <p><strong>Capacity:</strong> <%=cab.getCapacity()%> passengers</p>
            <p><strong>Use Case:</strong> <%=cab.getUseCase()%></p>
            <p><strong>Fare Range:</strong> <%=cab.getFareRange()%></p>
        </div>
        <%
            }
        } else {
            out.println("<p>No cabs available.</p>");
        }
        %>
    </div>

    <h3>Available Drivers</h3>
    <div class="container">
        <%
        if (drivers != null && !drivers.isEmpty()) {
            for (Driver driver : drivers) {
        %>
        <div class="card">
            <h3><%=driver.getName()%></h3>
            <p><strong>Phone:</strong> <%=driver.getPhoneNumber()%></p>
            <p><strong>Address:</strong> <%=driver.getAddress()%></p>
        </div>
        <%
            }
        } else {
            out.println("<p>No drivers available.</p>");
        }
        %>
    </div>
</body>
</html>