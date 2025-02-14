package com.megacabservice.user_servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.megacabservice.dao.DriverDAOImpl;
import com.megacabservice.db.DBConn;
import com.megacabservice.dao.DriverDAO;
import com.megacabservice.entity.Driver;

@WebServlet("/view_drivers")
public class ViewDriversServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        DriverDAO dao = new DriverDAOImpl(DBConn.getInstance().getConnection());
        List<Driver> driverList = dao.getAllDrivers();
        request.setAttribute("driverList", driverList);
        request.getRequestDispatcher("/WEB-INF/view/admin/view_drivers.jsp").forward(request, response);
    }
}