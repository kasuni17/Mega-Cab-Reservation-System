package com.megacabservice.user_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.megacabservice.dao.userDAOImpl;
import com.megacabservice.db.DBConn;
import com.megacabservice.entity.user;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            userDAOImpl dao = new userDAOImpl(DBConn.getInstance().getConnection());
            HttpSession session = req.getSession();

            String email = req.getParameter("email");
            String password = req.getParameter("password");

            // Hardcoded Admin Check (for testing purposes)
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                user us = new user();
                session.setAttribute("userobj", us);
                
                // Forward to the correct path for admin home page
                req.getRequestDispatcher("/WEB-INF/view/admin/home.jsp").forward(req, resp);
            } else {
                // Check user in the database
                user us = dao.login(email, password);
                if (us != null) {
                    session.setAttribute("userobj", us);
                    resp.sendRedirect("home.jsp");  // Redirect to user home page
                } else {
                    session.setAttribute("failedMsg", "Email & Password Invalid");
                    resp.sendRedirect("login.jsp");  // Redirect back to login page
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
