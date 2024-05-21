<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Konsultasi</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("component/img/hos1.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img style=border-radius:40px alt="" src="component/img/hos2_1.jpg" width="400" height="500">
			</div>

			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">Form Konsultasi</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form class="row g-3" action="appKonsultasi" method="post" enctype="multipart/form-data">

							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Nama Lengkap</label> <input
									required type="text" class="form-control" name="fullname">
							</div>

							<div class="col-md-6">
								<label>Jenis Kelamin</label> <select class="form-control" name="gender"
									required>
									<option value="male">Laki-laki</option>
									<option value="female">Perempuan</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Umur</label> <input
									required type="number" class="form-control" name="age">
							</div>


							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									required type="email" class="form-control" name="email">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">No Telp</label> <input
									maxlength="10" required type="number" class="form-control"
									name="phno">
							</div>


							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Dokter</label> <select
									required class="form-control" name="doct">
									<option value="">--select--</option>

									<%
									DoctorDao dao = new DoctorDao(DBConnect.getConn());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)
									</option>
									<%
									}
									%>




								</select>
							</div>

							<div class="col-md-12">
								<label>Keluhan</label>
								<textarea required name="keluhan" class="form-control" rows="3"
									cols=""></textarea>
							</div>

							<c:if test="${empty userObj }">
								<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-primary">Submit</a>
							</c:if>

							<c:if test="${not empty userObj }">
								<button class="col-md-6 offset-md-3 btn btn-primary">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@include file="component/footer.jsp"%>

</body>
</html>