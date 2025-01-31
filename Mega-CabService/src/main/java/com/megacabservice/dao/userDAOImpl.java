package com.megacabservice.dao;

import java.lang.Character.UnicodeScript;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.megacabservice.entity.user;

public class userDAOImpl implements userDAO {

    private Connection conn;

    public userDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean userRegister(user us) {
        boolean f = false;
        
        // Check if email already exists
        if (isEmailExists(us.getEmail())) {
            return false; // Email already registered
        }

        try {
            String sql = "insert into user(name, email, phone_number, nic, password, address) values(?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhoneNumber());
            ps.setString(4, us.getNic());
            ps.setString(5, us.getPassword());
            ps.setString(6, us.getAddress());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true; // Registration successful
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // Check if email already exists in the database
    private boolean isEmailExists(String email) {
        String query = "SELECT COUNT(*) FROM user WHERE email = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Return true if email exists
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; // Return false if email does not exist
    }

	@Override
	public user login(String email, String password) {
		user us=null;
		
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				us=new user();
				us.setUser_id(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setNic(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}
    
    
    
    
}
