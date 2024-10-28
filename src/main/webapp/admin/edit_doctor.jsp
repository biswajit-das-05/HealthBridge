<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dao.SpecialistDao" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.entity.Specialist" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Doctor" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Page</title>

</head>
<body>
<%@include file="../Component/allCss.jsp"%>
<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-4 offset-md4">
            <div class="card my-card">
                <div class="card-body">
                    <p class="fs-3 text-center text-danger">Update Doctor</p>

                    <c:if test="${not empty errorMsg}">
                        <p class="fs-3 text-center text-danger">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>
                    <c:if test="${not empty succMsg}">
                        <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>

                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                        Doctor d = dao2.getDoctorById(id);
                    %>
                    <form action="../updateDoctor" method="post">
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input name="fullName" type="text" placeholder="Enter full name" class="form-control"value="<%=d.getFullName()%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Date of Birth</label>
                            <input name="dateOfBirth" type="date" placeholder="Enter DOB" class="form-control"value="<%=d.getDob()%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Qualification</label>
                            <input name="qualification" type="text" placeholder="Enter qualification" class="form-control"value="<%=d.getQualification()%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Specialist</label> <select name="spec"
                                                                                 required class="form-control">
                            <option><%=d.getSpecialist()%></option>

                            <%
                                SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
                                List<Specialist> list = dao.getAllSpecialist();
                                for (Specialist s : list) {
                            %>
                            <option><%=s.getSpecialistName()%></option>
                            <%
                                }
                            %>


                        </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email address</label>
                            <input name="email" type="email" placeholder="Enter Email" class="form-control"value="<%=d.getEmail()%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone</label>
                            <input name="phone" type="text" placeholder="Enter mobile number" class="form-control"value="<%=d.getMobNo()%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input name="password" type="password" placeholder="Enter password" class="form-control"value="<%=d.getPassword()%>">
                        </div>
                        <input type="hidden" name="id" value="<%=d.getId()%>">

                        <button type="submit" class="btn btn-danger text-white col-md-12">update</button>


                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
