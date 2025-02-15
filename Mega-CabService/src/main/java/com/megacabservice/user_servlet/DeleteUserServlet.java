package com.megacabservice.user_servlet;

import com.megacabservice.dao.userDAO;
import com.megacabservice.dao.userDAOImpl;
import com.megacabservice.db.DBConn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    private userDAO userDAO = new userDAOImpl(DBConn.getConnection());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the user ID from the request
        int userId = Integer.parseInt(request.getParameter("id"));
        
        // Delete the user from the database
        userDAO.deleteUser(userId);
        
        // Redirect to the viewUsers page
        response.sendRedirect("viewUsers");
    }
}