package com.megacabservice.user_servlet;

import com.megacabservice.dao.userDAO;
import com.megacabservice.dao.userDAOImpl;
import com.megacabservice.db.DBConn;
import com.megacabservice.entity.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
    private userDAO userDAO = new userDAOImpl(DBConn.getConnection());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the user ID from the request
        int userId = Integer.parseInt(request.getParameter("id"));

        // Fetch the user details from the database
        user user = userDAO.getUserById(userId);

        // Debugging: Print the user details
        System.out.println("User fetched for editing: " + user);

        // Pass the user object to the JSP
        request.setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/view/admin/editUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        int userId = Integer.parseInt(request.getParameter("user_id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number");
        String nic = request.getParameter("nic");
        String address = request.getParameter("address");

        // Create a user object with updated details
        user updatedUser = new user(userId, name, email, phoneNumber, nic, address);

        // Update the user in the database
        userDAO.updateUser(updatedUser);

        // Redirect to the viewUsers page
        response.sendRedirect("viewUsers");
    }
}