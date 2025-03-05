package com.megacabservice.user_servlet;

import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.megacabservice.dao.userDAOImpl;
import com.megacabservice.dao.DriverDAOImpl;
import com.megacabservice.db.DBConn;
import com.megacabservice.entity.user;
import com.megacabservice.entity.Driver;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class LoginServletTest {

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Mock
    private HttpSession session;

    @Mock
    private RequestDispatcher requestDispatcher;

    @Mock
    private userDAOImpl userDAO;

    @Mock
    private DriverDAOImpl driverDAO;

    @Mock
    private DBConn dbConn;

    @InjectMocks
    private LoginServlet loginServlet;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testAdminLogin() throws ServletException, IOException {
        System.out.println("Running testAdminLogin...");

        // Arrange
        when(request.getParameter("email")).thenReturn("admin@gmail.com");
        when(request.getParameter("password")).thenReturn("admin");
        when(request.getSession()).thenReturn(session);
        when(request.getRequestDispatcher("/WEB-INF/view/admin/home.jsp")).thenReturn(requestDispatcher);

        // Act
        loginServlet.doPost(request, response);

        // Assert
        verify(session).setAttribute(eq("userobj"), any(user.class));
        verify(requestDispatcher).forward(request, response);

        System.out.println("Admin login successful. Session attribute 'userobj' set.");
        System.out.println("Request forwarded to /WEB-INF/view/admin/home.jsp.");
    }
    @Test
    public void testUserLogin() throws ServletException, IOException {
        System.out.println("Running testUserLogin...");

        // Arrange
        when(request.getParameter("email")).thenReturn("kasuniik417@gmail.com");
        when(request.getParameter("password")).thenReturn("kasuni12");
        when(request.getSession()).thenReturn(session);
        when(userDAO.login("kasuniik417@gmail.com", "kasuni12")).thenReturn(new user());

        // Act
        loginServlet.doPost(request, response);

        // Assert
        verify(session).setAttribute(eq("userobj"), any(user.class));
        verify(response).sendRedirect("index.jsp");

        System.out.println("User login successful. Session attribute 'userobj' set.");
        System.out.println("User redirected to index.jsp.");
    }

    @Test
    public void testDriverLogin() throws ServletException, IOException {
        System.out.println("Running testDriverLogin...");

        // Arrange
        when(request.getParameter("email")).thenReturn("sandun@gmail.com");
        when(request.getParameter("password")).thenReturn("Ssandun");
        when(request.getSession()).thenReturn(session);
        when(driverDAO.login("sandun@gmail.com", "Ssandun")).thenReturn(new Driver());
        when(request.getRequestDispatcher("/WEB-INF/view/driver/home.jsp")).thenReturn(requestDispatcher);

        // Act
        loginServlet.doPost(request, response);

        // Assert
        verify(session).setAttribute(eq("driverobj"), any(Driver.class));
        verify(requestDispatcher).forward(request, response);

        System.out.println("Driver login successful. Session attribute 'driverobj' set.");
        System.out.println("Request forwarded to /WEB-INF/view/driver/home.jsp.");
    }
    @Test
    public void testInvalidLogin() throws ServletException, IOException {
        System.out.println("Running testInvalidLogin...");

        // Arrange
        when(request.getParameter("email")).thenReturn("invalid@example.com");
        when(request.getParameter("password")).thenReturn("wrongpass");
        when(request.getSession()).thenReturn(session);
        when(userDAO.login("invalid@example.com", "wrongpass")).thenReturn(null);
        when(driverDAO.login("invalid@example.com", "wrongpass")).thenReturn(null);

        // Act
        loginServlet.doPost(request, response);

        // Assert
        verify(session).setAttribute("failedMsg", "Invalid Email or Password");
        verify(response).sendRedirect("login.jsp");

        System.out.println("Invalid login attempt detected.");
        System.out.println("Session attribute 'failedMsg' set to 'Invalid Email or Password'.");
        System.out.println("User redirected to login.jsp.");
    }

  
}