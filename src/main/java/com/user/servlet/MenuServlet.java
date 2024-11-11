package com.user.servlet;

import com.entity.Product;
import com.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT id, name, price, image_path FROM products";
            try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    String imagePath = rs.getString("image_path");
                    products.add(new Product(id, name, price, imagePath));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("products", products);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}
