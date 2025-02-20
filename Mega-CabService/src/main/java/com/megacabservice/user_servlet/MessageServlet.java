package com.megacabservice.user_servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.megacabservice.dao.ContactDAO;
import com.megacabservice.entity.Contact;
import com.megacabservice.db.DBConn;

@WebServlet("/messages")
public class MessageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Fetch all messages from the database
        	 ContactDAO contactDAO = new ContactDAO(DBConn.getConnection());
            List<Contact> messages = contactDAO.getAllMessages();

            // Set the messages as a request attribute
            request.setAttribute("messages", messages);

            // Forward the request to the JSP page for rendering
      
            request.getRequestDispatcher("/WEB-INF/view/admin/messages.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Handle errors (e.g., display an error page)
            response.sendRedirect("error.jsp");
        }
    }
}