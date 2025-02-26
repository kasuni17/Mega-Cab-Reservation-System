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

@WebServlet("/admin/viewBookings")
public class ViewBookingsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch all bookings from the database
        BookingDAOImpl bookingDAO = new BookingDAOImpl();
        List<Booking> bookings = bookingDAO.getAllBookings();

        // Set the bookings as a request attribute
        request.setAttribute("bookings", bookings);

        // Forward the request to the JSP page
        request.getRequestDispatcher("/WEB-INF/view/admin/viewBookings.jsp").forward(request, response);
    }
}