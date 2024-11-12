<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Doctor" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        header {
            color: green;
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
            align-items: center;
        }
        .header-title h1 {
            margin: 0;
        }
        .logout-btn button {
            background-color: #fff;
            border: 1px solid #2c7c5d;
            color: #2c7c5d;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 5px;
        }
        .logout-btn button:hover {
            background-color: #2c7c5d;
            color: white;
        }
        .dashboard-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 50px;
        }
        .dashboard-box {
            background-color: white;
            border: 2px solid #ddd;
            border-radius: 10px;
            width: 200px;
            height: 150px;
            margin: 0 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            cursor: pointer;
        }
        .dashboard-box:hover {
            transform: scale(1.05);
        }
        .icon {
            font-size: 40px;
            color: #2c7c5d;
        }
        .content h2 {
            margin: 10px 0 5px;
            font-size: 18px;
            color: #333;
        }
        .content p {
            font-size: 20px;
            color: #2c7c5d;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp"%>
<header>
    <h1>Doctor Dashboard</h1>
</header>
<%
    Doctor d = (Doctor) session.getAttribute("DoctorObj");
    DoctorDao dao = new DoctorDao(DBConnect.getConn());
%>

<main>
    <div class="dashboard-container">
        <div class="dashboard-box" onclick="redirectTo('doctor.html')">
            <div class="icon"><i class="fa fa-user-md"></i></div>
            <div class="content">
                <h2>Patient</h2><%= dao.countAppointmentByDoctorId(d.getId())%>
            </div>
        </div>
        <div class="dashboard-box" onclick="redirectTo('appointments.html')">
            <div class="icon"><i class="fa fa-calendar-check-o"></i>
                <i class="fas fa-calendar-check fa-1x"></i><br>
            </div>
            <div class="content">
                <h2>Total Appointments</h2><%= dao.countAppointmentByDoctorId(d.getId())%>
            </div>
        </div>
    </div>
</main>
</body>
</html>