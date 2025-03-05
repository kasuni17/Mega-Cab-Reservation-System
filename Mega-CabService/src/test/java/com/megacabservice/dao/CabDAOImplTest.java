package com.megacabservice.dao;

import com.megacabservice.entity.Cab;
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

class CabDAOImplTest {

    @Mock
    private Connection conn;

    @Mock
    private PreparedStatement ps;

    @Mock
    private ResultSet rs;

    private CabDAOImpl cabDAO;

    @BeforeEach
    void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        cabDAO = new CabDAOImpl(conn);

        when(conn.prepareStatement(anyString())).thenReturn(ps);
        when(ps.executeQuery()).thenReturn(rs);
    }

    @Test
    void testAddCab() throws Exception {
        System.out.println("Running testAddCab...");

        // Arrange
        Cab cab = new Cab();
        cab.setName("Cab1");
        cab.setImage("image1.jpg");
        cab.setDescription("Description1");
        cab.setCapacity("4");
        cab.setUseCase("City Ride");
        cab.setFareRange("10-20");

        when(ps.executeUpdate()).thenReturn(1);

        // Act
        boolean result = cabDAO.addCab(cab);

        // Assert
        assertTrue(result);
        System.out.println("Cab added successfully. Cab Name: " + cab.getName());
    }

    @Test
    void testGetAllCabs() throws Exception {
        System.out.println("Running testGetAllCabs...");

        // Arrange
        when(rs.next()).thenReturn(true, false);
        when(rs.getInt("id")).thenReturn(1);
        when(rs.getString("name")).thenReturn("Cab1");
        when(rs.getString("image")).thenReturn("image1.jpg");
        when(rs.getString("description")).thenReturn("Description1");
        when(rs.getString("capacity")).thenReturn("4");
        when(rs.getString("use_case")).thenReturn("City Ride");
        when(rs.getString("fare_range")).thenReturn("10-20");

        // Act
        List<Cab> cabs = cabDAO.getAllCabs();

        // Assert
        assertNotNull(cabs);
        assertEquals(1, cabs.size());
        System.out.println("Retrieved all cabs successfully. Total cabs: " + cabs.size());

        Cab cab = cabs.get(0);
        assertEquals(1, cab.getId());
        assertEquals("Cab1", cab.getName());
        assertEquals("image1.jpg", cab.getImage());
        assertEquals("Description1", cab.getDescription());
        assertEquals("4", cab.getCapacity());
        assertEquals("City Ride", cab.getUseCase());
        assertEquals("10-20", cab.getFareRange());

        System.out.println("Cab details: " + cab);
    }

    @Test
    void testGetCabById() throws Exception {
        System.out.println("Running testGetCabById...");

        // Arrange
        when(rs.next()).thenReturn(true);
        when(rs.getInt("id")).thenReturn(1);
        when(rs.getString("name")).thenReturn("Cab1");
        when(rs.getString("image")).thenReturn("image1.jpg");
        when(rs.getString("description")).thenReturn("Description1");
        when(rs.getString("capacity")).thenReturn("4");
        when(rs.getString("use_case")).thenReturn("City Ride");
        when(rs.getString("fare_range")).thenReturn("10-20");

        // Act
        Cab cab = cabDAO.getCabById(1);

        // Assert
        assertNotNull(cab);
        assertEquals(1, cab.getId());
        assertEquals("Cab1", cab.getName());
        assertEquals("image1.jpg", cab.getImage());
        assertEquals("Description1", cab.getDescription());
        assertEquals("4", cab.getCapacity());
        assertEquals("City Ride", cab.getUseCase());
        assertEquals("10-20", cab.getFareRange());

        System.out.println("Retrieved cab by ID successfully. Cab ID: " + cab.getId());
        System.out.println("Cab details: " + cab);
    }

    @Test
    void testUpdateCab() throws Exception {
        System.out.println("Running testUpdateCab...");

        // Arrange
        Cab cab = new Cab();
        cab.setId(1);
        cab.setName("Cab1");
        cab.setImage("image1.jpg");
        cab.setDescription("Description1");
        cab.setCapacity("4");
        cab.setUseCase("City Ride");
        cab.setFareRange("10-20");

        when(ps.executeUpdate()).thenReturn(1);

        // Act
        boolean result = cabDAO.updateCab(cab);

        // Assert
        assertTrue(result);
        System.out.println("Cab updated successfully. Cab ID: " + cab.getId());
    }

    @Test
    void testDeleteCab() throws Exception {
        System.out.println("Running testDeleteCab...");

        // Arrange
        when(ps.executeUpdate()).thenReturn(1);

        // Act
        boolean result = cabDAO.deleteCab(1);

        // Assert
        assertTrue(result);
        System.out.println("Cab deleted successfully. Cab ID: 1");
    }
}