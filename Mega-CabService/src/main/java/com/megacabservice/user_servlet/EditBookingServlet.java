package com.megacabservice.user_servlet;

import com.megacabservice.dao.BookingDAOImpl;
import com.megacabservice.entity.Booking;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/editBooking")
public class EditBookingServlet extends HttpServlet {

    // Handle GET request (display the edit form)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int bookingId = Integer.parseInt(request.getParameter("id"));

            // Fetch the booking details from the database
            BookingDAOImpl bookingDAO = new BookingDAOImpl();
            Booking booking = bookingDAO.getBookingById(bookingId);

            if (booking != null) {
                // Set the booking as a request attribute
                request.setAttribute("booking", booking);

                // Forward to the editBooking.jsp page
                request.getRequestDispatcher("/WEB-INF/view/admin/editBooking.jsp").forward(request, response);
            } else {
                // Booking not found, handle the error or redirect
                response.sendRedirect(request.getContextPath() + "/admin/viewBookings");
            }

        } catch (NumberFormatException e) {
            // Handle invalid ID format or missing parameter
            response.getWriter().println("Invalid booking ID.");
        } catch (Exception e) {
            // Handle other unexpected errors
            e.printStackTrace();
            response.getWriter().println("Error occurred while fetching booking details.");
        }
    }

    // Handle POST request (process the form submission)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int bookingId = Integer.parseInt(request.getParameter("booking_id"));
            String user_name = request.getParameter("user_name");
            String user_email = request.getParameter("user_email");
            String user_phone = request.getParameter("user_phone");
            String user_address = request.getParameter("user_address");
            String pickup_location = request.getParameter("pickup_location");
            String drop_location = request.getParameter("drop_location");
            String rideDateStr = request.getParameter("ride_date");
            String rideTimeStr = request.getParameter("ride_time");
            String status = request.getParameter("status");

            // Validate required fields
            if (user_name == null || user_name.isEmpty() || user_email == null || user_email.isEmpty() ||
                user_phone == null || user_phone.isEmpty() || user_address == null || user_address.isEmpty() ||
                pickup_location == null || pickup_location.isEmpty() || drop_location == null || drop_location.isEmpty() ||
                rideDateStr == null || rideDateStr.isEmpty() || rideTimeStr == null || rideTimeStr.isEmpty() ||
                status == null || status.isEmpty()) {
                response.getWriter().println("All fields are required.");
                return;
            }

            // Parse ride_date and ride_time
            Date ride_date = Date.valueOf(rideDateStr);
            Time ride_time = Time.valueOf(rideTimeStr + ":00"); // Ensure the time is in HH:mm:ss format

            // Create a Booking object with updated details
            Booking booking = new Booking();
            booking.setBooking_id(bookingId);
            booking.setUser_name(user_name);
            booking.setUser_email(user_email);
            booking.setUser_phone(user_phone);
            booking.setUser_address(user_address);
            booking.setPickup_location(pickup_location);
            booking.setDrop_location(drop_location);
            booking.setRide_date(ride_date);
            booking.setRide_time(ride_time);
            booking.setStatus(status);

            // Debug: Print the Booking object
            System.out.println("Updating booking: " + booking.toString());

            // Update the booking in the database
            BookingDAOImpl bookingDAO = new BookingDAOImpl();
            boolean isUpdated = bookingDAO.updateBooking(booking);

            if (isUpdated) {
                // Redirect to the view bookings page after successful update
                response.sendRedirect(request.getContextPath() + "/admin/viewBookings");
            } else {
                response.getWriter().println("Failed to update booking.");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().println("Invalid input data.");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error occurred while updating the booking.");
        }
    }
}