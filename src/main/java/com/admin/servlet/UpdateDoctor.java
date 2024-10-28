package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String fullName = req.getParameter("fullName");
            String dob = req.getParameter("dob");
            String qualification = req.getParameter("qualification");
            String spec = req.getParameter("spec");
            String email = req.getParameter("email");
            String mobno = req.getParameter("mobno");
            String password = req.getParameter("password");

            int id = Integer.parseInt(req.getParameter("id"));

            Doctor d = new Doctor(id, fullName, dob, qualification, spec, email, mobno, password);

            DoctorDao dao = new DoctorDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.updateDoctor(d)) {
                session.setAttribute("succMsg", "Doctor updated successfully.");
                resp.sendRedirect("admin/Doctor.jsp");
            } else {
                session.setAttribute("errorMsg", "Update failed, please try again.");
                resp.sendRedirect("admin/viewDoctor.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("errorMsg", "An error occurred: " + e.getMessage());
            resp.sendRedirect("admin/viewDoctor.jsp");
        }
    }
}

