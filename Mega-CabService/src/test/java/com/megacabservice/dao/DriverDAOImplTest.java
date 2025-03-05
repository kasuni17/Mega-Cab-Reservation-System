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
        System.out.println("Running testAddDriver...");

        // Arrange
        Driver driver = new Driver();
        driver.setName("John Doe");
        driver.setEmail("john.doe@example.com");
        driver.setPassword("password123");
        driver.setLicenseNumber("LIC12345");
        driver.setPhoneNumber("1234567890");
        driver.setAddress("123 Main St");

        when(ps.executeUpdate()).thenReturn(1);

        // Act
        boolean result = driverDAO.addDriver(driver);

        // Assert
        assertTrue(result);
        System.out.println("Driver added successfully. Driver Name: " + driver.getName());
    }

    @Test
    void testLogin() throws Exception {
        System.out.println("Running testLogin...");

        // Arrange
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

        // Act
        Driver loggedInDriver = driverDAO.login("john.doe@example.com", "password123");

        // Assert
        assertNotNull(loggedInDriver);
        assertEquals(driver.getDriverId(), loggedInDriver.getDriverId());
        assertEquals(driver.getName(), loggedInDriver.getName());
        assertEquals(driver.getEmail(), loggedInDriver.getEmail());
        assertEquals(driver.getLicenseNumber(), loggedInDriver.getLicenseNumber());
        assertEquals(driver.getPhoneNumber(), loggedInDriver.getPhoneNumber());
        assertEquals(driver.getAddress(), loggedInDriver.getAddress());
        assertEquals(driver.getStatus(), loggedInDriver.getStatus());

        System.out.println("Driver login successful. Driver ID: " + loggedInDriver.getDriverId());
        System.out.println("Driver details: " + loggedInDriver);
    }

    @Test
    void testGetAllDrivers() throws Exception {
        System.out.println("Running testGetAllDrivers...");

        // Arrange
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

        // Act
        List<Driver> drivers = driverDAO.getAllDrivers();

        // Assert
        assertNotNull(drivers);
        assertEquals(1, drivers.size());
        System.out.println("Retrieved all drivers successfully. Total drivers: " + drivers.size());

        Driver retrievedDriver = drivers.get(0);
        assertEquals(driver.getDriverId(), retrievedDriver.getDriverId());
        assertEquals(driver.getName(), retrievedDriver.getName());
        assertEquals(driver.getEmail(), retrievedDriver.getEmail());
        assertEquals(driver.getLicenseNumber(), retrievedDriver.getLicenseNumber());
        assertEquals(driver.getPhoneNumber(), retrievedDriver.getPhoneNumber());
        assertEquals(driver.getAddress(), retrievedDriver.getAddress());
        assertEquals(driver.getStatus(), retrievedDriver.getStatus());

        System.out.println("Driver details: " + retrievedDriver);
    }

    @Test
    void testUpdateDriver() throws Exception {
        System.out.println("Running testUpdateDriver...");

        // Arrange
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

        // Act
        boolean result = driverDAO.updateDriver(driver);

        // Assert
        assertTrue(result);
        System.out.println("Driver updated successfully. Driver ID: " + driver.getDriverId());
    }

    @Test
    void testDeleteDriver() throws Exception {
        System.out.println("Running testDeleteDriver...");

        // Arrange
        when(ps.executeUpdate()).thenReturn(1);

        // Act
        boolean result = driverDAO.deleteDriver(1);

        // Assert
        assertTrue(result);
        System.out.println("Driver deleted successfully. Driver ID: 1");
    }

    @Test
    void testGetDriverById() throws Exception {
        System.out.println("Running testGetDriverById...");

        // Arrange
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

        // Act
        Driver retrievedDriver = driverDAO.getDriverById(1);

        // Assert
        assertNotNull(retrievedDriver);
        assertEquals(driver.getDriverId(), retrievedDriver.getDriverId());
        assertEquals(driver.getName(), retrievedDriver.getName());
        assertEquals(driver.getEmail(), retrievedDriver.getEmail());
        assertEquals(driver.getPassword(), retrievedDriver.getPassword());
        assertEquals(driver.getLicenseNumber(), retrievedDriver.getLicenseNumber());
        assertEquals(driver.getPhoneNumber(), retrievedDriver.getPhoneNumber());
        assertEquals(driver.getAddress(), retrievedDriver.getAddress());
        assertEquals(driver.getStatus(), retrievedDriver.getStatus());

        System.out.println("Retrieved driver by ID successfully. Driver ID: " + retrievedDriver.getDriverId());
        System.out.println("Driver details: " + retrievedDriver);
    }
}