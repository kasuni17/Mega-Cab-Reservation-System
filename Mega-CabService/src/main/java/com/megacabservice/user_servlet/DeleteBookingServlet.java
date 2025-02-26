package com.megacabservice.user_servlet;



import com.megacabservice.dao.BookingDAOImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/deleteBooking")
public class DeleteBookingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("id"));
        BookingDAOImpl bookingDAO = new BookingDAOImpl();
        boolean isDeleted = bookingDAO.deleteBooking(bookingId);

        if (isDeleted) {
            response.sendRedirect(request.getContextPath() + "/admin/viewBookings");
        } else {
            response.getWriter().println("Failed to delete booking.");
        }
    }
}