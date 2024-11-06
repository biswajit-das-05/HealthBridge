<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Sample product data
    List<Product> products = new ArrayList<>();
    products.add(new Product(1, "Paracetamol", 10.5, "images/paracetamol.jpg"));
    products.add(new Product(2, "Ibuprofen", 12.0, "images/ibuprofen.jpg"));
    products.add(new Product(3, "Amoxicillin", 15.0, "images/amoxicillin.jpg"));

    session.setAttribute("products", products);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Medicine Shop - Menu</title>
    <style>
        /* Reset and general styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f9f9f9;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }

        /* Product card styling */
        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .product-card {
            border: 1px solid #ddd;
            padding: 16px;
            width: 220px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }

        .product-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 4px;
        }

        .product-card h2 {
            font-size: 18px;
            color: #333;
            margin: 10px 0;
        }

        .product-card p {
            color: #555;
            font-size: 16px;
            margin-bottom: 15px;
        }

        /* Button styling */
        .product-card button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .product-card button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h1>Medicine Shop</h1>
<div class="product-container">
    <% for (Product product : products) { %>
    <div class="product-card">
        <img src="<%= product.getImagePath() %>" alt="<%= product.getName() %>">
        <h2><%= product.getName() %></h2>
        <p>Price: ₹<%= product.getPrice() %></p> <!-- Rupee symbol with price -->
        <form action="CartServlet" method="post">
            <input type="hidden" name="productId" value="<%= product.getId() %>">
            <button type="submit">Add to Cart</button>
        </form>
    </div>
    <% } %>
</div>

</body>
</html>
