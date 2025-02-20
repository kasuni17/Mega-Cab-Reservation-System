package com.megacabservice.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.megacabservice.entity.Contact;

public class ContactDAO {
    private Connection con;

    public ContactDAO(Connection con) {
        this.con = con;
    }
    
    public boolean saveMessage(Contact contact) {
        String sql = "INSERT INTO contact_messages (name, email, phone, message) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, contact.getName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getPhone());
            ps.setString(4, contact.getMessage());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Contact> getAllMessages() {
        List<Contact> messages = new ArrayList<>();
        String sql = "SELECT * FROM contact_messages ORDER BY created_at DESC";
        try (Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Contact contact = new Contact();
                contact.setId(rs.getInt("id"));
                contact.setName(rs.getString("name"));
                contact.setEmail(rs.getString("email"));
                contact.setPhone(rs.getString("phone"));
                contact.setMessage(rs.getString("message"));
                contact.setCreatedAt(rs.getTimestamp("created_at"));
                contact.setAdminReply(rs.getString("admin_reply"));
                contact.setRepliedAt(rs.getTimestamp("replied_at"));
                contact.setStatus(rs.getString("status"));
                messages.add(contact);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return messages;
    }
    
    public boolean updateReply(int messageId, String reply) {
        String sql = "UPDATE contact_messages SET admin_reply = ?, replied_at = NOW(), status = 'REPLIED' WHERE id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, reply);
            ps.setInt(2, messageId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}