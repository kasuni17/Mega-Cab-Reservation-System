package com.megacabservice.user_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.megacabservice.dao.userDAOImpl;
import com.megacabservice.dao.DriverDAOImpl;
import com.megacabservice.db.DBConn;
import com.megacabservice.entity.user;

import com.megacabservice.entity.Driver;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {           
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            HttpSession session = req.getSession();
            
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                
                user admin = new user();
                admin.setName("Admin");
                admin.setEmail("admin@gmail.com");
            
                session.setAttribute("userobj", admin);
          
                req.getRequestDispatcher("/WEB-INF/view/admin/home.jsp").forward(req, resp);
                return; 
            }
            
            userDAOImpl userDAO = new userDAOImpl(DBConn.getInstance().getConnection());
            user user = userDAO.login(email, password);

            if (user != null) {
                
                session.setAttribute("userobj", user);
                
                resp.sendRedirect("index.jsp");
                return; 
            }
            
            DriverDAOImpl driverDAO = new DriverDAOImpl(DBConn.getInstance().getConnection());
            Driver driver = driverDAO.login(email, password);

            if (driver != null) {
                
                session.setAttribute("driverobj", driver);
               
                req.getRequestDispatcher("/WEB-INF/view/driver/home.jsp").forward(req, resp);
                return; 
            }

            session.setAttribute("failedMsg", "Invalid Email or Password");
            resp.sendRedirect("login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            
            HttpSession session = req.getSession();
            session.setAttribute("failedMsg", "Something went wrong. Please try again.");
            resp.sendRedirect("login.jsp");
        }
    }
}