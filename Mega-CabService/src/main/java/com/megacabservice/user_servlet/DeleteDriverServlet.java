package com.megacabservice.user_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.megacabservice.dao.DriverDAO;
import com.megacabservice.dao.DriverDAOImpl;
import com.megacabservice.db.DBConn;
@WebServlet("/deleteDriver")
public class DeleteDriverServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            
            DriverDAO dao = new DriverDAOImpl(DBConn.getInstance().getConnection());
            boolean success = dao.deleteDriver(id);

            HttpSession session = request.getSession();
            if(success) {
                session.setAttribute("succMsg", "Driver Deleted Successfully!");
            } else {
                session.setAttribute("failedMsg", "Failed to Delete Driver!");
            }
            response.sendRedirect("admin/view_drivers.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("failedMsg", "Server Error: " + e.getMessage());
            response.sendRedirect("admin/view_drivers.jsp");
        }
    }
}