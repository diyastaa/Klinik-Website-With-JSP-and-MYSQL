package com.doctor.servlet;

import java.io.IOException;
import java.io.InputStream;

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

@WebServlet("/respon")
@MultipartConfig
public class Respon extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            int did = Integer.parseInt(req.getParameter("did"));
            String comm = req.getParameter("comm");

            KonsultasiDAO dao = new KonsultasiDAO(DBConnect.getConn());

            // Mengambil berkas resep dari formulir
            Part resepPart = req.getPart("resepfoto");
            InputStream resepStream = resepPart.getInputStream();

            HttpSession session = req.getSession();

            if (dao.updateCommentStatus(id, did, comm, resepStream)) {
                session.setAttribute("succMsg", "Comment and Recipe Updated");
                resp.sendRedirect("doctor/konsul.jsp");
            } else {
                session.setAttribute("errorMsg", "Something wrong on server");
                resp.sendRedirect("doctor/konsul.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
