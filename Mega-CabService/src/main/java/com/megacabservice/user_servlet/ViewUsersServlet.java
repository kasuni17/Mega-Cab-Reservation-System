package com.megacabservice.user_servlet;

import com.megacabservice.dao.userDAO;
import com.megacabservice.dao.userDAOImpl;
import com.megacabservice.db.DBConn;
import com.megacabservice.entity.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewUsers")
public class ViewUsersServlet extends HttpServlet {
    private userDAO userDAO = new userDAOImpl(DBConn.getConnection());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        List<user> users = userDAO.getAllUsers();

       
        System.out.println("Users fetched: " + users.size());
        users.forEach(System.out::println);

        
        request.setAttribute("users", users);
        request.getRequestDispatcher("/WEB-INF/view/admin/viewUsers.jsp").forward(request, response);
    }
}