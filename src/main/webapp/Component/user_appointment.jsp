<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.db.DBConnect" %>

<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Appointment Page</title>
    <!-- all css include -->
    <%@include file="allCss.jsp"%>

    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.4);
        }

        .backImg{
            height: 20vh;
            width: 100%;
            background-size:cover;
            background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)) no-repeat;

        }
    </style>

</head>
<body>
<%@include file="navbar.jsp"%>


<div class="container-fluid backImg p-5">

    <p class="text-center fs-2 text-white"></p>
</div>



<div class="container p-3">
    <div class="row">


        <div class="col-md-6 p-5">
            <!-- for Background image -->
            <!-- <img alt="" src="img/picDoc.jpg" width="500px" height="400px"> -->
            <%-- <img alt="" src="img/doc3.jpg" width="370" height="">--%>
        </div>


        <div class="col-md-6">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="text-center fs-3">User Appointment</p>


                    <c:if test="${not empty successMsg }">
                        <p class="fs-4 text-center text-success">${successMsg}</p>
                        <c:remove var="successMsg" scope="session" />
                    </c:if>


                    <c:if test="${not empty errorMsg }">
                        <p class="fs-4 text-center text-danger">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>

                    <form class="row g-3" action="userAppointment" method="post">


                        <input type="hidden" name="userId" value="${ userObj.id }">

                        <div class="col-md-6">
                            <%--@declare id="inputemail4"--%><label for="inputEmail4" class="form-label">Full Name</label>
                            <label>
                                <input required type="text" class="form-control" name="fullname">
                            </label>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Gender</label>
                            <label>
                                <select class="form-control" name="gender" required>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                              </select>
                            </label>
                        </div>

                        <div class="col-md-6">
                            <label for="inputEmail4" class="form-label">Age</label>
                            <label>
                                <input required	type="number" class="form-control" name="age">
                            </label>
                        </div>

                        <div class="col-md-6">
                            <label for="inputEmail4" class="form-label">Appointment Date</label>
                            <label>
                                <input type="date" class="form-control" required name="appointmentDate">
                            </label>
                        </div>

                        <div class="col-md-6">
                            <label for="inputEmail4" class="form-label">Email</label>
                            <label>
                                <input required type="email" class="form-control" name="email">
                            </label>
                        </div>

                        <div class="col-md-6">
                            <label for="inputEmail4" class="form-label">Phone No</label>
                            <label>
                                <input maxlength="10" required type="number" class="form-control" name="phno">
                            </label>
                        </div>

                        <div class="col-md-6">
                            <label for="inputEmail4" class="form-label">Diseases</label>
                            <label>
                                <input required type="text" class="form-control" name="diseases">
                            </label>
                        </div>

                        <div class="col-md-6">
                            <%--@declare id="inputpassword4"--%><label for="inputPassword4" class="form-label">Doctor</label>
                            <label>
                                <select required class="form-control" name="doct">
                                <option value="">--- select---</option>

                                <%
                                    DoctorDao dao = new DoctorDao(DBConnect.getConn());
                                    List<Doctor> list = dao.getAllDoctor();
                                       for (Doctor d:list) {
                                       %>
                                             <option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)
                                             </option>
                                       <%
                                       }
                                       %>

                              </select>
                            </label>
                        </div>


                        <div class="col-md-12">
                            <label class="form-label">Full Address</label>
                            <label>
                                <textarea required name="address" class="form-control" rows="3" cols=""></textarea>
                            </label>
                        </div>


                        <c:if test="${empty userObj}">
                                <a href="../UserLogin.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
                        </c:if>


                        <c:if test="${not empty userObj}">
                                <button class="col-md-6 offers-md-3 btn btn-success">Submit</button>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

