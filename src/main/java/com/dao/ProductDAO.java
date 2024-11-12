//package com.dao;
//
//import com.entity.Product;
//import com.util.DBUtil;
//
//import java.io.InputStream;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
//public class ProductDAO {
//
//    public boolean addProduct(Product product) throws SQLException {
//        String sql = "INSERT INTO products (name, price, image_path) VALUES (?, ?, ?)";
//
//        try (Connection conn = DBUtil.getConnection();
//             PreparedStatement stmt = conn.prepareStatement(sql)) {
//
//            // Set the product name and price
//            stmt.setString(1, product.getProductName());
//            stmt.setDouble(2, product.getProductPrice());
//
//            // Set the product image using InputStream (make sure the image is an InputStream)
//            InputStream productImageStream = product.getProductImage(); // Should already be an InputStream
//            if (productImageStream != null) {
//                stmt.setBinaryStream(3, productImageStream, productImageStream.available()); // Set the InputStream
//            } else {
//                stmt.setNull(3, java.sql.Types.BLOB); // Set NULL if there is no image
//            }
//
//            // Execute the query
//            int rowsAffected = stmt.executeUpdate();
//            return rowsAffected > 0;
//        }
//    }
//}
