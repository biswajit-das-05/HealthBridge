<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>

    <style>
        /* CSS code inlined */
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
            justify-content: center;
            align-items: center;
        }

        .container {
            max-width: 100%;
        }

        .card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 50px;
        }

        .card-header {
            text-align: center;
            background-color: #343a40;
            border-radius: 10px;
            padding: 20px;
        }

        .my-bg-color {
            background-color: #007bff; /* Blue background for buttons and header */
        }

        .my-card {
            border: none;
        }

        .text-white {
            color: white;
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
        }

        button {
            width: 400px;
            background-color: #0000ff;
        }

        button:hover {
            background-color: #ff0000;
        }
    </style>

</head>
<body>
<div class="container p-5">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card my-card">
                <div class="card-header text-center text-white my-bg-color">
                    <p class="fs-4 text-center text-white mt-2">
                        <i class="fa fa-universal-access"></i> Admin Login</p>
                        
                         <c:if test="${not empty sucmsg}">
                          <p class="text-center text-success fs-3">${sucmsg}</p>
                          <c:remove var="sucmsg" scope="session"/>
                    </c:if>

                    <c:if test="${not empty errormsg}">
                          <p class="text-center text-danger fs-3">${errormsg}</p>
                          <c:remove var="errormsg" scope="session"/>
                    </c:if>
                </div>
                <div class="card-body">
                    <!-- Form that submits to a servlet or another JSP page -->
                    <form action="AdminLogin" method="post">
                        <div class="mb-3">
                            <label class="form-label">Email address</label>
                            <input name="email" type="email" placeholder="Enter Email" class="form-control">
                        </div> <br> <br>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input name="password" type="password" placeholder="Enter password" class="form-control">
                        </div> <br>
                        <button type="submit" class="btn my-bg-color text-white col-md-12">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
