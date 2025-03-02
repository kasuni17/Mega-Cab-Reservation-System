package com.megacabservice.user_servlet;

import com.megacabservice.dao.CabDAO;
import com.megacabservice.dao.CabDAOImpl;
import com.megacabservice.db.DBConn;
import com.megacabservice.entity.Cab;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet("/AddCabServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 
                 maxFileSize = 1024 * 1024 * 10,      
                 maxRequestSize = 1024 * 1024 * 50)  
public class AddCabServlet extends HttpServlet {
    private CabDAO cabDAO = new CabDAOImpl(DBConn.getConnection());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.getRequestDispatcher("/WEB-INF/view/admin/addCab.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String capacity = request.getParameter("capacity");
        String useCase = request.getParameter("use_case");
        String fareRange = request.getParameter("fare_range");

        
        Part filePart = request.getPart("image"); 
        String fileName = getFileName(filePart);

        
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir(); 
        }

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);
        
        String imagePath = "uploads" + File.separator + fileName;

        
        Cab cab = new Cab(0, name, imagePath, description, capacity, useCase, fareRange);

        
        boolean f = cabDAO.addCab(cab);

        if (f) {
            response.sendRedirect("viewCabs"); 
        } else {
            request.setAttribute("errorMessage", "Failed to add cab. Please try again.");
            request.getRequestDispatcher("/WEB-INF/view/admin/addCab.jsp").forward(request, response); 
        }
    }

    
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String token : contentDisposition.split(";")) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}