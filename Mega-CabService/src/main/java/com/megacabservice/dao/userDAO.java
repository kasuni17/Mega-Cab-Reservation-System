package com.megacabservice.dao;

import com.megacabservice.entity.user;
import java.util.List;

public interface userDAO {
    public boolean userRegister(user us);
    public user login(String email, String password);
    public List<user> getAllUsers();
    public boolean deleteUser(int userId);
    public boolean updateUser(user user);
    public user getUserById(int userId);
    
    
}