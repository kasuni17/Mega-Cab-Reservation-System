package com.megacabservice.user_servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://127.0.0.1:3306/mega_cab_service";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "12345";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String userIdStr = request.getParameter("user_id"); // Get user_id as a string
        if (userIdStr == null || userIdStr.trim().isEmpty()) {
            // Handle the case where user_id is missing or empty
            response.sendRedirect("error.jsp?message=User ID is missing or invalid");
            return;
        }

        int userId;
        try {
            userId = Integer.parseInt(userIdStr); // Parse user_id to an integer
        } catch (NumberFormatException e) {
            // Handle the case where user_id is not a valid integer
            response.sendRedirect("error.jsp?message=Invalid User ID");
            return;
        }

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String password = request.getParameter("password");

        // Hash the password before saving (use a library like BCrypt)
        String hashedPassword = hashPassword(password);

        // Update the user in the database
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
            String sql = "UPDATE user SET name=?, email=?, nic=?, password=? WHERE user_id=?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, nic);
                pstmt.setString(4, hashedPassword); // Save the hashed password
                pstmt.setInt(5, userId); // Use user_id as the unique identifier

                int rowsUpdated = pstmt.executeUpdate();
                if (rowsUpdated > 0) {
                    response.sendRedirect("profileUpdated.jsp"); // Redirect to a success page
                } else {
                    response.sendRedirect("error.jsp?message=No rows updated"); // Redirect to an error page
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=Database error: " + e.getMessage()); // Redirect to an error page
        }
    }

    // Method to hash the password (use a library like BCrypt)
    private String hashPassword(String password) {
        // For now, return the plain-text password (replace with actual hashing logic)
        return password;
    }
}