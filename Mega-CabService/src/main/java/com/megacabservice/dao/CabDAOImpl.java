package com.megacabservice.dao;

import com.megacabservice.entity.Cab;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CabDAOImpl implements CabDAO {

    private Connection conn;

    public CabDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addCab(Cab cab) {
        boolean f = false;
        try {
            String sql = "INSERT INTO cabs(name, image, description, capacity, use_case, fare_range) VALUES(?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cab.getName());
            ps.setString(2, cab.getImage());
            ps.setString(3, cab.getDescription());
            ps.setString(4, cab.getCapacity());
            ps.setString(5, cab.getUseCase());
            ps.setString(6, cab.getFareRange());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<Cab> getAllCabs() {
        List<Cab> cabs = new ArrayList<>();
        try {
            String sql = "SELECT * FROM cabs";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Cab cab = new Cab();
                cab.setId(rs.getInt("id"));
                cab.setName(rs.getString("name"));
                cab.setImage(rs.getString("image"));
                cab.setDescription(rs.getString("description"));
                cab.setCapacity(rs.getString("capacity"));
                cab.setUseCase(rs.getString("use_case"));
                cab.setFareRange(rs.getString("fare_range"));
                cabs.add(cab);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cabs;
    }

    @Override
    public Cab getCabById(int id) {
        Cab cab = null;
        try {
            String sql = "SELECT * FROM cabs WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cab = new Cab();
                cab.setId(rs.getInt("id"));
                cab.setName(rs.getString("name"));
                cab.setImage(rs.getString("image"));
                cab.setDescription(rs.getString("description"));
                cab.setCapacity(rs.getString("capacity"));
                cab.setUseCase(rs.getString("use_case"));
                cab.setFareRange(rs.getString("fare_range"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cab;
    }

    @Override
    public boolean updateCab(Cab cab) {
        boolean f = false;
        try {
            String sql = "UPDATE cabs SET name=?, image=?, description=?, capacity=?, use_case=?, fare_range=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cab.getName());
            ps.setString(2, cab.getImage());
            ps.setString(3, cab.getDescription());
            ps.setString(4, cab.getCapacity());
            ps.setString(5, cab.getUseCase());
            ps.setString(6, cab.getFareRange());
            ps.setInt(7, cab.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean deleteCab(int id) {
        boolean f = false;
        try {
            String sql = "DELETE FROM cabs WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}