package com.megacabservice.dao;


import com.megacabservice.db.DBConn;
import com.megacabservice.entity.Cab;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

public class CabDAO {
    private Connection conn;

    public CabDAO() {
        // Establish database connection (use your database connection setup here)
        this.conn = DBConn.getConnection();  // You need a DBConn class for connecting to your DB
    }

    public List<Cab> getAllCabs() {
        List<Cab> cabs = new ArrayList<>();
        try {
            String query = "SELECT * FROM cabs";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Cab cab = new Cab(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
                        rs.getString("description"), rs.getString("capacity"), rs.getString("use_case"),
                        rs.getString("fare_range"));
                cabs.add(cab);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cabs;
    }

    public Cab getCabById(int id) {
        Cab cab = null;
        try {
            String query = "SELECT * FROM cabs WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                cab = new Cab(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
                        rs.getString("description"), rs.getString("capacity"), rs.getString("use_case"),
                        rs.getString("fare_range"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cab;
    }

    public void updateCab(int id, String name, String description, String capacity, String useCase, String fareRange) {
        try {
            String query = "UPDATE cabs SET name = ?, description = ?, capacity = ?, use_case = ?, fare_range = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
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

    public void deleteCab(int id) {
        try {
            String query = "DELETE FROM cabs WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addCab(String name, String description, String capacity, String useCase, String fareRange) {
        try {
            String query = "INSERT INTO cabs (name, description, capacity, use_case, fare_range) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setString(2, description);
            stmt.setString(3, capacity);
            stmt.setString(4, useCase);
            stmt.setString(5, fareRange);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
