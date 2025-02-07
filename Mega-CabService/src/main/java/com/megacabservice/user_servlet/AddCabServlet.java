package com.megacabservice.user_servlet;


import com.megacabservice.dao.CabDAO; // Import CabDAO
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addCab")
public class AddCabServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String capacity = request.getParameter("capacity");
        String useCase = request.getParameter("useCase");
        String fareRange = request.getParameter("fareRange");
        // Handle image upload if needed

        CabDAO dao = new CabDAO();
        dao.addCab(name, description, capacity, useCase, fareRange);
        response.sendRedirect("manageCabs");
    }
}
