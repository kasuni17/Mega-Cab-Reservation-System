package com.megacabservice.user_servlet;

import com.megacabservice.dao.CabDAOImpl;
import com.megacabservice.entity.Cab;
import com.megacabservice.db.DBConn;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

public class CabListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = DBConn.getConnection();
            CabDAOImpl cabDAO = new CabDAOImpl(conn);
            List<Cab> cabList = cabDAO.getAllCabs();

            request.setAttribute("cabList", cabList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("fleet.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}