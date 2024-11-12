package com.seller.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/SellerLogout")
public class SellerLogout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        session.invalidate();
        session = req.getSession(true);
        session.setAttribute("succMsg", "Logout successful");
        resp.sendRedirect("Seller/SellerLogin.jsp");
    }
}

