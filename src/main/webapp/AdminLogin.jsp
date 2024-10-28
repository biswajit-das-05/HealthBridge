<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            width: 100%;
            background-color: #007bff;
            padding: 15px 20px;
            color: white;
            font-size: 1.2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 60px; /* Offset for fixed navbar */
        }

        .card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .card-header {
            text-align: center;
            background-color: #343a40;
            border-radius: 10px 10px 0 0;
            padding: 20px;
        }

        .my-bg-color {
            background-color: #007bff;
        }

        .text-white {
            background-color: #28a745 !important;
        }

        .fs-4 {
            font-size: 1.5rem;
        }

        .card-body {
            padding: 30px;
        }

        .form-label {
            font-size: 1rem;
            font-weight: bold;
            color: #343a40;
        }

        .form-control {
            border: 1px solid #ced4da;
            border-radius: 5px;
            padding: 10px;
            font-size: 1rem;
            width: 100%;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
        }

        .btn {
            font-size: 1.2rem;
            padding: 10px;
            cursor: pointer;
            border: none;
            border-radius: 10px;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        button:hover {
            background-color: #ff0000;
        }
    </style>

</head>
<body>
<%@include file ="navbar.jsp" %>
<div class="container">
    <div class="card my-card">
        <div class="card-header text-center text-white my-bg-color">
            <p class="fs-4 text-center text-white mt-2">
                <i class="fa fa-universal-access"></i> Admin Login</p>
            <c:if test="${not empty succMsg }">
                <p class="text-center text-success fs-3">${succMsg}</p>
                <c:remove var="succMsg" scope="session" />
            </c:if>

            <c:if test="${not empty errorMsg }">
                <p class="text-center text-danger fs-5">${errorMsg}</p>
                <c:remove var="errorMsg" scope="session" />
            </c:if>
        </div>

        <div class="card-body">
            <form action="AdminLogin" method="post">
                <div class="mb-3">
                    <label class="form-label">Email address</label>
                    <input name="email" type="email" placeholder="Enter Email" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input name="password" type="password" placeholder="Enter password" class="form-control">
                </div>
                <button type="submit" class="btn my-bg-color text-white">Submit</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
