package com.megacabservice.user_servlet;

import com.megacabservice.entity.Driver;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/driverProfile")
public class DriverProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Driver driver = (Driver) session.getAttribute("driverobj"); 

        if (driver == null) {
            
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        } else {
            
            req.getRequestDispatcher("/WEB-INF/view/driver/driverProfile.jsp").forward(req, resp);
        }
    }
}