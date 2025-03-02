package com.megacabservice.user_servlet;

import com.megacabservice.dao.BookingDAO;
import com.megacabservice.dao.BookingDAOImpl;
import com.megacabservice.entity.Booking;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user-bookings")
public class UserBookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

       
        System.out.println("User ID from session: " + userId);

        if (userId == null) {
            
            response.sendRedirect("login.jsp");
            return;
        }

       
        BookingDAO bookingDAO = new BookingDAOImpl();
        List<Booking> userBookings = bookingDAO.getBookingsByUserId(userId);

       
        System.out.println("Number of bookings found: " + userBookings.size());

        
        for (Booking booking : userBookings) {
            System.out.println("Booking ID: " + booking.getBooking_id() + ", User Name: " + booking.getUser_name());
        }

        
        request.setAttribute("userBookings", userBookings);

        
        RequestDispatcher dispatcher = request.getRequestDispatcher("userBookings.jsp");
        dispatcher.forward(request, response);
    }
}