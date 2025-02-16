package com.megacabservice.user_servlet;

import com.megacabservice.dao.CabDAO;
import com.megacabservice.dao.CabDAOImpl;
import com.megacabservice.db.DBConn;
import com.megacabservice.entity.Cab;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewCabs")
public class ViewCabsServlet extends HttpServlet {
    private CabDAO cabDAO = new CabDAOImpl(DBConn.getConnection());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cab> cabs = cabDAO.getAllCabs();
        request.setAttribute("cabs", cabs);
        request.getRequestDispatcher("/WEB-INF/view/admin/viewCabs.jsp").forward(request, response);
    }
}