package com.seller.servlet;

import com.dao.OrderDAO;
import com.entity.Order;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Date;

public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerId = Integer.parseInt(request.getParameter("customer_id"));
        double totalAmount = Double.parseDouble(request.getParameter("total_amount"));
        String status = "Pending";  // Initially set the status as pending

        Order order = new Order(0, customerId, new Date(), totalAmount, status);

        boolean isOrderPlaced = OrderDAO.createOrder(order);

        if (isOrderPlaced) {
            int productId = Integer.parseInt(request.getParameter("product_id"));

            OrderDAO.notifySeller(productId);

            response.sendRedirect("order_confirmation.jsp");  // redirect to a confirmation page
        } else {
            response.getWriter().println("Order placement failed.");
        }
    }
}
