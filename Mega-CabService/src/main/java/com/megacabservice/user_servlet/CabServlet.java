package com.megacabservice.user_servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacabservice.dao.CabDAO;
import com.megacabservice.entity.Cab;

@WebServlet("/manageCabs")
public class CabServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CabDAO dao = new CabDAO();
        List<Cab> cabs = dao.getAllCabs();
        request.setAttribute("cabs", cabs);
        request.getRequestDispatcher("/WEB-INF/view/admin/manageCabs.jsp").forward(request, response);
    }
}
