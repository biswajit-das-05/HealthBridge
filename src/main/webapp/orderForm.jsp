<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Form</title>
    <style>
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
            height: 100vh;
            padding: 20px;
            flex-direction: column;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        form {
            background-color: #ffffff;
            padding: 20px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
        label {
            font-size: 16px;
            color: #333;
            margin-bottom: 8px;
            display: block;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            color: #333;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<h1>Order Form</h1>
<form action="confirmation.jsp" method="POST">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br><br>

    <label for="product">Product:</label>
    <input type="text" id="product" name="product" required><br><br>

    <label for="location">Location:</label>
    <input type="text" id="location" name="location" required><br><br>

    <label for="phone">Phone:</label>
    <input type="text" id="phone" name="phone" required><br><br>

    <button type="submit">Add to Cart</button>
</form>

</body>
</html>