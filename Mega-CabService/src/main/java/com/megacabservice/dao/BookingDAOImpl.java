package com.megacabservice.dao;

import com.megacabservice.db.DBConn;
import com.megacabservice.entity.Booking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingDAOImpl implements BookingDAO {
	private Connection conn;

	// No-argument constructor
	public BookingDAOImpl() {
		this.conn = DBConn.getConnection(); // Initialize the connection using DBConn
	}

	// Existing constructor (optional, if you still want to pass a connection)
	public BookingDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public int addBooking(Booking booking) {
		String sql = "INSERT INTO bookings (user_name, user_email, user_phone, user_address, pickup_location, drop_location, ride_date, ride_time, passenger_count, luggage_count, special_request, payment_type, card_number, card_expiry, card_cvc, driver_id, cab_id, status, user_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (PreparedStatement stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
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
			stmt.setInt(19, booking.getUser_id());

			int rows = stmt.executeUpdate();
			if (rows > 0) {
				try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
					if (generatedKeys.next()) {
						return generatedKeys.getInt(1); // Return the generated booking ID
					}
				}
			}
			return -1; // Return -1 if no ID was generated
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public List<Booking> getAllBookings() {
		List<Booking> bookings = new ArrayList<>();
		String sql = "SELECT * FROM bookings";

		try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

			while (rs.next()) {
				Booking booking = new Booking();
				booking.setBooking_id(rs.getInt("booking_id"));
				booking.setUser_name(rs.getString("user_name"));
				booking.setUser_email(rs.getString("user_email"));
				booking.setUser_phone(rs.getString("user_phone"));
				booking.setUser_address(rs.getString("user_address"));
				booking.setPickup_location(rs.getString("pickup_location"));
				booking.setDrop_location(rs.getString("drop_location"));
				booking.setRide_date(rs.getDate("ride_date"));
				booking.setRide_time(rs.getTime("ride_time"));
				booking.setPassenger_count(rs.getInt("passenger_count"));
				booking.setLuggage_count(rs.getInt("luggage_count"));
				booking.setSpecial_request(rs.getString("special_request"));
				booking.setPayment_type(rs.getString("payment_type"));
				booking.setCard_number(rs.getString("card_number"));
				booking.setCard_expiry(rs.getDate("card_expiry"));
				booking.setCard_cvc(rs.getString("card_cvc"));
				booking.setDriver_id(rs.getInt("driver_id"));
				booking.setCab_id(rs.getInt("cab_id"));
				booking.setStatus(rs.getString("status"));
				booking.setUser_id(rs.getInt("user_id"));

				bookings.add(booking);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return bookings;
	}

	@Override
	public boolean updateBooking(Booking booking) {
		String sql = "UPDATE bookings SET user_name=?, user_email=?, user_phone=?, user_address=?, pickup_location=?, drop_location=?, ride_date=?, ride_time=?, status=? WHERE booking_id=?";

		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, booking.getUser_name());
			stmt.setString(2, booking.getUser_email());
			stmt.setString(3, booking.getUser_phone());
			stmt.setString(4, booking.getUser_address());
			stmt.setString(5, booking.getPickup_location());
			stmt.setString(6, booking.getDrop_location());
			stmt.setDate(7, booking.getRide_date());
			stmt.setTime(8, booking.getRide_time());
			stmt.setString(9, booking.getStatus());
			stmt.setInt(10, booking.getBooking_id());

			// Debug: Print the SQL query and parameters
			System.out.println("Executing SQL: " + sql);
			System.out.println("Parameters: " + booking.toString());

			int rows = stmt.executeUpdate();
			System.out.println("Rows updated: " + rows); // Debug: Print the number of rows updated

			return rows > 0;
		} catch (SQLException e) {
			e.printStackTrace(); // Print the stack trace for debugging
			System.err.println("SQL State: " + e.getSQLState());
			System.err.println("Error Code: " + e.getErrorCode());
			System.err.println("Message: " + e.getMessage());
			return false;
		}
	}

	@Override
	public boolean deleteBooking(int bookingId) {
		String sql = "DELETE FROM bookings WHERE booking_id=?";

		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, bookingId);

			int rows = stmt.executeUpdate();
			return rows > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Booking getBookingById(int bookingId) {
		String sql = "SELECT * FROM bookings WHERE booking_id=?";
		Booking booking = null;

		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, bookingId);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					booking = new Booking();
					booking.setBooking_id(rs.getInt("booking_id"));
					booking.setUser_name(rs.getString("user_name"));
					booking.setUser_email(rs.getString("user_email"));
					booking.setUser_phone(rs.getString("user_phone"));
					booking.setUser_address(rs.getString("user_address"));
					booking.setPickup_location(rs.getString("pickup_location"));
					booking.setDrop_location(rs.getString("drop_location"));
					booking.setRide_date(rs.getDate("ride_date"));
					booking.setRide_time(rs.getTime("ride_time"));
					booking.setPassenger_count(rs.getInt("passenger_count"));
					booking.setLuggage_count(rs.getInt("luggage_count"));
					booking.setSpecial_request(rs.getString("special_request"));
					booking.setPayment_type(rs.getString("payment_type"));
					booking.setCard_number(rs.getString("card_number"));
					booking.setCard_expiry(rs.getDate("card_expiry"));
					booking.setCard_cvc(rs.getString("card_cvc"));
					booking.setDriver_id(rs.getInt("driver_id"));
					booking.setCab_id(rs.getInt("cab_id"));
					booking.setStatus(rs.getString("status"));
					booking.setUser_id(rs.getInt("user_id"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return booking;
	}
	
	 @Override
	    public List<Booking> getBookingsByUserId(int userId) {
	        List<Booking> userBookings = new ArrayList<>();
	        String sql = "SELECT * FROM bookings WHERE user_id = ?";

	        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	            stmt.setInt(1, userId);
	            try (ResultSet rs = stmt.executeQuery()) {
	                while (rs.next()) {
	                    Booking booking = new Booking();
	                    booking.setBooking_id(rs.getInt("booking_id"));
	                    booking.setUser_name(rs.getString("user_name"));
	                    booking.setPickup_location(rs.getString("pickup_location"));
	                    booking.setDrop_location(rs.getString("drop_location"));
	                    booking.setRide_date(rs.getDate("ride_date"));
	                    booking.setRide_time(rs.getTime("ride_time"));
	                    booking.setStatus(rs.getString("status"));
	                    userBookings.add(booking);
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        System.out.println("Number of bookings found: " + userBookings.size());
	        return userBookings;
	    }
}