package com.user.servlet;

import com.entity.Product;
import com.util.DBUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if ("addToCart".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            List<Product> products = (List<Product>) session.getAttribute("products");
            List<Product> cart = (List<Product>) session.getAttribute("cart");

            if (cart == null) {
                cart = new ArrayList<>();
            }

            for (Product product : products) {
                if (product.getId() == productId) {
                    cart.add(product);
                    addProductToCartDatabase(session.getId(), productId); // Store in DB
                    break;
                }
            }

            session.setAttribute("cart", cart);
            response.sendRedirect("cart.jsp");
        }

    }

    private void addProductToCartDatabase(String sessionId, int productId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO order_list (name, product, location, phone) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, sessionId);
            stmt.setInt(2, productId);

            stmt.setString(3, "location");
            stmt.setString(4, "phone");
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(conn);
        }
    }
}