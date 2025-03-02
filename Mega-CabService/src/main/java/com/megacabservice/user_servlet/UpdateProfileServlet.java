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

    
    private static final String JDBC_URL = "jdbc:mysql://127.0.0.1:3306/mega_cab_service";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "12345";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userIdStr = request.getParameter("user_id"); 
        if (userIdStr == null || userIdStr.trim().isEmpty()) {
            
            response.sendRedirect("error.jsp?message=User ID is missing or invalid");
            return;
        }

        int userId;
        try {
            userId = Integer.parseInt(userIdStr); 
        } catch (NumberFormatException e) {
            
            response.sendRedirect("error.jsp?message=Invalid User ID");
            return;
        }

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String password = request.getParameter("password");

        
        String hashedPassword = hashPassword(password);

        
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
            String sql = "UPDATE user SET name=?, email=?, nic=?, password=? WHERE user_id=?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, nic);
                pstmt.setString(4, hashedPassword); 
                pstmt.setInt(5, userId); 

                int rowsUpdated = pstmt.executeUpdate();
                if (rowsUpdated > 0) {
                    response.sendRedirect("profileUpdated.jsp"); 
                } else {
                    response.sendRedirect("error.jsp?message=No rows updated"); 
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=Database error: " + e.getMessage()); 
        }
    }

    
    private String hashPassword(String password) {
        
        return password;
    }
}