package com.megacabservice.dao;

import com.megacabservice.entity.Driver;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

class DriverDAOImplTest {

    @Mock
    private Connection conn;

    @Mock
    private PreparedStatement ps;

    @Mock
    private ResultSet rs;

    private DriverDAOImpl driverDAO;

    @BeforeEach
    void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        driverDAO = new DriverDAOImpl(conn);

        when(conn.prepareStatement(anyString())).thenReturn(ps);
        when(ps.executeQuery()).thenReturn(rs);
    }

    @Test
    void testAddDriver() throws Exception {
        Driver driver = new Driver();
        driver.setName("John Doe");
        driver.setEmail("john.doe@example.com");
        driver.setPassword("password123");
        driver.setLicenseNumber("LIC12345");
        driver.setPhoneNumber("1234567890");
        driver.setAddress("123 Main St");

        when(ps.executeUpdate()).thenReturn(1);

        boolean result = driverDAO.addDriver(driver);
        assertTrue(result);

        verify(ps, times(1)).setString(1, driver.getName());
        verify(ps, times(1)).setString(2, driver.getEmail());
        verify(ps, times(1)).setString(3, driver.getPassword());
        verify(ps, times(1)).setString(4, driver.getLicenseNumber());
        verify(ps, times(1)).setString(5, driver.getPhoneNumber());
        verify(ps, times(1)).setString(6, driver.getAddress());
        verify(ps, times(1)).executeUpdate();
    }

    @Test
    void testLogin() throws Exception {
        Driver driver = new Driver();
        driver.setDriverId(1);
        driver.setName("John Doe");
        driver.setEmail("john.doe@example.com");
        driver.setLicenseNumber("LIC12345");
        driver.setPhoneNumber("1234567890");
        driver.setAddress("123 Main St");
        driver.setStatus("Active");

        when(rs.next()).thenReturn(true);
        when(rs.getInt("driver_id")).thenReturn(driver.getDriverId());
        when(rs.getString("name")).thenReturn(driver.getName());
        when(rs.getString("email")).thenReturn(driver.getEmail());
        when(rs.getString("license_number")).thenReturn(driver.getLicenseNumber());
        when(rs.getString("phone_number")).thenReturn(driver.getPhoneNumber());
        when(rs.getString("address")).thenReturn(driver.getAddress());
        when(rs.getString("status")).thenReturn(driver.getStatus());

        Driver loggedInDriver = driverDAO.login("john.doe@example.com", "password123");
        assertNotNull(loggedInDriver);
        assertEquals(driver.getDriverId(), loggedInDriver.getDriverId());
        assertEquals(driver.getName(), loggedInDriver.getName());
        assertEquals(driver.getEmail(), loggedInDriver.getEmail());
        assertEquals(driver.getLicenseNumber(), loggedInDriver.getLicenseNumber());
        assertEquals(driver.getPhoneNumber(), loggedInDriver.getPhoneNumber());
        assertEquals(driver.getAddress(), loggedInDriver.getAddress());
        assertEquals(driver.getStatus(), loggedInDriver.getStatus());

        verify(ps, times(1)).setString(1, "john.doe@example.com");
        verify(ps, times(1)).setString(2, "password123");
        verify(ps, times(1)).executeQuery();
    }

    @Test
    void testGetAllDrivers() throws Exception {
        Driver driver = new Driver();
        driver.setDriverId(1);
        driver.setName("John Doe");
        driver.setEmail("john.doe@example.com");
        driver.setLicenseNumber("LIC12345");
        driver.setPhoneNumber("1234567890");
        driver.setAddress("123 Main St");
        driver.setStatus("Active");

        when(rs.next()).thenReturn(true, false);
        when(rs.getInt("driver_id")).thenReturn(driver.getDriverId());
        when(rs.getString("name")).thenReturn(driver.getName());
        when(rs.getString("email")).thenReturn(driver.getEmail());
        when(rs.getString("license_number")).thenReturn(driver.getLicenseNumber());
        when(rs.getString("phone_number")).thenReturn(driver.getPhoneNumber());
        when(rs.getString("address")).thenReturn(driver.getAddress());
        when(rs.getString("status")).thenReturn(driver.getStatus());

        List<Driver> drivers = driverDAO.getAllDrivers();
        assertNotNull(drivers);
        assertEquals(1, drivers.size());

        Driver retrievedDriver = drivers.get(0);
        assertEquals(driver.getDriverId(), retrievedDriver.getDriverId());
        assertEquals(driver.getName(), retrievedDriver.getName());
        assertEquals(driver.getEmail(), retrievedDriver.getEmail());
        assertEquals(driver.getLicenseNumber(), retrievedDriver.getLicenseNumber());
        assertEquals(driver.getPhoneNumber(), retrievedDriver.getPhoneNumber());
        assertEquals(driver.getAddress(), retrievedDriver.getAddress());
        assertEquals(driver.getStatus(), retrievedDriver.getStatus());

        verify(ps, times(1)).executeQuery();
    }

    @Test
    void testUpdateDriver() throws Exception {
        Driver driver = new Driver();
        driver.setDriverId(1);
        driver.setName("John Doe");
        driver.setEmail("john.doe@example.com");
        driver.setPassword("password123");
        driver.setLicenseNumber("LIC12345");
        driver.setPhoneNumber("1234567890");
        driver.setAddress("123 Main St");
        driver.setStatus("Active");

        when(ps.executeUpdate()).thenReturn(1);

        boolean result = driverDAO.updateDriver(driver);
        assertTrue(result);

        verify(ps, times(1)).setString(1, driver.getName());
        verify(ps, times(1)).setString(2, driver.getEmail());
        verify(ps, times(1)).setString(3, driver.getPassword());
        verify(ps, times(1)).setString(4, driver.getLicenseNumber());
        verify(ps, times(1)).setString(5, driver.getPhoneNumber());
        verify(ps, times(1)).setString(6, driver.getAddress());
        verify(ps, times(1)).setString(7, driver.getStatus());
        verify(ps, times(1)).setInt(8, driver.getDriverId());
        verify(ps, times(1)).executeUpdate();
    }

    @Test
    void testDeleteDriver() throws Exception {
        when(ps.executeUpdate()).thenReturn(1);

        boolean result = driverDAO.deleteDriver(1);
        assertTrue(result);

        verify(ps, times(1)).setInt(1, 1);
        verify(ps, times(1)).executeUpdate();
    }

    @Test
    void testGetDriverById() throws Exception {
        Driver driver = new Driver();
        driver.setDriverId(1);
        driver.setName("John Doe");
        driver.setEmail("john.doe@example.com");
        driver.setPassword("password123");
        driver.setLicenseNumber("LIC12345");
        driver.setPhoneNumber("1234567890");
        driver.setAddress("123 Main St");
        driver.setStatus("Active");

        when(rs.next()).thenReturn(true);
        when(rs.getInt("driver_id")).thenReturn(driver.getDriverId());
        when(rs.getString("name")).thenReturn(driver.getName());
        when(rs.getString("email")).thenReturn(driver.getEmail());
        when(rs.getString("password")).thenReturn(driver.getPassword());
        when(rs.getString("license_number")).thenReturn(driver.getLicenseNumber());
        when(rs.getString("phone_number")).thenReturn(driver.getPhoneNumber());
        when(rs.getString("address")).thenReturn(driver.getAddress());
        when(rs.getString("status")).thenReturn(driver.getStatus());

        Driver retrievedDriver = driverDAO.getDriverById(1);
        assertNotNull(retrievedDriver);
        assertEquals(driver.getDriverId(), retrievedDriver.getDriverId());
        assertEquals(driver.getName(), retrievedDriver.getName());
        assertEquals(driver.getEmail(), retrievedDriver.getEmail());
        assertEquals(driver.getPassword(), retrievedDriver.getPassword());
        assertEquals(driver.getLicenseNumber(), retrievedDriver.getLicenseNumber());
        assertEquals(driver.getPhoneNumber(), retrievedDriver.getPhoneNumber());
        assertEquals(driver.getAddress(), retrievedDriver.getAddress());
        assertEquals(driver.getStatus(), retrievedDriver.getStatus());

        verify(ps, times(1)).setInt(1, 1);
        verify(ps, times(1)).executeQuery();
    }
}