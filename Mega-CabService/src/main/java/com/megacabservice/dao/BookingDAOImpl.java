package com.megacabservice.dao;

import com.megacabservice.entity.Booking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BookingDAOImpl implements BookingDAO {
    private Connection conn;

    public BookingDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addBooking(Booking booking) {
        String sql = "INSERT INTO booking (user_name, user_email, user_phone, user_address, pickup_location, drop_location, ride_date, ride_time, passenger_count, luggage_count, special_request, payment_type, card_number, card_expiry, card_cvc, driver_id, cab_id, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, booking.getUser_name());
            stmt.setString(2, booking.getUser_email());
            stmt.setString(3, booking.getUser_phone());
            stmt.setString(4, booking.getUser_address());
            stmt.setString(5, booking.getPickup_location());
            stmt.setString(6, booking.getDrop_location());
            stmt.setDate(7, booking.getRide_date());
            stmt.setTime(8, booking.getRide_time());
            stmt.setInt(9, booking.getPassenger_count());
            stmt.setInt(10, booking.getLuggage_count());
            stmt.setString(11, booking.getSpecial_request());
            stmt.setString(12, booking.getPayment_type());
            stmt.setString(13, booking.getCard_number());
            stmt.setDate(14, booking.getCard_expiry());
            stmt.setString(15, booking.getCard_cvc());
            stmt.setInt(16, booking.getDriver_id());
            stmt.setInt(17, booking.getCab_id());
            stmt.setString(18, booking.getStatus());

            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}