package com.megacabservice.dao;

import com.megacabservice.entity.Booking;
import java.util.List;

public interface BookingDAO {
	int addBooking(Booking booking);
    List<Booking> getAllBookings();
    boolean updateBooking(Booking booking);
    boolean deleteBooking(int bookingId);
    Booking getBookingById(int bookingId);
}