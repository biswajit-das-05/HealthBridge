<!-- SellerDashboard.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Seller Dashboard</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        /* Container for Dashboard */
        .dashboard-container {
            width: 100%;
            max-width: 600px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 20px;
        }

        /* Header Styling */
        .dashboard-container h1 {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Form Styling */
        form {
            display: flex;
            flex-direction: column;
        }

        form label {
            font-size: 16px;
            color: #555;
            margin-bottom: 8px;
        }

        form input[type="text"],
        form input[type="number"],
        form input[type="file"] {
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        /* Button Styling */
        button {
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background-color: #5c67f2;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #4451e1;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .dashboard-container {
                width: 90%;
                padding: 15px;
            }
        }

    </style>
</head>
<body>

<h1>Seller Dashboard</h1>
<form action="AddProductServlet" method="post" enctype="multipart/form-data">
    <input type="text" name="productName" required>
    <input type="text" name="productPrice" required>
    <input type="file" name="productImage" required>
    <button type="submit">Add Product</button>
</form>


</body>
</html>
