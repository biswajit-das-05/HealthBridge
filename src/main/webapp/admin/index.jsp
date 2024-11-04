<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDao" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            padding: 20px;
        }

        .my-card {
            box-shadow: 0px 0px 10px 1px maroon;
            border-radius: 8px;
            background-color: #ffffff;
            margin-bottom: 20px;
        }

        .card-body {
            padding: 20px;
        }

        .text-center {
            text-align: center;
        }

        .text-danger {
            color: #dc3545 !important;
        }

        .fs-3 {
            font-size: 1.75rem;
        }

        .fs-4 {
            font-size: 1.5rem;
        }

        .fa-3x {
            font-size: 3rem;
            margin-bottom: 10px;
        }

        .modal-header {
            background-color: #f8f9fa;
            border-bottom: none;
        }

        .modal-title {
            color: #dc3545;
            font-weight: bold;
        }

        .modal-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            padding: 10px;
            font-size: 16px;
            border-radius: 4px;
            border: 1px solid #ced4da;
        }

        .btn-outline-danger {
            border-color: #dc3545;
            color: #dc3545;
        }

        .btn-outline-danger:hover {
            background-color: #dc3545;
            color: #ffffff;
        }

        .btn-close {
            background-color: transparent;
            border: none;
            font-size: 1.5rem;
            line-height: 1;
            opacity: 0.5;
        }

        .btn-close:hover {
            opacity: 1;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            color: #ffffff;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }

        .btn {
            cursor: pointer;
        }

        .card-link {
            text-decoration: none;
            color: inherit;
        }

        .my-card {
            cursor: pointer;
            transition: transform 0.2s;
        }

        .my-card:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp"%>

<c:if test="${ empty adminObj }">
    <c:redirect url="../AdminLogin.jsp"></c:redirect>
</c:if>
<div class="container p-5">
    <c:if test="${not empty errorMsg}">
    <p class="fs-3 text-center text-danger">${errorMsg}</p>
        <c:remove var="errorMsg" scope="session" />
    </c:if>
    <c:if test="${not empty succMsg}">
    <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
        <c:remove var="succMsg" scope="session" />
    </c:if>
    <% DoctorDao dao = new DoctorDao(DBConnect.getConn()); %>
<div class="container p-5">
    <p class="text-center text-danger fs-3">Admin Dashboard</p>
    <div class="row">
        <div class="col-md-4">
            <a href="doctor.html" class="card-link">
                <div class="card my-card">
                    <div class="card-body text-center text-danger">
                        <i class="fa-solid fa-user-doctor fa-3x"></i><br>
                        <p class="fs-4">Doctor</p><%= dao.countDoctor()%>
                    </div>
                </div>
            </a>
        </div>

            <div class="col-md-4">
                <a href="doctor.html" class="card-link">
                    <div class="card my-card">
                        <div class="card-body text-center text-danger">
                            <i class="fa-solid fa-user-doctor fa-3x"></i><br>
                            <p class="fs-4">View Doctor</p>24
                        </div>
                    </div>
                </a>
            </div>
        <div class="col-md-4">
            <a href="patient.html" class="card-link">
                <div class="card my-card">
                    <div class="card-body text-center text-danger">
                        <i class="fas fa-user-circle fa-3x"></i><br>
                        <p class="fs-4">Patient</p>4555
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="appointments.html" class="card-link">
                <div class="card my-card">
                    <div class="card-body text-center text-danger">
                        <i class="fa-solid fa-calendar-check fa-3x"></i><br>
                        <p class="fs-4">Total Appointment</p><%= dao.countAppointment()%>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4 mt-2"data-bs-toggle="modal" data-bs-target="#exampleModal">
                <div class="card my-card">
                    <div class="card-body text-center text-danger">
                        <i class="fa-solid fa-user-doctor fa-3x"></i><br>
                        <p class="fs-4">Specialist</p><%= dao.countSpecialist()%>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="../addSpecialist" method="post">

                    <div class="form-group">
                        <label>Enter Specialist Name</label> <input type="text"
                                                                    name="specName" class="form-control">
                    </div>
                    <div class="text-center mt-3">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>
</body>
</html>
