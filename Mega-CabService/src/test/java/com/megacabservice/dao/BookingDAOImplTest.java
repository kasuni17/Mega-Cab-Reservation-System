package com.megacabservice.dao;

import com.megacabservice.entity.Booking;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

public class BookingDAOImplTest {

    @Mock
    private Connection conn;

    @Mock
    private PreparedStatement stmt;

    @Mock
    private ResultSet rs;

    private BookingDAOImpl bookingDAO;

    @BeforeEach
    public void setUp() throws SQLException {
        MockitoAnnotations.openMocks(this);
        bookingDAO = new BookingDAOImpl(conn);

        // Mock the database connection and prepared statement
        when(conn.prepareStatement(anyString(), eq(PreparedStatement.RETURN_GENERATED_KEYS))).thenReturn(stmt);
        when(conn.prepareStatement(anyString())).thenReturn(stmt);
        when(stmt.executeUpdate()).thenReturn(1);
        when(stmt.getGeneratedKeys()).thenReturn(rs);
        when(rs.next()).thenReturn(true);
        when(rs.getInt(1)).thenReturn(1);
    }

    @Test
    public void testAddBooking() throws SQLException {
        System.out.println("Running testAddBooking...");

        // Arrange
        Booking booking = new Booking();
        booking.setUser_name("John Doe");
        booking.setUser_email("john.doe@example.com");
        booking.setUser_phone("1234567890");
        booking.setUser_address("123 Main St");
        booking.setPickup_location("Airport");
        booking.setDrop_location("Hotel");
        booking.setRide_date(new java.sql.Date(System.currentTimeMillis()));
        booking.setRide_time(new java.sql.Time(System.currentTimeMillis()));
        booking.setPassenger_count(2);
        booking.setLuggage_count(1);
        booking.setSpecial_request("None");
        booking.setPayment_type("Credit Card");
        booking.setCard_number("1234567812345678");
        booking.setCard_expiry(new java.sql.Date(System.currentTimeMillis()));
        booking.setCard_cvc("123");
        booking.setDriver_id(1);
        booking.setCab_id(1);
        booking.setStatus("Pending");
        booking.setUser_id(1);

        // Act
        int bookingId = bookingDAO.addBooking(booking);

        // Assert
        assertEquals(1, bookingId);
        System.out.println("Booking added successfully. Booking ID: " + bookingId);
    }

    @Test
    public void testGetAllBookings() throws SQLException {
        System.out.println("Running testGetAllBookings...");

        // Arrange
        when(stmt.executeQuery()).thenReturn(rs);
        when(rs.next()).thenReturn(true, false);
        when(rs.getInt("booking_id")).thenReturn(1);
        when(rs.getString("user_name")).thenReturn("John Doe");
        when(rs.getString("user_email")).thenReturn("john.doe@example.com");
        when(rs.getString("user_phone")).thenReturn("1234567890");
        when(rs.getString("user_address")).thenReturn("123 Main St");
        when(rs.getString("pickup_location")).thenReturn("Airport");
        when(rs.getString("drop_location")).thenReturn("Hotel");
        when(rs.getDate("ride_date")).thenReturn(new java.sql.Date(System.currentTimeMillis()));
        when(rs.getTime("ride_time")).thenReturn(new java.sql.Time(System.currentTimeMillis()));
        when(rs.getInt("passenger_count")).thenReturn(2);
        when(rs.getInt("luggage_count")).thenReturn(1);
        when(rs.getString("special_request")).thenReturn("None");
        when(rs.getString("payment_type")).thenReturn("Credit Card");
        when(rs.getString("card_number")).thenReturn("1234567812345678");
        when(rs.getDate("card_expiry")).thenReturn(new java.sql.Date(System.currentTimeMillis()));
        when(rs.getString("card_cvc")).thenReturn("123");
        when(rs.getInt("driver_id")).thenReturn(1);
        when(rs.getInt("cab_id")).thenReturn(1);
        when(rs.getString("status")).thenReturn("Pending");
        when(rs.getInt("user_id")).thenReturn(1);

        // Act
        List<Booking> bookings = bookingDAO.getAllBookings();

        // Assert
        assertNotNull(bookings);
        assertEquals(1, bookings.size());
        System.out.println("Retrieved all bookings successfully. Total bookings: " + bookings.size());
    }

    @Test
    public void testUpdateBooking() throws SQLException {
        System.out.println("Running testUpdateBooking...");

        // Arrange
        Booking booking = new Booking();
        booking.setBooking_id(1);
        booking.setUser_name("John Doe");
        booking.setUser_email("john.doe@example.com");
        booking.setUser_phone("1234567890");
        booking.setUser_address("123 Main St");
        booking.setPickup_location("Airport");
        booking.setDrop_location("Hotel");
        booking.setRide_date(new java.sql.Date(System.currentTimeMillis()));
        booking.setRide_time(new java.sql.Time(System.currentTimeMillis()));
        booking.setStatus("Confirmed");

        // Act
        boolean result = bookingDAO.updateBooking(booking);

        // Assert
        assertTrue(result);
        System.out.println("Booking updated successfully.");
    }

    @Test
    public void testDeleteBooking() throws SQLException {
        System.out.println("Running testDeleteBooking...");

        // Act
        boolean result = bookingDAO.deleteBooking(1);

        // Assert
        assertTrue(result);
        System.out.println("Booking deleted successfully.");
    }

    @Test
    public void testGetBookingById() throws SQLException {
        System.out.println("Running testGetBookingById...");

        // Arrange
        when(stmt.executeQuery()).thenReturn(rs);
        when(rs.next()).thenReturn(true);
        when(rs.getInt("booking_id")).thenReturn(1);
        when(rs.getString("user_name")).thenReturn("John Doe");
        when(rs.getString("user_email")).thenReturn("john.doe@example.com");
        when(rs.getString("user_phone")).thenReturn("1234567890");
        when(rs.getString("user_address")).thenReturn("123 Main St");
        when(rs.getString("pickup_location")).thenReturn("Airport");
        when(rs.getString("drop_location")).thenReturn("Hotel");
        when(rs.getDate("ride_date")).thenReturn(new java.sql.Date(System.currentTimeMillis()));
        when(rs.getTime("ride_time")).thenReturn(new java.sql.Time(System.currentTimeMillis()));
        when(rs.getInt("passenger_count")).thenReturn(2);
        when(rs.getInt("luggage_count")).thenReturn(1);
        when(rs.getString("special_request")).thenReturn("None");
        when(rs.getString("payment_type")).thenReturn("Credit Card");
        when(rs.getString("card_number")).thenReturn("1234567812345678");
        when(rs.getDate("card_expiry")).thenReturn(new java.sql.Date(System.currentTimeMillis()));
        when(rs.getString("card_cvc")).thenReturn("123");
        when(rs.getInt("driver_id")).thenReturn(1);
        when(rs.getInt("cab_id")).thenReturn(1);
        when(rs.getString("status")).thenReturn("Pending");
        when(rs.getInt("user_id")).thenReturn(1);

        // Act
        Booking booking = bookingDAO.getBookingById(1);

        // Assert
        assertNotNull(booking);
        assertEquals(1, booking.getBooking_id());
        System.out.println("Retrieved booking by ID successfully. Booking ID: " + booking.getBooking_id());
    }

    @Test
    public void testGetBookingsByUserId() throws SQLException {
        System.out.println("Running testGetBookingsByUserId...");

        // Arrange
        when(stmt.executeQuery()).thenReturn(rs);
        when(rs.next()).thenReturn(true, false);
        when(rs.getInt("booking_id")).thenReturn(1);
        when(rs.getString("user_name")).thenReturn("John Doe");
        when(rs.getString("pickup_location")).thenReturn("Airport");
        when(rs.getString("drop_location")).thenReturn("Hotel");
        when(rs.getDate("ride_date")).thenReturn(new java.sql.Date(System.currentTimeMillis()));
        when(rs.getTime("ride_time")).thenReturn(new java.sql.Time(System.currentTimeMillis()));
        when(rs.getString("status")).thenReturn("Pending");

        // Act
        List<Booking> bookings = bookingDAO.getBookingsByUserId(1);

        // Assert
        assertNotNull(bookings);
        assertEquals(1, bookings.size());
        System.out.println("Retrieved bookings by user ID successfully. Total bookings: " + bookings.size());
    }

    @Test
    public void testGetBookingsByDriverId() throws SQLException {
        System.out.println("Running testGetBookingsByDriverId...");

        // Arrange
        when(stmt.executeQuery()).thenReturn(rs);
        when(rs.next()).thenReturn(true, false);
        when(rs.getInt("booking_id")).thenReturn(1);
        when(rs.getString("user_name")).thenReturn("John Doe");
        when(rs.getString("pickup_location")).thenReturn("Airport");
        when(rs.getString("drop_location")).thenReturn("Hotel");
        when(rs.getDate("ride_date")).thenReturn(new java.sql.Date(System.currentTimeMillis()));
        when(rs.getTime("ride_time")).thenReturn(new java.sql.Time(System.currentTimeMillis()));
        when(rs.getString("status")).thenReturn("Pending");

        // Act
        List<Booking> bookings = bookingDAO.getBookingsByDriverId(1);

        // Assert
        assertNotNull(bookings);
        assertEquals(1, bookings.size());
        System.out.println("Retrieved bookings by driver ID successfully. Total bookings: " + bookings.size());
    }
}