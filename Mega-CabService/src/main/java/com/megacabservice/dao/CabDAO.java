package com.megacabservice.dao;

import com.megacabservice.db.DBConn;
import com.megacabservice.entity.Cab;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class CabDAO {
    private Connection conn;

    public CabDAO() {
        this.conn = DBConn.getConnection();  // Initialize database connection
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
            e.printStackTrace(); // Log error properly in production
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
    public void updateCab(int id, String name, String description, String capacity, String useCase, String fareRange) {
        String query = "UPDATE cabs SET name = ?, description = ?, capacity = ?, use_case = ?, fare_range = ? WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, name);
            stmt.setString(2, description);
            stmt.setString(3, capacity);
            stmt.setString(4, useCase);
            stmt.setString(5, fareRange);
            stmt.setInt(6, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete cab by ID
    public void deleteCab(int id) {
        String query = "DELETE FROM cabs WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
