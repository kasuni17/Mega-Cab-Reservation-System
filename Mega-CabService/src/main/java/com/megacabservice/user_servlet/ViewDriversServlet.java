package com.megacabservice.user_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view_drivers")
public class ViewDriversServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        // Forward the request to the JSP file
        request.getRequestDispatcher("/WEB-INF/view/admin/view_drivers.jsp").forward(request, response);
    }
}