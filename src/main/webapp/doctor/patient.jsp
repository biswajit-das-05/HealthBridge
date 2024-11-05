<%@ page import="com.entity.Doctor" %>
<%@ page import="com.dao.AppointmentDAO" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.entity.Appointment" %>
<%@ page import="java.util.List" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Page</title>
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
     <%@include file="navbar.jsp"%>
     <header>
       <h1>Doctor Dashboard</h1>
     </header>
     <c:if test="${ empty doctObj }">
       <c:redirect url="../DoctorLogin.jsp"></c:redirect>
     </c:if>

     <div class="container p-3">
       <div class="row">
         <div class="col-md-12">
           <div class="card paint-card">
             <div class="card-body">
               <p class="fs-3 text-center">Patient Details</p>
               <c:if test="${not empty errorMsg }">
                 <p class="text-center text-success fs-5">${errorMsg}</p>
                 <c:remove var="errorMsg" scope="session" />
               </c:if>


               <c:if test="${not empty succMsg }">
                 <p class="text-center text-danger fs-5">${succMsg}</p>
                 <c:remove var="succMsg" scope="session" />
               </c:if>

               <table class="table">
                 <thead>
                      <tr>
                          <th scope="col">Full Name</th>
                          <th scope="col">Gender</th>
                          <th scope="col">Age</th>
                          <th scope="col">Appointment Date</th>
                          <th scope="col">Email</th>
                          <th scope="col">Ph No</th>
                          <th scope="col">Diseases</th>
                          <th scope="col">Status</th>
                          <th scope="col">Action</th>
                      </tr>
                 </thead>
                 <tbody>

                 <%

                   Doctor d = (Doctor) session.getAttribute("doctorObj");

                   //DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
                   AppointmentDAO appDAO = new AppointmentDAO(DBConnect.getConn());
                   List<Appointment> list = appDAO.getAllAppointmentByDoctorLogin(d.getId());
                   for (Appointment ap : list) {
                 %>

                 <tr>
                   <th><%=ap.getFullName()%></th>
                   <td><%=ap.getGender()%></td>
                   <td><%=ap.getAge()%></td>
                   <td><%=ap.getAppointmentDate()%></td>
                   <td><%=ap.getEmail()%></td>
                   <td><%=ap.getPhNo()%></td>
                   <td><%=ap.getDiseases()%></td>
                   <td><%=ap.getStatus()%></td>

                   <td>
                     <%
                     %>if ("Pending".equals(ap.getStatus())) {
                       <a href="comment.jsp?id=<%ap.getId();%>" class="btn btn-success btn-sm">Comment</a>

                       } else {

                       <a href="#" class="btn btn-success btn-sm disabled"><i
                             class="fa fa-comment"></i> Comment / Prescription</a>


                       }<%
                   %>


                   </td>

                 </tr>



                 <%
                   }
                 %>


                 </tbody>
               </table>



             </div>
           </div>
         </div>

       </div>

     </div>

</body>
</html>
