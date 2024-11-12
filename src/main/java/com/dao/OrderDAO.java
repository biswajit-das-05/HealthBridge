package com.dao;

import java.sql.*;
import com.entity.Order;
import com.util.DBUtil;

public class OrderDAO {

    public static boolean createOrder(Order order) {
        String sql = "INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, order.getCustomerId());
            stmt.setTimestamp(2, new Timestamp(order.getOrderDate().getTime()));  // set the date and time
            stmt.setDouble(3, order.getTotalAmount());
            stmt.setString(4, order.getStatus());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void notifySeller(int productId) {

        System.out.println("Seller notified for product ID: " + productId);
    }
}
