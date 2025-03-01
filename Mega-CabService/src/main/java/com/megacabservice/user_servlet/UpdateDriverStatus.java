package com.megacabservice.user_servlet;

import com.megacabservice.dao.DriverDAOImpl;
import com.megacabservice.entity.Driver;
import com.megacabservice.db.DBConn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/UpdateDriverStatus")
public class UpdateDriverStatus extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Driver driver = (Driver) session.getAttribute("driverobj"); // Use "driverobj"

        if (driver == null) {
            // If the driver is not logged in, redirect to the login page
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // Get the updated status from the form
        String status = request.getParameter("status");
        driver.setStatus(status);

        // Update the driver's status in the database
        Connection conn = null;
        try {
            conn = DBConn.getConnection();
            DriverDAOImpl driverDAO = new DriverDAOImpl(conn);

            // Retrieve the current driver's details, including the password, from the database
            Driver currentDriver = driverDAO.getDriverById(driver.getDriverId());
            if (currentDriver != null) {
                // Set the current password in the driver object
                driver.setPassword(currentDriver.getPassword());
            }

            // Update the driver's status
            boolean success = driverDAO.updateDriver(driver);

            if (success) {
                // Update the driver object in the session
                session.setAttribute("driverobj", driver);
                // Redirect to the driver profile page with a success message
                response.sendRedirect(request.getContextPath() + "/driverProfile?success=1");
            } else {
                // Redirect to the driver profile page with an error message
                response.sendRedirect(request.getContextPath() + "/driverProfile?error=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to the driver profile page with an error message
            response.sendRedirect(request.getContextPath() + "/driverProfile?error=1");
        } finally {
            // Close the database connection
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}