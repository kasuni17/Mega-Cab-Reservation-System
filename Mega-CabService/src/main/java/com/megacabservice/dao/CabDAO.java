package com.megacabservice.dao;

import com.megacabservice.db.DBConn;
import com.megacabservice.entity.Cab;

import java.sql.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.util.ArrayList;
import java.io.File;
import java.io.IOException;
import java.nio.file.*;

public class CabDAO {
    private Connection conn;

    public CabDAO() {
        // Initialize database connection
        this.conn = DBConn.getConnection();
    }

    // Retrieve all cabs from the database
    public List<Cab> getAllCabs() {
        List<Cab> cabs = new ArrayList<>();
        String query = "SELECT * FROM cabs";
        try (PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Cab cab = new Cab(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("image"),
                    rs.getString("description"),
                    rs.getString("capacity"),
                    rs.getString("use_case"),
                    rs.getString("fare_range")
                );
                cabs.add(cab);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cabs;
    }

    // Retrieve a cab by ID
    public Cab getCabById(int id) {
        String query = "SELECT * FROM cabs WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Cab(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getString("capacity"),
                        rs.getString("use_case"),
                        rs.getString("fare_range")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Add a new cab
    public void addCab(String name, String image, String description, String capacity, String useCase, String fareRange) {
        String query = "INSERT INTO cabs (name, image, description, capacity, use_case, fare_range) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, name);
            stmt.setString(2, image);
            stmt.setString(3, description);
            stmt.setString(4, capacity);
            stmt.setString(5, useCase);
            stmt.setString(6, fareRange);
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new cab was inserted successfully!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update cab details
    public boolean updateCab(Cab cab) {
        String query = "UPDATE cabs SET name = ?, description = ?, capacity = ?, use_case = ?, fare_range = ?, image = ? WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, cab.getName());
            stmt.setString(2, cab.getDescription());
            stmt.setString(3, cab.getCapacity());
            stmt.setString(4, cab.getUseCase());
            stmt.setString(5, cab.getFareRange());
            stmt.setString(6, cab.getImage());
            stmt.setInt(7, cab.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete cab by ID
    public boolean deleteCab(int id) {
        String query = "DELETE FROM cabs WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to handle cab image file uploads
    public boolean uploadCabImage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Get file part from the form
        Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">
        if (filePart != null && filePart.getSize() > 0) {
            // Get the file name
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadDir = request.getServletContext().getRealPath("/uploads");
            File uploadDirPath = new File(uploadDir);
            if (!uploadDirPath.exists()) {
                uploadDirPath.mkdir();
            }

            // Define the destination path for the file
            String filePath = uploadDir + File.separator + fileName;

            // Write the file to the server
            try {
                filePart.write(filePath);
                return true;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}