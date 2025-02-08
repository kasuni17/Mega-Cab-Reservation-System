package com.megacabservice.user_servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.megacabservice.dao.CabDAO;

@WebServlet("/addCab")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class AddCabServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String capacity = request.getParameter("capacity");
            String useCase = request.getParameter("useCase");
            String fareRange = request.getParameter("fareRange");

            Part filePart = request.getPart("image");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            
            // Define upload directory
            String uploadDirectory = getServletContext().getRealPath("/uploads/");
            File uploadDir = new File(uploadDirectory);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs(); // Create directory if it doesn't exist
            }

            String uploadPath = uploadDirectory + File.separator + fileName;
            filePart.write(uploadPath); // Save the file
            
            // Relative path to store in database
            String imagePath = "uploads/" + fileName;

            // Insert cab details into the database
            CabDAO dao = new CabDAO();
            dao.addCab(name, imagePath, description, capacity, useCase, fareRange);

            // Redirect with success message as a URL parameter
            response.sendRedirect("manageCabs?message=Car inserted successfully!");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manageCabs?message=Error inserting car!");
        }
    }
}
