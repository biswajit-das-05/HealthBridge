//package com.seller.servlet;
//
//import com.dao.ProductDAO;
//import com.entity.Product;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.*;
//import java.io.IOException;
//import java.io.InputStream;
//import java.sql.SQLException;
//
//@WebServlet("/AddProductServlet")
//public class AddProductServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Retrieve product details from the form
//        String productName = request.getParameter("productName");
//        String productPriceStr = request.getParameter("productPrice");
//
//        if (productPriceStr == null || productPriceStr.trim().isEmpty()) {
//            productPriceStr = "0"; // Default to 0 if price is missing
//            System.out.println("Using default price: " + productPriceStr); // Debugging line
//        }
//
//        Part productImagePart = request.getPart("productImage"); // Get image part
//
//        double productPrice = 0;
//        try {
//            productPrice = Double.parseDouble(productPriceStr);  // Parse price to double
//        } catch (NumberFormatException e) {
//            e.printStackTrace();
//            response.getWriter().write("Invalid price format");
//            return;
//        }
//
//        InputStream productImage = null;
//        if (productImagePart != null) {
//            productImage = productImagePart.getInputStream(); // Get the InputStream of the image
//        }
//
//        Product product = new Product();
//        product.setProductName(productName);
//        product.setProductPrice(productPrice);
//        product.setProductImage(productImage.toString());
//
//        ProductDAO productDAO = new ProductDAO();
//        try {
//            boolean isProductAdded = productDAO.addProduct(product);
//            if (isProductAdded) {
//                response.sendRedirect("menu.jsp");  // Redirect on success
//            } else {
//                response.getWriter().write("Failed to add product");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            response.getWriter().write("Database error occurred: " + e.getMessage());
//        }
//    }
//}
//
//
