package com.megacabservice.user_servlet;

import java.io.IOException;
import com.megacabservice.dao.ContactDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.megacabservice.db.DBConn;
import util.EmailSender;

@WebServlet("/ReplyMessageServlet")
public class ReplyMessageServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    int messageId = Integer.parseInt(request.getParameter("messageId"));
	    String reply = request.getParameter("reply");
	    String email = request.getParameter("email");
	    
	    try {
	        ContactDAO contactDAO = new ContactDAO(DBConn.getConnection());
	        boolean updated = contactDAO.updateReply(messageId, reply);
	        
	        if (updated) {
	            // Send email to user
	            String subject = "Reply from Colombo Mega Cabs";
	            String content = "Dear Customer,\n\n"
	                    + "Thank you for contacting us. Here is our response:\n\n"
	                    + reply + "\n\nBest Regards,\nColombo Mega Cabs Team";
	            
	            EmailSender.sendEmail(email, subject, content);
	            request.setAttribute("status", "success");
	        } else {
	            request.setAttribute("status", "failed");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("status", "error");
	    }

	    // Forward the request to the JSP page
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/admin/messages.jsp");
	    dispatcher.forward(request, response);
	}
}