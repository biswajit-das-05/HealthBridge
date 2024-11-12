package com.entity;

import java.util.Date;

public class Order {

    private int orderId;
    private int userId;
    private int productId;
    private int quantity;
    private double totalPrice;
    private String orderStatus;
    private Date orderDate;  // Added a Date field for order date

    // Constructor with all fields
    public Order(int orderId, int userId, int productId, int quantity, double totalPrice, String orderStatus, Date orderDate) {
        this.orderId = orderId;
        this.userId = userId;
        this.productId = productId;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.orderStatus = orderStatus;
        this.orderDate = orderDate;  // Initialize the order date
    }

    public Order(int orderId, int customerId, Date date, double totalAmount, String status) {
    }

    // Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    // toString() method for easy display
    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", userId=" + userId +
                ", productId=" + productId +
                ", quantity=" + quantity +
                ", totalPrice=" + totalPrice +
                ", orderStatus='" + orderStatus + '\'' +
                ", orderDate=" + orderDate +
                '}';
    }

    public int getCustomerId() {
        return 0;
    }

    public double getTotalAmount() {
        return 0;
    }

    public String getStatus() {
        return "";
    }
}
