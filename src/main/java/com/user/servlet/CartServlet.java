package com.user.servlet;

import com.entity.Product;

import java.io.IOException;
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

        // Adding product to cart
        if ("addToCart".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            List<Product> products = (List<Product>) session.getAttribute("products");
            List<Product> cart = (List<Product>) session.getAttribute("cart");

            if (cart == null) {
                cart = new ArrayList<>();
            }

            // Find product by ID and add to cart
            for (Product product : products) {
                if (product.getId() == productId) {
                    cart.add(product);
                    break;
                }
            }

            session.setAttribute("cart", cart);
            // Redirect to cart.jsp after adding to cart
            response.sendRedirect("cart.jsp");
        }

        // Additional actions (like placing an order) can go here
    }
}
