package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
        	String fullName = req.getParameter("full_name");
        	String email = req.getParameter("email");
        	String password = req.getParameter("password");


            User user = new User(fullName, email, password);

            UserDao dao = new UserDao(DBConnect.getConn());
            
            HttpSession session = req.getSession();

            boolean f = dao.register(user);
            																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																			
            if (f) {
            	session.setAttribute("sucmsg", "Register successfully");
                 
            	resp.sendRedirect("signup.jsp");
            } else {
            	session.setAttribute("errormsg", "Something wrong on server");
                
            	resp.sendRedirect("signup.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
           
        }
    }
}
