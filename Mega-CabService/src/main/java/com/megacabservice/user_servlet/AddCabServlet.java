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
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)  // 50MB
public class AddCabServlet extends HttpServlet {
    private CabDAO cabDAO = new CabDAOImpl(DBConn.getConnection());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the addCab.jsp page to display the form
        request.getRequestDispatcher("/WEB-INF/view/admin/addCab.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle form submission
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String capacity = request.getParameter("capacity");
        String useCase = request.getParameter("use_case");
        String fareRange = request.getParameter("fare_range");

        // Handle file upload
        Part filePart = request.getPart("image"); // Retrieve the uploaded file
        String fileName = getFileName(filePart);

        // Save the file to the server
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir(); // Create the upload directory if it doesn't exist
        }

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        // Save the relative path to the database
        String imagePath = "uploads" + File.separator + fileName;

        // Create a Cab object
        Cab cab = new Cab(0, name, imagePath, description, capacity, useCase, fareRange);

        // Add the cab to the database
        boolean f = cabDAO.addCab(cab);

        if (f) {
            response.sendRedirect("viewCabs"); // Redirect to the viewCabs page after successful addition
        } else {
            request.setAttribute("errorMessage", "Failed to add cab. Please try again.");
            request.getRequestDispatcher("/WEB-INF/view/admin/addCab.jsp").forward(request, response); // Forward back to the form with an error message
        }
    }

    // Helper method to extract the file name from the Part
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