package com.megacabservice.user_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.megacabservice.entity.Driver;
import com.megacabservice.dao.DriverDAO;
import com.megacabservice.dao.DriverDAOImpl;
import com.megacabservice.db.DBConn;

@WebServlet("/addDriver")
public class AddDriverServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    // Forward to the add_driver.jsp form
	    request.getRequestDispatcher("/WEB-INF/view/admin/add_driver.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    try {
	        // Retrieve form data
	        String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        String license = request.getParameter("license");
	        String phone = request.getParameter("phone");
	        String address = request.getParameter("address");

	        // Populate Driver object
	        Driver driver = new Driver();
	        driver.setName(name);
	        driver.setEmail(email);
	        driver.setPassword(password);
	        driver.setLicenseNumber(license);
	        driver.setPhoneNumber(phone);
	        driver.setAddress(address);
	        driver.setStatus("active");

	        // Insert driver into the database
	        DriverDAO dao = new DriverDAOImpl(DBConn.getInstance().getConnection());
	        boolean success = dao.addDriver(driver);

	        // Set success or failure message
	        HttpSession session = request.getSession();
	        if (success) {
	            session.setAttribute("succMsg", "Driver Added Successfully!");
	        } else {
	            session.setAttribute("failedMsg", "Failed to Add Driver!");
	        }

	        // Forward to the view_drivers.jsp page
	        request.getRequestDispatcher("/WEB-INF/view/admin/view_drivers.jsp").forward(request, response);

	    } catch (Exception e) {
	        e.printStackTrace();
	        HttpSession session = request.getSession();
	        session.setAttribute("failedMsg", "Server Error: " + e.getMessage());
	        // Forward to the view_drivers.jsp page even in case of error
	        request.getRequestDispatcher("/WEB-INF/view/admin/view_drivers.jsp").forward(request, response);
	    }
	}
}
