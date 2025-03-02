package com.megacabservice.dao;

import com.megacabservice.entity.user;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

class userDAOImplTest {

    @Mock
    private Connection conn;

    @Mock
    private PreparedStatement ps;

    @Mock
    private ResultSet rs;

    private userDAOImpl userDAO;

    @BeforeEach
    void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        userDAO = new userDAOImpl(conn);

        when(conn.prepareStatement(anyString())).thenReturn(ps);
        when(ps.executeQuery()).thenReturn(rs);
    }

    @Test
    void testUserRegister() throws Exception {
        user user = new user();
        user.setName("John Doe");
        user.setEmail("john.doe@example.com");
        user.setPhoneNumber("1234567890");
        user.setNic("NIC12345");
        user.setPassword("password123");
        user.setAddress("123 Main St");

        when(ps.executeUpdate()).thenReturn(1);

        boolean result = userDAO.userRegister(user);
        assertTrue(result);

        verify(ps, times(1)).setString(1, user.getName());
        verify(ps, times(1)).setString(2, user.getEmail());
        verify(ps, times(1)).setString(3, user.getPhoneNumber());
        verify(ps, times(1)).setString(4, user.getNic());
        verify(ps, times(1)).setString(5, user.getPassword());
        verify(ps, times(1)).setString(6, user.getAddress());
        verify(ps, times(1)).executeUpdate();
    }

    @Test
    void testLogin() throws Exception {
        user user = new user();
        user.setUser_id(1);
        user.setName("John Doe");
        user.setEmail("john.doe@example.com");
        user.setPhoneNumber("1234567890");
        user.setNic("NIC12345");
        user.setPassword("password123");
        user.setAddress("123 Main St");
        user.setCreatedAt(new Timestamp(System.currentTimeMillis()));

        when(rs.next()).thenReturn(true);
        when(rs.getInt("user_id")).thenReturn(user.getUser_id());
        when(rs.getString("name")).thenReturn(user.getName());
        when(rs.getString("email")).thenReturn(user.getEmail());
        when(rs.getString("phone_number")).thenReturn(user.getPhoneNumber());
        when(rs.getString("nic")).thenReturn(user.getNic());
        when(rs.getString("password")).thenReturn(user.getPassword());
        when(rs.getString("address")).thenReturn(user.getAddress());
        when(rs.getTimestamp("created_at")).thenReturn(user.getCreatedAt());

        user loggedInUser = userDAO.login("john.doe@example.com", "password123");
        assertNotNull(loggedInUser);
        assertEquals(user.getUser_id(), loggedInUser.getUser_id());
        assertEquals(user.getName(), loggedInUser.getName());
        assertEquals(user.getEmail(), loggedInUser.getEmail());
        assertEquals(user.getPhoneNumber(), loggedInUser.getPhoneNumber());
        assertEquals(user.getNic(), loggedInUser.getNic());
        assertEquals(user.getPassword(), loggedInUser.getPassword());
        assertEquals(user.getAddress(), loggedInUser.getAddress());
        assertEquals(user.getCreatedAt(), loggedInUser.getCreatedAt());

        verify(ps, times(1)).setString(1, "john.doe@example.com");
        verify(ps, times(1)).setString(2, "password123");
        verify(ps, times(1)).executeQuery();
    }

    @Test
    void testGetAllUsers() throws Exception {
        user user = new user();
        user.setUser_id(1);
        user.setName("John Doe");
        user.setEmail("john.doe@example.com");
        user.setPhoneNumber("1234567890");
        user.setNic("NIC12345");
        user.setPassword("password123");
        user.setAddress("123 Main St");
        user.setCreatedAt(new Timestamp(System.currentTimeMillis()));

        when(rs.next()).thenReturn(true, false);
        when(rs.getInt("user_id")).thenReturn(user.getUser_id());
        when(rs.getString("name")).thenReturn(user.getName());
        when(rs.getString("email")).thenReturn(user.getEmail());
        when(rs.getString("phone_number")).thenReturn(user.getPhoneNumber());
        when(rs.getString("nic")).thenReturn(user.getNic());
        when(rs.getString("password")).thenReturn(user.getPassword());
        when(rs.getString("address")).thenReturn(user.getAddress());
        when(rs.getTimestamp("created_at")).thenReturn(user.getCreatedAt());

        List<user> users = userDAO.getAllUsers();
        assertNotNull(users);
        assertEquals(1, users.size());

        user retrievedUser = users.get(0);
        assertEquals(user.getUser_id(), retrievedUser.getUser_id());
        assertEquals(user.getName(), retrievedUser.getName());
        assertEquals(user.getEmail(), retrievedUser.getEmail());
        assertEquals(user.getPhoneNumber(), retrievedUser.getPhoneNumber());
        assertEquals(user.getNic(), retrievedUser.getNic());
        assertEquals(user.getPassword(), retrievedUser.getPassword());
        assertEquals(user.getAddress(), retrievedUser.getAddress());
        assertEquals(user.getCreatedAt(), retrievedUser.getCreatedAt());

        verify(ps, times(1)).executeQuery();
    }

    @Test
    void testDeleteUser() throws Exception {
        when(ps.executeUpdate()).thenReturn(1);

        boolean result = userDAO.deleteUser(1);
        assertTrue(result);

        verify(ps, times(1)).setInt(1, 1);
        verify(ps, times(1)).executeUpdate();
    }

    @Test
    void testUpdateUser() throws Exception {
        user user = new user();
        user.setUser_id(1);
        user.setName("John Doe");
        user.setEmail("john.doe@example.com");
        user.setPhoneNumber("1234567890");
        user.setNic("NIC12345");
        user.setAddress("123 Main St");

        when(ps.executeUpdate()).thenReturn(1);

        boolean result = userDAO.updateUser(user);
        assertTrue(result);

        verify(ps, times(1)).setString(1, user.getName());
        verify(ps, times(1)).setString(2, user.getEmail());
        verify(ps, times(1)).setString(3, user.getPhoneNumber());
        verify(ps, times(1)).setString(4, user.getNic());
        verify(ps, times(1)).setString(5, user.getAddress());
        verify(ps, times(1)).setInt(6, user.getUser_id());
        verify(ps, times(1)).executeUpdate();
    }

    @Test
    void testGetUserById() throws Exception {
        user user = new user();
        user.setUser_id(1);
        user.setName("John Doe");
        user.setEmail("john.doe@example.com");
        user.setPhoneNumber("1234567890");
        user.setNic("NIC12345");
        user.setPassword("password123");
        user.setAddress("123 Main St");
        user.setCreatedAt(new Timestamp(System.currentTimeMillis()));

        when(rs.next()).thenReturn(true);
        when(rs.getInt("user_id")).thenReturn(user.getUser_id());
        when(rs.getString("name")).thenReturn(user.getName());
        when(rs.getString("email")).thenReturn(user.getEmail());
        when(rs.getString("phone_number")).thenReturn(user.getPhoneNumber());
        when(rs.getString("nic")).thenReturn(user.getNic());
        when(rs.getString("password")).thenReturn(user.getPassword());
        when(rs.getString("address")).thenReturn(user.getAddress());
        when(rs.getTimestamp("created_at")).thenReturn(user.getCreatedAt());

        user retrievedUser = userDAO.getUserById(1);
        assertNotNull(retrievedUser);
        assertEquals(user.getUser_id(), retrievedUser.getUser_id());
        assertEquals(user.getName(), retrievedUser.getName());
        assertEquals(user.getEmail(), retrievedUser.getEmail());
        assertEquals(user.getPhoneNumber(), retrievedUser.getPhoneNumber());
        assertEquals(user.getNic(), retrievedUser.getNic());
        assertEquals(user.getPassword(), retrievedUser.getPassword());
        assertEquals(user.getAddress(), retrievedUser.getAddress());
        assertEquals(user.getCreatedAt(), retrievedUser.getCreatedAt());

        verify(ps, times(1)).setInt(1, 1);
        verify(ps, times(1)).executeQuery();
    }
}