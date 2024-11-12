package com.seller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.entity.User;

@SuppressWarnings("CallToPrintStackTrace")
@WebServlet("/SellerLogin")
public class SellerLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            System.out.println("Email: " + email);
            System.out.println("Password: " + password);

            HttpSession session = req.getSession();
            if ("seller@gmail.com".equals(email) && "seller".equals(password)) {
                session.setAttribute("SellerObj", new User());
                System.out.println("Session attribute set for SellerObj"); // Debugging output
                resp.sendRedirect(req.getContextPath() + "/Seller/index.jsp");
            } else {
                session.setAttribute("errorMsg", "Invalid email and password");
                resp.sendRedirect(req.getContextPath() + "/Seller/SellerLogin.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }}}





