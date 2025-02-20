package com.megacabservice.user_servlet;

import java.io.IOException;
import com.megacabservice.dao.ContactDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.megacabservice.entity.Contact;
import com.megacabservice.db.DBConn;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");
        
        Contact contact = new Contact();
        contact.setName(name);
        contact.setEmail(email);
        contact.setPhone(phone);
        contact.setMessage(message);
        
        try {
            ContactDAO contactDAO = new ContactDAO(DBConn.getConnection()); // Corrected line
            boolean success = contactDAO.saveMessage(contact);
            if(success) {
                response.sendRedirect("contactus.jsp?status=success");
            } else {
                response.sendRedirect("contactus.jsp?status=failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("contactus.jsp?status=error");
        }
    }
}
