package com.megacabservice.dao;

import com.megacabservice.entity.Driver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DriverDAOImpl implements DriverDAO {
    private Connection conn;

    public DriverDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addDriver(Driver driver) {
        boolean success = false;
        try {
            String sql = "INSERT INTO driver (name, email, password, license_number, phone_number, address) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, driver.getName());
            ps.setString(2, driver.getEmail());
            ps.setString(3, driver.getPassword());
            ps.setString(4, driver.getLicenseNumber());
            ps.setString(5, driver.getPhoneNumber());
            ps.setString(6, driver.getAddress());

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    @Override
    public Driver login(String email, String password) {
        Driver driver = null;
        try {
            String sql = "SELECT * FROM driver WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                driver = new Driver();
                driver.setDriverId(rs.getInt("driver_id"));
                driver.setName(rs.getString("name"));
                driver.setEmail(rs.getString("email"));
                driver.setLicenseNumber(rs.getString("license_number"));
                driver.setPhoneNumber(rs.getString("phone_number"));
                driver.setAddress(rs.getString("address"));
                driver.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return driver;
    }

    @Override
    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        try {
            String sql = "SELECT * FROM driver";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Driver driver = new Driver();
                driver.setDriverId(rs.getInt("driver_id"));
                driver.setName(rs.getString("name"));
                driver.setEmail(rs.getString("email"));
                driver.setLicenseNumber(rs.getString("license_number"));
                driver.setPhoneNumber(rs.getString("phone_number"));
                driver.setAddress(rs.getString("address"));
                driver.setStatus(rs.getString("status"));
                drivers.add(driver);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return drivers;
    }

    @Override
    public boolean updateDriver(Driver driver) {
        boolean success = false;
        try {
            String sql = "UPDATE driver SET name = ?, email = ?, password = ?, license_number = ?, phone_number = ?, address = ?, status = ? WHERE driver_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, driver.getName());
            ps.setString(2, driver.getEmail());
            ps.setString(3, driver.getPassword());
            ps.setString(4, driver.getLicenseNumber());
            ps.setString(5, driver.getPhoneNumber());
            ps.setString(6, driver.getAddress());
            ps.setString(7, driver.getStatus());
            ps.setInt(8, driver.getDriverId());

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    @Override
    public boolean deleteDriver(int driverId) {
        boolean success = false;
        try {
            String sql = "DELETE FROM driver WHERE driver_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, driverId);

            int rowsDeleted = ps.executeUpdate();
            if (rowsDeleted > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
}