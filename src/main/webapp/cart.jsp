<%@ page import="java.util.List" %>
<%@ page import="com.entity.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Product> cart = (List<Product>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            flex-direction: column;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #343a40;
            color: #ffffff;
            font-weight: bold;
        }

        td {
            color: #555;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }

        .buttons button {
            padding: 10px 20px;
            background-color: #28a745;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .buttons button:hover {
            background-color: #218838;
        }

        .remove-button {
            background-color: #dc3545;
        }

        .remove-button:hover {
            background-color: #c82333;
        }
    </style>

    <script>
        // AJAX function to remove a product from the cart
        function removeFromCart(productId) {
            var formData = new FormData();
            formData.append("action", "removeItem");
            formData.append("productId", productId);

            fetch("CartServlet", {
                method: "POST",
                body: formData
            })
                .then(response => response.text())
                .then(data => {
                    document.getElementById("cartContent").innerHTML = data; // Update cart content with new HTML
                })
                .catch(error => console.error('Error:', error));
        }

        // AJAX function to reset the cart
        function resetCart() {
            var formData = new FormData();
            formData.append("action", "resetCart");

            fetch("CartServlet", {
                method: "POST",
                body: formData
            })
                .then(response => response.text())
                .then(data => {
                    document.getElementById("cartContent").innerHTML = data; // Update cart content with new HTML
                })
                .catch(error => console.error('Error:', error));
        }
    </script>


</head>
<body>


<h1>Your Cart</h1>
<div id="cartContent">
    <table>
        <tr>
            <th>Product Name</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        <% for (Product product : cart) { %>
        <tr>
            <td><%= product.getName() %></td>
            <td>₹ <%= product.getPrice() %></td>

        </tr>
        <% } %>
    </table>
</div>

<div class="buttons">
    <form action="orderForm.jsp" method="post" style="display:inline;">
        <button type="submit">Buy</button>
    </form>
    <button onclick="resetCart()">Reset Cart</button>
</div>

</body>
</html>
