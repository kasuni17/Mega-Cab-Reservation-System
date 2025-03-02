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
        Cab cab = new Cab();
        cab.setName("Cab1");
        cab.setImage("image1.jpg");
        cab.setDescription("Description1");
        cab.setCapacity("4");
        cab.setUseCase("City Ride");
        cab.setFareRange("10-20");

        when(ps.executeUpdate()).thenReturn(1);

        boolean result = cabDAO.addCab(cab);
        assertTrue(result);

        verify(ps, times(1)).setString(1, cab.getName());
        verify(ps, times(1)).setString(2, cab.getImage());
        verify(ps, times(1)).setString(3, cab.getDescription());
        verify(ps, times(1)).setString(4, cab.getCapacity());
        verify(ps, times(1)).setString(5, cab.getUseCase());
        verify(ps, times(1)).setString(6, cab.getFareRange());
        verify(ps, times(1)).executeUpdate();
    }

    @Test
    void testGetAllCabs() throws Exception {
        when(rs.next()).thenReturn(true, false);
        when(rs.getInt("id")).thenReturn(1);
        when(rs.getString("name")).thenReturn("Cab1");
        when(rs.getString("image")).thenReturn("image1.jpg");
        when(rs.getString("description")).thenReturn("Description1");
        when(rs.getString("capacity")).thenReturn("4");
        when(rs.getString("use_case")).thenReturn("City Ride");
        when(rs.getString("fare_range")).thenReturn("10-20");

        List<Cab> cabs = cabDAO.getAllCabs();
        assertNotNull(cabs);
        assertEquals(1, cabs.size());

        Cab cab = cabs.get(0);
        assertEquals(1, cab.getId());
        assertEquals("Cab1", cab.getName());
        assertEquals("image1.jpg", cab.getImage());
        assertEquals("Description1", cab.getDescription());
        assertEquals("4", cab.getCapacity());
        assertEquals("City Ride", cab.getUseCase());
        assertEquals("10-20", cab.getFareRange());

        verify(ps, times(1)).executeQuery();
    }

    @Test
    void testGetCabById() throws Exception {
        when(rs.next()).thenReturn(true);
        when(rs.getInt("id")).thenReturn(1);
        when(rs.getString("name")).thenReturn("Cab1");
        when(rs.getString("image")).thenReturn("image1.jpg");
        when(rs.getString("description")).thenReturn("Description1");
        when(rs.getString("capacity")).thenReturn("4");
        when(rs.getString("use_case")).thenReturn("City Ride");
        when(rs.getString("fare_range")).thenReturn("10-20");

        Cab cab = cabDAO.getCabById(1);
        assertNotNull(cab);
        assertEquals(1, cab.getId());
        assertEquals("Cab1", cab.getName());
        assertEquals("image1.jpg", cab.getImage());
        assertEquals("Description1", cab.getDescription());
        assertEquals("4", cab.getCapacity());
        assertEquals("City Ride", cab.getUseCase());
        assertEquals("10-20", cab.getFareRange());

        verify(ps, times(1)).setInt(1, 1);
        verify(ps, times(1)).executeQuery();
    }

    @Test
    void testUpdateCab() throws Exception {
        Cab cab = new Cab();
        cab.setId(1);
        cab.setName("Cab1");
        cab.setImage("image1.jpg");
        cab.setDescription("Description1");
        cab.setCapacity("4");
        cab.setUseCase("City Ride");
        cab.setFareRange("10-20");

        when(ps.executeUpdate()).thenReturn(1);

        boolean result = cabDAO.updateCab(cab);
        assertTrue(result);

        verify(ps, times(1)).setString(1, cab.getName());
        verify(ps, times(1)).setString(2, cab.getImage());
        verify(ps, times(1)).setString(3, cab.getDescription());
        verify(ps, times(1)).setString(4, cab.getCapacity());
        verify(ps, times(1)).setString(5, cab.getUseCase());
        verify(ps, times(1)).setString(6, cab.getFareRange());
        verify(ps, times(1)).setInt(7, cab.getId());
        verify(ps, times(1)).executeUpdate();
    }

    @Test
    void testDeleteCab() throws Exception {
        when(ps.executeUpdate()).thenReturn(1);

        boolean result = cabDAO.deleteCab(1);
        assertTrue(result);

        verify(ps, times(1)).setInt(1, 1);
        verify(ps, times(1)).executeUpdate();
    }
}