package com.megacabservice.user_servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.megacabservice.dao.CabDAO;

@WebServlet("/deleteCab")
public class DeleteCabServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CabDAO dao = new CabDAO();
        dao.deleteCab(id);
        response.sendRedirect("manageCabs");
    }
}
