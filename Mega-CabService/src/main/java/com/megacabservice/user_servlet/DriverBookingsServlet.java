package com.megacabservice.user_servlet;

import com.megacabservice.dao.BookingDAOImpl;
import com.megacabservice.entity.Booking;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DriverBookingsServlet")
public class DriverBookingsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the driver_id from the request
        int driverId = Integer.parseInt(request.getParameter("driver_id"));

        // Fetch bookings for the driver
        BookingDAOImpl bookingDAO = new BookingDAOImpl();
        List<Booking> driverBookings = bookingDAO.getBookingsByDriverId(driverId);

        // Debug: Print the number of bookings fetched
        System.out.println("Number of bookings fetched: " + driverBookings.size());

        // Set the bookings in the request attribute
        request.setAttribute("driverBookings", driverBookings);

        // Forward to the JSP page to display the bookings
        request.getRequestDispatcher("/WEB-INF/view/driver/driverBookings.jsp").forward(request, response);
    }
}