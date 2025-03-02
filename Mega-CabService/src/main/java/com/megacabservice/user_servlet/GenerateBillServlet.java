package com.megacabservice.user_servlet;

import com.megacabservice.dao.BookingDAO;
import com.megacabservice.dao.BookingDAOImpl;
import com.megacabservice.entity.Booking;
import util.BillCalculator;
import util.EmailSender;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/generateBill")
public class GenerateBillServlet extends HttpServlet {
    private BookingDAO bookingDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        bookingDAO = new BookingDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        int bookingId = Integer.parseInt(req.getParameter("bookingId"));
        Booking booking = bookingDAO.getBookingById(bookingId);

        if (booking != null) {
            
            double totalBill = BillCalculator.calculateTotalBill(booking.getPassenger_count(), booking.getLuggage_count());

            
            String emailSubject = "Your Ride Bill";
            String emailBody = "Dear " + booking.getUser_name() + ",\n\n"
                    + "Here is your ride bill summary:\n"
                    + "Pickup Location: " + booking.getPickup_location() + "\n"
                    + "Drop Location: " + booking.getDrop_location() + "\n"
                    + "Ride Date: " + booking.getRide_date() + "\n"
                    + "Ride Time: " + booking.getRide_time() + "\n"
                    + "Passenger Count: " + booking.getPassenger_count() + "\n"
                    + "Luggage Count: " + booking.getLuggage_count() + "\n"
                    + "Total Bill: $" + totalBill + "\n\n"
                    + "Thank you for choosing our service!\n";

           
            EmailSender.sendEmail(booking.getUser_email(), emailSubject, emailBody);

           
            resp.getWriter().write("Bill generated and email sent successfully!");
        } else {
            resp.getWriter().write("Booking not found!");
        }
    }
}