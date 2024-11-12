package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.Seller;

@SuppressWarnings("ALL")
public class SellerDao {

    private Connection conn;

    public SellerDao(Connection conn) {
        this.conn = conn;
    }

    public boolean register(Seller s) {
        boolean f = false;
        String sql = "INSERT INTO seller_dtls(full_name, email, password) VALUES (?, ?, ?)";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, s.getFullName());
            ps.setString(2, s.getEmail());
            ps.setString(3, s.getPassword());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (SQLException e) {
            System.err.println("Error during seller registration: " + e.getMessage());
        }

        return f;
    }

    public Seller login(String email, String password) {
        Seller s = null;
        String sql = "SELECT * FROM seller_dtls WHERE email = ? AND password = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    s = new Seller();
                    s.setId(rs.getInt("id"));
                    s.setFullName(rs.getString("full_name"));
                    s.setEmail(rs.getString("email"));
                    s.setPassword(rs.getString("password"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error during seller login: " + e.getMessage());
        }

        return s;
    }

    public boolean checkOldPassword(int userId, String oldPassword) {
        boolean f = false;
        String sql = "SELECT * FROM seller_dtls WHERE id = ? AND password = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, oldPassword);

            try (ResultSet rs = ps.executeQuery()) {
                f = rs.next(); // If there's a result, the old password is correct
            }
        } catch (SQLException e) {
            System.err.println("Error checking old password: " + e.getMessage());
        }

        return f;
    }

    public boolean changePassword(int userId, String newPassword) {
        boolean f = false;
        String sql = "UPDATE seller_dtls SET password = ? WHERE id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newPassword);
            ps.setInt(2, userId);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (SQLException e) {
            System.err.println("Error changing password: " + e.getMessage());
        }

        return f;
    }
}


