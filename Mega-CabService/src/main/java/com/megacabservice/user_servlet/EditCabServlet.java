package com.megacabservice.user_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacabservice.dao.CabDAO;
import com.megacabservice.entity.Cab;

@WebServlet("/editCab")
public class EditCabServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CabDAO dao = new CabDAO();
        Cab cab = dao.getCabById(id);
        request.setAttribute("cab", cab);
        request.getRequestDispatcher("/WEB-INF/view/admin/editCab.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String capacity = request.getParameter("capacity");
        String useCase = request.getParameter("useCase");
        String fareRange = request.getParameter("fareRange");
        // Handle image upload if needed
        // Update the database with new values
        CabDAO dao = new CabDAO();
        dao.updateCab(id, name, description, capacity, useCase, fareRange);
        response.sendRedirect("manageCabs");
    }
}

