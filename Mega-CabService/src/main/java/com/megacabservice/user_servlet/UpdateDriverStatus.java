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
        Driver driver = (Driver) session.getAttribute("driverobj"); 

        if (driver == null) {
            
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        
        String status = request.getParameter("status");
        driver.setStatus(status);

       
        Connection conn = null;
        try {
            conn = DBConn.getConnection();
            DriverDAOImpl driverDAO = new DriverDAOImpl(conn);

            
            Driver currentDriver = driverDAO.getDriverById(driver.getDriverId());
            if (currentDriver != null) {
              
                driver.setPassword(currentDriver.getPassword());
            }

           
            boolean success = driverDAO.updateDriver(driver);

            if (success) {
                
                session.setAttribute("driverobj", driver);
               
                response.sendRedirect(request.getContextPath() + "/driverProfile?success=1");
            } else {
                
                response.sendRedirect(request.getContextPath() + "/driverProfile?error=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
            
            response.sendRedirect(request.getContextPath() + "/driverProfile?error=1");
        } finally {
           
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