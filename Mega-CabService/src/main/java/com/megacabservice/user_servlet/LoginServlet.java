package com.megacabservice.user_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.megacabservice.dao.userDAOImpl;
import com.megacabservice.dao.DriverDAOImpl;
import com.megacabservice.db.DBConn;
import com.megacabservice.entity.user;

import com.megacabservice.entity.Driver;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get email and password from the login form
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            // Get the session object
            HttpSession session = req.getSession();

            // Hardcoded Admin Check (for testing purposes)
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                // Create a dummy admin user object
                user admin = new user();
                admin.setName("Admin");
                admin.setEmail("admin@gmail.com");

                // Set admin user object in session
                session.setAttribute("userobj", admin);

                // Redirect to the admin home page
                req.getRequestDispatcher("/WEB-INF/view/admin/home.jsp").forward(req, resp);
                return; // Exit the method after redirecting
            }

            // Check if it's a regular user login
            userDAOImpl userDAO = new userDAOImpl(DBConn.getInstance().getConnection());
            user user = userDAO.login(email, password);

            if (user != null) {
                // Set user object in session
                session.setAttribute("userobj", user);

                // Redirect to the user home page
                resp.sendRedirect("home.jsp");
                return; // Exit the method after redirecting
            }

            // Check if it's a driver login
            DriverDAOImpl driverDAO = new DriverDAOImpl(DBConn.getInstance().getConnection());
            Driver driver = driverDAO.login(email, password);

            if (driver != null) {
                // Set driver object in session
                session.setAttribute("driverobj", driver);

                // Redirect to the driver home page
                req.getRequestDispatcher("/WEB-INF/view/driver/home.jsp").forward(req, resp);
                return; // Exit the method after redirecting
            }

            // If no user or driver is found, show an error message
            session.setAttribute("failedMsg", "Invalid Email or Password");
            resp.sendRedirect("login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions and show an error message
            HttpSession session = req.getSession();
            session.setAttribute("failedMsg", "Something went wrong. Please try again.");
            resp.sendRedirect("login.jsp");
        }
    }
}