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
import com.megacabservice.entity.user;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

class registerServletTest {

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

    @InjectMocks
    private registerServlet registerServlet;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testDoPost_SuccessfulRegistration() throws ServletException, IOException {
        // Arrange
        when(request.getParameter("name")).thenReturn("John Doe");
        when(request.getParameter("email")).thenReturn("john.doe@example.com");
        when(request.getParameter("phone_number")).thenReturn("1234567890");
        when(request.getParameter("nic")).thenReturn("123456789V");
        when(request.getParameter("password")).thenReturn("password123");
        when(request.getParameter("address")).thenReturn("123 Main St");

        when(userDAO.userRegister(any(user.class))).thenReturn(true);
        when(request.getSession()).thenReturn(session);
        when(response.encodeRedirectURL("login.jsp")).thenReturn("login.jsp");

        // Act
        registerServlet.doPost(request, response);

        // Debugging: Print statements to check flow
        System.out.println("Registration test executed.");

        // Assert
        verify(session).setAttribute("message", "Registration successful. Please login.");
        verify(response).sendRedirect("login.jsp");

        // Debugging: Print statements to verify mocks
        System.out.println("Session attribute 'message' set successfully.");
        System.out.println("Redirect to login.jsp executed.");
    }

 

   
}