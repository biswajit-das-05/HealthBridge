package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        // Adding product to cart
        if (action == null) {
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
            response.sendRedirect("cart.jsp");
        }

        // Placing the order
        else if (action.equals("placeOrder")) {
            String location = request.getParameter("location");
            String phone = request.getParameter("phone");

            // For now, just clear the cart and simulate an order placement
            session.removeAttribute("cart");
            response.getWriter().println("Order placed successfully! COD payment will be collected at " + location);
            response.getWriter().println("Phone: " + phone);
        }
    }
}
