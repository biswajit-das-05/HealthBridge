<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }
        .confirmation-box {
            background-color: #ffffff;
            padding: 20px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
        h1 {
            color: #28a745;
            margin-bottom: 20px;
        }
        p {
            color: #333;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="confirmation-box">
    <h1>Order Confirmed</h1>
    <p>Thank you for shopping with us!</p>
    <p>Your product <strong><%= request.getParameter("product") %></strong> will be delivered to:</p>
    <p>Name: <strong><%= request.getParameter("name") %></strong></p>
    <p>Location: <strong><%= request.getParameter("location") %></strong></p>
    <p>Phone: <strong><%= request.getParameter("phone") %></strong></p>
    <p>We will deliver your product soon.</p>
</div>

</body>
</html>