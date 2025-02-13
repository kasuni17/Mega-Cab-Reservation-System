package com.megacabservice.user_servlet;

import java.io.IOException;
import java.nio.file.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.megacabservice.dao.CabDAO;
import com.megacabservice.entity.Cab;
import java.io.File;

@WebServlet("/editCab")
@MultipartConfig(fileSizeThreshold = 2 * 1024 * 1024, // 2MB
                 maxFileSize = 10 * 1024 * 1024,      // 10MB
                 maxRequestSize = 50 * 1024 * 1024)   // 50MB
public class EditCabServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CabDAO dao = new CabDAO();
        Cab cab = dao.getCabById(id);
        if (cab != null) {
            request.setAttribute("cab", cab);
            request.getRequestDispatcher("/WEB-INF/view/admin/editCab.jsp").forward(request, response);
        } else {
            response.sendRedirect("manageCabs");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String capacity = request.getParameter("capacity");
            String useCase = request.getParameter("useCase");
            String fareRange = request.getParameter("fareRange");
            String existingImage = request.getParameter("existingImage");

            Part filePart = request.getPart("image");
            String fileName = filePart.getSubmittedFileName();
            String imagePath = existingImage;

            if (fileName != null && !fileName.isEmpty()) {
                String uploadDir = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) uploadDirFile.mkdirs();

                imagePath = "uploads" + File.separator + fileName;
                Path filePath = Paths.get(uploadDir, fileName);
                Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
            }

            Cab cab = new Cab(id, name, description, capacity, useCase, fareRange, imagePath);
            CabDAO dao = new CabDAO();
            boolean updated = dao.updateCab(cab);

            if (updated) {
                response.sendRedirect("manageCabs?message=success");
            } else {
                request.setAttribute("errorMessage", "Failed to update cab.");
                request.getRequestDispatcher("/WEB-INF/view/admin/editCab.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid input or internal error.");
            request.getRequestDispatcher("/WEB-INF/view/admin/editCab.jsp").forward(request, response);
        }
    }
}
