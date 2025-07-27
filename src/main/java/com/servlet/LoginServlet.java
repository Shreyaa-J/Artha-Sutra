package com.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import com.dao.UserDAO;
import com.model.User;

@WebServlet("/LoginServlet")
public class LoginServlet  extends HttpServlet {
	   protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");

	        if (UserDAO.validateUser(username, password)) {
	            HttpSession session = request.getSession();
	            session.setAttribute("user", new User(username, password));
	            response.sendRedirect("dashboard.jsp");
	        } else {
	            response.getWriter().println("Invalid username or password.");
	        }
	    }
    }
	

