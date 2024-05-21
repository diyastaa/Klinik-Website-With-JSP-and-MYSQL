package com.user.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.KonsultasiDAO;
import com.db.DBConnect;
import com.entity.Konsultasi;

@WebServlet("/appKonsultasi")
@MultipartConfig(maxFileSize = 16177215) // 16 MB
public class KonsultasiServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int kuserId = Integer.parseInt(req.getParameter("userid"));
        String kfullname = req.getParameter("fullname");
        String kgender = req.getParameter("gender");
        String kage = req.getParameter("age");
        String kemail = req.getParameter("email");
        String kphno = req.getParameter("phno");
        int kdoctor_id = Integer.parseInt(req.getParameter("doct"));
        String keluhan = req.getParameter("keluhan");

        InputStream resepContent = null;

        try {
            Part filePart = req.getPart("resep");
            if (filePart != null) {
                resepContent = filePart.getInputStream();
            }
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }

        Konsultasi ap = new Konsultasi(kuserId, kfullname, kgender, kage, kemail, kphno, kdoctor_id,
                keluhan, "Pending");

        KonsultasiDAO dao = new KonsultasiDAO(DBConnect.getConn());
        HttpSession session = req.getSession();

        if (dao.addKonsultasi(ap, resepContent)) {
            session.setAttribute("succMsg", "Konsultasi Terkirim, Cek Email!");
            resp.sendRedirect("konsul.jsp");
        } else {
            session.setAttribute("errorMsg", "Something wrong on the server");
            resp.sendRedirect("konsul.jsp");
        }
    }
}
