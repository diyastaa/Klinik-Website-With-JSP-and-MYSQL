<%@page import="com.entity.Konsultasi"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.KonsultasiDAO"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Konsultasi Pasien</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

</style>
</head>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>


	<%@include file="navbar.jsp"%>
        
	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Konsultasi</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-primary">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<table class="table" >
							<thead>
								<tr>
									<th scope="col">Nama Lengkap</th>
									<th scope="col">Jenis K.elamin</th>
                                                                        <th scope="col">Umur</th>
									<th scope="col">Email</th>
									<th scope="col">No Hp</th>
									<th scope="col">Keluhan/Sakit</th>
									<th scope="col">Respon</th>
									<th scope="col">Tindakan</th>
								</tr>
							</thead>
							<tbody>
								<%
								Doctor d = (Doctor) session.getAttribute("doctObj");
								KonsultasiDAO dao = new KonsultasiDAO(DBConnect.getConn());
								List<Konsultasi> list = dao.getAllKonsultasiByDoctorLogin(d.getId());
								for (Konsultasi ap : list) {
								%>
								<tr>
									<th><%=ap.getKFullName()%></th>
									<td><%=ap.getKGender()%></td>
									<td><%=ap.getKAge()%></td>
									<td><%=ap.getKEmail()%></td>
									<td><%=ap.getKPhNo()%></td>
									<td><%=ap.getKeluhan()%></td>
									<td><%=ap.getRespon()%></td>
									<td>
										<%
										if ("Pending".equals(ap.getRespon())) {
										%> 
										<a href="respon.jsp?id=<%=ap.getId()%>"
										class="btn btn-primary btn-sm">Balas</a>
										 <%
										 } else {
										 %> 
										 <a href="#" class="btn btn-primary btn-sm disabled">Balas</a> 
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

		</div>
	</div>



</body>
</html>