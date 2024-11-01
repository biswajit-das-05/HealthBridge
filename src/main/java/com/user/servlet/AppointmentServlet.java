package com.user.servlet;

import com.dao.AppointmentDAO;
import com.db.DBConnect;
import com.entity.Appointment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userAppointment")
public class AppointmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int userId = Integer.parseInt(req.getParameter("userId"));
        String fullname = req.getParameter("fullname");
        String gender = req.getParameter("gender");
        String appointent_date = req.getParameter("appointment_date");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String diseases = req.getParameter("diseases");
        int doctor_Id = Integer.parseInt(req.getParameter("doct"));
        String address = req.getParameter("address");


        Appointment ap = new Appointment(userId, fullname, gender, appointent_date, email, phone, diseases, doctor_Id, address, "Pending");

        AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
        HttpSession session = req.getSession();


        if (dao.addAppointment(ap)) {
            session.setAttribute("succMsg", "Appointment Sucessfully");
            resp.sendRedirect("user_appointment.jsp");
        } else {
            session.setAttribute("errorMsg", "Something wrong on server");
            resp.sendRedirect("user_appointment.jsp");
        }
    }

}


