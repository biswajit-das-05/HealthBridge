<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>User Login</title>
  <style>
    body {
      background-color: #f0f2f5;
      font-family: Arial, sans-serif;
    }

    .container {
      margin-top: 50px;
    }

    .my-card {
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    }

    .my-bg-color {
      background-color: #007bff;
    }

    .card-header {
      border-bottom: none;
    }

    .card-body {
      padding: 2rem;
    }

    .form-label {
      font-weight: bold;
    }

    .form-control {
      border-radius: 5px;
    }

    .btn {
      border-radius: 5px;
      background-color: #007bff;
      border: none;
    }

    .btn:hover {
      background-color: #0056b3;
    }

    .text-success {
      font-weight: bold;
    }

    .text-danger {
      font-weight: bold;
    }

    .text-decoration-none {
      text-decoration: none;
      color: #007bff;
    }

    .text-decoration-none:hover {
      text-decoration: underline;
    }

    .registration-section {
      margin-top: 1rem;
    }
  </style>
</head>
<body>
<%@include file ="navbar.jsp" %>

<!-- User Login -->
<div class="container p-5">
  <div class="row">
    <div class="col-md-4 offset-md-4">
      <div class="card paint-card">
        <div class="card-body">
          <p class="fs-4 text-center">User Login</p>

          <c:if test="${not empty succMsg }">
            <p class="text-center text-success fs-3">${succMsg}</p>
            <c:remove var="succMsg" scope="session" />
          </c:if>

          <c:if test="${not empty errorMsg }">
            <p class="text-center text-danger fs-5">${errorMsg}</p>
            <c:remove var="errorMsg" scope="session" />
          </c:if>

          <form action="UserLogin" method="post">
            <div class="mb-3">
              <label class="form-label">Email address</label> <input required
                                                                     name="email" type="email" class="form-control">
            </div>

            <div class="mb-3">
              <label class="form-label">Password</label> <input required
                                                                name="password" type="password" class="form-control">
            </div>

            <button type="submit" class="btn bg-success text-white col-md-12">Login</button>
          </form>

          <br> Don't have an account? <a href="signup.jsp"
                                         class="text-decoration-none"> create one</a>

        </div>
      </div>
    </div>
  </div>
</div>

<!-- End of User Login -->

</body>
</html>
