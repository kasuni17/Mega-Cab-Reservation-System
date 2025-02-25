package com.megacabservice.user_servlet;

import com.megacabservice.dao.BookingDAO;
import com.megacabservice.dao.BookingDAOImpl;
import com.megacabservice.db.DBConn;
import com.megacabservice.entity.Booking;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Time;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = DBConn.getConnection();
		BookingDAO bookingDAO = new BookingDAOImpl(conn);

		// Debug: Print all parameters
		System.out.println("user_name: " + request.getParameter("user_name"));
		System.out.println("user_email: " + request.getParameter("user_email"));
		System.out.println("user_phone: " + request.getParameter("user_phone"));
		System.out.println("user_address: " + request.getParameter("user_address"));
		System.out.println("pickup_location: " + request.getParameter("pickup_location"));
		System.out.println("drop_location: " + request.getParameter("drop_location"));
		System.out.println("ride_date: " + request.getParameter("ride_date"));
		System.out.println("ride_time: " + request.getParameter("ride_time"));
		System.out.println("passenger_count: " + request.getParameter("passenger_count"));
		System.out.println("luggage_count: " + request.getParameter("luggage_count"));
		System.out.println("special_request: " + request.getParameter("special_request"));
		System.out.println("payment_type: " + request.getParameter("payment_type"));
		System.out.println("card_number: " + request.getParameter("card_number"));
		System.out.println("card_expiry: " + request.getParameter("card_expiry"));
		System.out.println("card_cvc: " + request.getParameter("card_cvc"));
		System.out.println("driver_id: " + request.getParameter("driver_id"));
		System.out.println("cab_id: " + request.getParameter("cab_id"));
		System.out.println("user_id: " + request.getParameter("user_id"));
		try {
			// Validate required fields
			if (request.getParameter("user_name") == null || request.getParameter("user_name").isEmpty()) {
				throw new IllegalArgumentException("User name is required.");
			}
			if (request.getParameter("user_email") == null || request.getParameter("user_email").isEmpty()) {
				throw new IllegalArgumentException("User email is required.");
			}
			if (request.getParameter("user_phone") == null || request.getParameter("user_phone").isEmpty()) {
				throw new IllegalArgumentException("User phone is required.");
			}
			if (request.getParameter("pickup_location") == null || request.getParameter("pickup_location").isEmpty()) {
				throw new IllegalArgumentException("Pickup location is required.");
			}
			if (request.getParameter("drop_location") == null || request.getParameter("drop_location").isEmpty()) {
				throw new IllegalArgumentException("Drop location is required.");
			}
			if (request.getParameter("ride_date") == null || request.getParameter("ride_date").isEmpty()) {
				throw new IllegalArgumentException("Ride date is required.");
			}
			if (request.getParameter("ride_time") == null || request.getParameter("ride_time").isEmpty()) {
				throw new IllegalArgumentException("Ride time is required.");
			}
			if (request.getParameter("passenger_count") == null || request.getParameter("passenger_count").isEmpty()) {
				throw new IllegalArgumentException("Passenger count is required.");
			}
			if (request.getParameter("luggage_count") == null || request.getParameter("luggage_count").isEmpty()) {
				throw new IllegalArgumentException("Luggage count is required.");
			}
			if (request.getParameter("driver_id") == null || request.getParameter("driver_id").isEmpty()) {
				throw new IllegalArgumentException("Driver ID is required.");
			}
			if (request.getParameter("cab_id") == null || request.getParameter("cab_id").isEmpty()) {
				throw new IllegalArgumentException("Cab ID is required.");
			}
			if (request.getParameter("user_id") == null || request.getParameter("user_id").isEmpty()) {
				throw new IllegalArgumentException("User ID is required.");
			}

			// Create Booking object
			Booking booking = new Booking();
			booking.setUser_name(request.getParameter("user_name"));
			booking.setUser_email(request.getParameter("user_email"));
			booking.setUser_phone(request.getParameter("user_phone"));
			booking.setUser_address(request.getParameter("user_address"));
			booking.setPickup_location(request.getParameter("pickup_location"));
			booking.setDrop_location(request.getParameter("drop_location"));
			booking.setRide_date(Date.valueOf(request.getParameter("ride_date"))); // Ensure date format: yyyy-MM-dd
			booking.setRide_time(Time.valueOf(request.getParameter("ride_time") + ":00")); // Ensure time format:
																							// HH:mm:ss
			booking.setPassenger_count(Integer.parseInt(request.getParameter("passenger_count")));
			booking.setLuggage_count(Integer.parseInt(request.getParameter("luggage_count")));
			booking.setSpecial_request(request.getParameter("special_request"));
			booking.setPayment_type(request.getParameter("payment_type"));
			booking.setCard_number(request.getParameter("card_number"));
			booking.setCard_expiry(request.getParameter("card_expiry").isEmpty() ? null
					: Date.valueOf(request.getParameter("card_expiry")));
			booking.setCard_cvc(request.getParameter("card_cvc"));
			booking.setDriver_id(Integer.parseInt(request.getParameter("driver_id")));
			booking.setCab_id(Integer.parseInt(request.getParameter("cab_id")));
			booking.setUser_id(Integer.parseInt(request.getParameter("user_id"))); // Set user_id

			booking.setStatus("assigned");

			// Add booking to the database
			int bookingId = bookingDAO.addBooking(booking); // Modify addBooking to return the generated booking ID
			if (bookingId > 0) {
				response.sendRedirect("confirmation.jsp?booking_id=" + bookingId);
			} else {
				response.sendRedirect("error1.jsp?message=Failed to add booking");
			}
		} catch (Exception e) {
			e.printStackTrace();
			// Pass the exception message to error.jsp
			String errorMessage = e.getMessage() != null ? e.getMessage() : "An unexpected error occurred.";
			response.sendRedirect("error1.jsp?message=" + errorMessage);
		}
	}
}