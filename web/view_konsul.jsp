<%@page import="java.util.Base64"%> <!-- Import Base64 -->
<%@page import="java.nio.charset.StandardCharsets"%> <!-- Import StandardCharsets -->
<%@page import="java.util.Base64.Decoder"%> <!-- Import Base64 Decoder -->
<%@page import="java.io.UnsupportedEncodingException"%> <!-- Import UnsupportedEncodingException -->

<%@page import="com.entity.Konsultasi"%>
<%@page import="com.dao.KonsultasiDAO"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lihat Konsultasi</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
    background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
        url("img/hospital.jpg");
    height: 20vh;
    width: 100%;
    background-size: cover;
    background-repeat: no-repeat;
}
</style>
</head>
<body>
    <c:if test="${empty userObj }">
        <c:redirect url="user_login.jsp"></c:redirect>
    </c:if>
    <%@include file="component/navbar.jsp"%>

    <div class="container-fulid backImg p-5">
        <p class="text-center fs-2 text-white"></p>
    </div>
    <div class="container p-3">
        <div class="row">
            <div class="col-md-9">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 fw-bold text-center text-primary">Konsultasi</p>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Nama Lengkap</th>
                                    <th scope="col">Jenis Kelamin</th>
                                    <th scope="col">Umur</th>
                                    <th scope="col">Keluhan/Sakit</th>
                                    <th scope="col">Nama Dokter</th>
                                    <th scope="col">Respon/saran</th>
                                    <th scope="col">Resep</th> <!-- Add this column header -->
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                User user = (User) session.getAttribute("userObj");
                                KonsultasiDAO dao = new KonsultasiDAO(DBConnect.getConn());
                                DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                                List<Konsultasi> list = dao.getAllKonsultasiByLoginUser(user.getId());
                                for (Konsultasi ap : list) {
                                    Doctor d = dao2.getDoctorById(ap.getKDoctorId());
                                %>
                                <tr>
                                    <th><%=ap.getKFullName()%></th>
                                    <td><%=ap.getKGender()%></td>
                                    <td><%=ap.getKAge()%></td>
                                    <td><%=ap.getKeluhan()%></td>
                                    <td><%=d.getFullName()%></td>
                                    <td>
                                        <%
                                        if ("Pending".equals(ap.getRespon())) {
                                        %>
                                        <a href="#" class="btn btn-sm btn-warning">Pending</a>
                                        <%
                                        } else {
                                        %>
                                        <%=ap.getRespon()%>
                                        <%
                                        }
                                        %>
                                    </td>
                                    <!-- Display Resep -->
                                    <td>
                                        <%
                                        byte[] resepArray = ap.getResep();
                                        if (resepArray != null && resepArray.length > 0) {
                                            String encodedResep = Base64.getEncoder().encodeToString(resepArray);
                                        %>
                                            <a href="data:image/png;base64, <%= encodedResep %>"
                                                class="btn btn-sm btn-success" target="_blank">View Resep</a>
                                        <%
                                        } else {
                                        %>
                                            <span>No Resep</span>
                                        <%
                                        }
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

            <div class="col-md-3 p-3">
                <img alt="" src="img/doct.jpg">
            </div>
        </div>
    </div>
</body>
</html>
