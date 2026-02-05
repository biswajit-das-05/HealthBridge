<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.db.DBConnect" %>
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
            margin: 10px;
            transition: transform 0.2s;
            cursor: pointer;
        }

        .my-card, .card-body {
            height: 200px;
        }

        .my-card:hover {
            transform: scale(1.05);
        }

        .card-link {
            text-decoration: none;
            color: inherit;
        }

        .card-link:hover {
            color: inherit;
        }

        .card-body {
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
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

        .btn {
            cursor: pointer;
        }


        header, .navbar {
            display: none;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp"%>

<c:if test="${ empty adminObj }">
    <c:redirect url="../AdminLogin.jsp"></c:redirect>
</c:if>
<%
    DoctorDao dao = new DoctorDao(DBConnect.getConn());
%>
<div class="container p-5">
    <p class="text-center text-danger fs-3">Admin Dashboard</p>
    <div class="row">
        <!-- Doctor Section -->
        <div class="col-md-4">
            <a href="Doctor.jsp" class="card-link">
                <div class="card my-card">
                    <div class="card-body text-center text-danger">
                        <i class="fas fa-user-md fa-3x"></i><br>
                        <p class="fs-4">Doctor</p><%= dao.countDoctor() %>
                    </div>
                </div>
            </a>
        </div>

        <!-- View Doctor Section -->
        <div class="col-md-4">
            <a href="viewDoctor.jsp" class="card-link">
                <div class="card my-card">
                    <div class="card-body text-center text-danger">
                        <i class="fas fa-eye fa-3x"></i><br>
                        <p class="fs-4">View Doctor</p><%= dao.countDoctor() %>
                    </div>
                </div>
            </a>
        </div>

        <!-- Patient Section -->
        <div class="col-md-4">
            <a href="patient.jsp" class="card-link">
                <div class="card my-card">
                    <div class="card-body text-center text-danger">
                        <i class="fas fa-user-circle fa-3x"></i><br>
                        <p class="fs-4">Patient</p><%= dao.countUser() %>
                    </div>
                </div>
            </a>
        </div>


        <!-- Appointment Section -->
        <div class="col-md-4">
            <a href="patient.jsp" class="card-link">
                <div class="card my-card">
                    <div class="card-body text-center text-danger">
                        <i class="fas fa-calendar-check fa-3x"></i><br>
                        <p class="fs-4">Total Appointment</p><%= dao.countAppointment() %>
                    </div>
                </div>
            </a>
        </div>

        <!-- Specialist Section with Modal Trigger -->
        <div class="col-md-4 " data-bs-toggle="modal" data-bs-target="#exampleModal">
            <div class="card my-card">
                <div class="card-body text-center text-danger">
                    <i class="fas fa-user-tag fa-3x"></i><br>
                    <p class="fs-4">Specialist</p><%= dao.countSpecialist() %>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Adding Specialist -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="../addSpecialist" method="post">
                    <div class="form-group">
                        <label>Enter Specialist Name</label>
                        <input type="text" name="specName" class="form-control">
                    </div>
                    <div class="text-center mt-3">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
