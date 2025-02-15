package com.megacabservice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.megacabservice.entity.user;

public class userDAOImpl implements userDAO {

    private Connection conn;

    public userDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean userRegister(user us) {
        boolean f = false;
        try {
            String sql = "INSERT INTO user(name, email, phone_number, nic, password, address) VALUES(?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhoneNumber());
            ps.setString(4, us.getNic());
            ps.setString(5, us.getPassword());
            ps.setString(6, us.getAddress());

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
    public user login(String email, String password) {
        user us = null;
        try {
            String sql = "SELECT * FROM user WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                us = new user();
                us.setUser_id(rs.getInt("user_id"));
                us.setName(rs.getString("name"));
                us.setEmail(rs.getString("email"));
                us.setPhoneNumber(rs.getString("phone_number"));
                us.setNic(rs.getString("nic"));
                us.setPassword(rs.getString("password"));
                us.setAddress(rs.getString("address"));
                us.setCreatedAt(rs.getTimestamp("created_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return us;
    }

    @Override
    public List<user> getAllUsers() {
        List<user> users = new ArrayList<>();
        try {
            String sql = "SELECT * FROM user";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                user user = new user();
                user.setUser_id(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phone_number"));
                user.setNic(rs.getString("nic"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));
                user.setCreatedAt(rs.getTimestamp("created_at"));
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean deleteUser(int userId) {
        boolean f = false;
        try {
            String sql = "DELETE FROM user WHERE user_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);

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
    public boolean updateUser(user user) {
        boolean f = false;
        try {
            String sql = "UPDATE user SET name=?, email=?, phone_number=?, nic=?, address=? WHERE user_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhoneNumber());
            ps.setString(4, user.getNic());
            ps.setString(5, user.getAddress());
            ps.setInt(6, user.getUser_id());

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
    public user getUserById(int userId) {
        user us = null;
        try {
            String sql = "SELECT * FROM user WHERE user_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                us = new user();
                us.setUser_id(rs.getInt("user_id"));
                us.setName(rs.getString("name"));
                us.setEmail(rs.getString("email"));
                us.setPhoneNumber(rs.getString("phone_number"));
                us.setNic(rs.getString("nic"));
                us.setPassword(rs.getString("password"));
                us.setAddress(rs.getString("address"));
                us.setCreatedAt(rs.getTimestamp("created_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return us;
    }
}