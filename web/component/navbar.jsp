<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #FFFFFF">
	<div class="container-fluid">
		 <a class="navbar-brand" href="index.jsp"><img src="component/img/logo1.jpg" width="50"> KLINIK SOLUSI MEDIKA</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<c:if test="${empty userObj }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="admin_login.jsp"><i
							class="fas fa-sign-in-alt"></i> ADMIN</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="doctor_login.jsp">DOKTER</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_appointment.jsp">APPOINTMENT</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="konsul.jsp">KONSULTASI</a></li>
                                                
                                                
                                                <li class="nav-item"><a class="nav-link active"
                                                                
						aria-current="page" href="user_login.jsp">USER</a></li>

				</c:if>




				<c:if test="${not empty userObj }">
                                    <li class="nav-item"><a class="nav-link active"
						aria-current="page" href="konsul.jsp">KONSULTASI</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_appointment.jsp">APPOINTMENT</a></li>
                                    <li class="nav-item dropdown">
                                     <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    LIHAT
                                    </a>
                                                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="view_konsul.jsp">KONSULTASI</a></li>
                                    <li><a class="dropdown-item" href="view_appointment.jsp">APPOINTMENT</a></li>
                                  </ul>
                                </li>


					<div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="fa-solid fa-circle-user"></i> ${userObj.fullName }
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
							<li><a class="dropdown-item" href="userLogout">Logout</a></li>
							
						</ul>
					</div>


					

				</c:if>





			</ul>
		</div>
	</div>
</nav>