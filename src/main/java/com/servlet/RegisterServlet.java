package com.servlet;
import com.dao.UserDAO;
import com.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	 protected void doPost(HttpServletRequest req, HttpServletResponse res)
	            throws ServletException, IOException {
	        
	        String username = req.getParameter("username");
	        String email = req.getParameter("email");
	        String password = req.getParameter("password");

	        User user = new User(username, email, password);
	        boolean result = UserDAO.registerUser(user); 

	        if (result) {
	            res.sendRedirect("login.jsp");
	        } else {
	            res.getWriter().println("Registration Failed");
	        }
	    }

}
