<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Seller Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .dashboard-container {
            width: 100%;
            max-width: 600px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin: 20px;
            position: relative;
        }

        .dashboard-container h1 {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .logout-button {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 10px 15px;
            font-size: 14px;
            color: #fff;
            background-color: #dc3545;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .logout-button:hover {
            background-color: #c82333;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-size: 16px;
            color: #555;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group input[type="file"] {
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group input[type="text"]:focus,
        .form-group input[type="number"]:focus,
        .form-group input[type="file"]:focus {
            outline: none;
            border-color: #5c67f2;
        }

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

        @media (max-width: 600px) {
            .dashboard-container {
                width: 90%;
                padding: 15px;
            }
        }
    </style>
</head>
<body>

<div class="dashboard-container">
    <a href="../SellerLogout" class="logout-button">Logout</a>

    <h1>Seller Dashboard</h1>
    <form action="" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="productName">Product Name</label>
            <input type="text" id="productName" name="productName" required placeholder="Enter product name">
        </div>

        <div class="form-group">
            <label for="productPrice">Product Price</label>
            <input type="text" id="productPrice" name="productPrice" required placeholder="Enter product price">
        </div>

        <div class="form-group">
            <label for="productImage">Product Image</label>
            <input type="file" id="productImage" name="productImage" required>
        </div>

        <button type="submit">Add Product</button>
    </form>
</div>
</body>
</html>
