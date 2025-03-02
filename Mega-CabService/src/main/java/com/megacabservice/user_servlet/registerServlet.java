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

@WebServlet("/register")
public class registerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phone_number = req.getParameter("phone_number");
            String nic = req.getParameter("nic");
            String password = req.getParameter("password");
            String address = req.getParameter("address");

            
            if (name == null || email == null || phone_number == null || nic == null || password == null || address == null || 
                name.isEmpty() || email.isEmpty() || phone_number.isEmpty() || nic.isEmpty() || password.isEmpty() || address.isEmpty()) {
                req.setAttribute("error", "All fields are required.");
                req.getRequestDispatcher("register.jsp").forward(req, resp);
                return;
            }

            
            user us = new user();
            us.setName(name);
            us.setEmail(email);
            us.setPhoneNumber(phone_number);
            us.setNic(nic);
            us.setPassword(password);
            us.setAddress(address);
            
            

            
            userDAOImpl dao = new userDAOImpl(DBConn.getInstance().getConnection());
            boolean f = dao.userRegister(us);

            if (f) {
                
                HttpSession session = req.getSession();
                session.setAttribute("message", "Registration successful. Please login.");
                resp.sendRedirect("login.jsp"); 
            } else {
                
                req.setAttribute("error", "Email is already registered.");
                req.getRequestDispatcher("register.jsp").forward(req, resp); 
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Something went wrong. Please try again later.");
            req.getRequestDispatcher("register.jsp").forward(req, resp); 
        }
    }
}
