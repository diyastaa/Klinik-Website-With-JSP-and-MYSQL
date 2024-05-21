<%@page import="com.db.DBConnect" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
 <%@include file="component/allcss.jsp" %>
 <script src="https://kit.fontawesome.com/d8bd919f93.js" crossorigin="anonymous"></script>
 <style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

  /* Button Styles */
  a.button-link {
    text-decoration: none;
  }

  button {
    display: inline-block;
    padding: 12px 24px;
    font-size: 16px;
    font-weight: bold;
    text-transform: uppercase;
    cursor: pointer;
    border: none;
    border-radius: 4px;
    background-color: #3498db;
    color: #fff;
    transition: background-color 0.3s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  }

  button:hover {
    background-color: #2980b9;
  }
  .blur-image {
  filter: blur(1.5px);

</style>
<script class="test" type="text/javascript">window.$crisp=[];window.CRISP_WEBSITE_ID="8c420994-332e-4097-a663-98c59464bbc8";(function(){d=document;s=d.createElement("script");s.src="https://client.crisp.chat/l.js";s.async=1;d.getElementsByTagName("head")[0].appendChild(s);})();</script>

 
</head>
<body>

</body>
<%@include file="component/navbar.jsp" %>




<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="component/img/rumahsakit.png" class="blur-image d-block w-100" alt="..." height="500px">
   
    </div>
   <div class="carousel-caption">
          <h3>Anda Mempunyai Keluhan?</h3>
          <p>Buat Janji/Konsultasi dengan dokter sekarang</p>
<a href="user_appointment.jsp" class="button-link">
    <button>Buat Janji</button>
   
</a>
          <a href="konsul.jsp" class="button-link">
    <button>Konsultasi</button>
   
</a>


        </div>
    <div class="carousel-item">
      <img src="component/img/hos2.jpg" class="blur-image d-block w-100" alt="..." height="500px">
    <div class="carousel-caption">
          <h3>Anda Mempunyai Keluhan?</h3>
          <p>Buat Janji/Konsultasi dengan dokter sekarang</p>
<a href="user_appointment.jsp" class="button-link">
    <button>Buat Janji</button>
   
</a>
          <a href="konsul.jsp" class="button-link">
    <button>Konsultasi</button>
   
</a>
    </div>  
       </div>
    <div class="carousel-item">
      <img src="component/img/hos1.jpg" class="blur-image d-block w-100" alt="..." height="500px">
    <div class="carousel-caption">
          <h3>Anda Mempunyai Keluhan?</h3>
          <p>Buat Janji/Konsultasi dengan dokter sekarang</p>
<a href="user_appointment.jsp" class="button-link">
    <button>Buat Janji</button>
   
</a>
          <a href="konsul.jsp" class="button-link">
    <button>Konsultasi</button>
   
</a>
    </div> 
  
      
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<div class="container p-3">
		<p class="text-center fs-2 ">ABOUT US</p>

		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Buat janji dengan dokter</p>
								<p>Membuat janji dengan dokter secara online</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Free Konsultasi</p>
								<p>Memeberikan layanan konsultasi gratis</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Layanan Kesehatan</p>
								<p>Untuk pencegahan, diagnosa, pengobatan dan perawatan berkelanjutan</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Dokter Bersahabat</p>
								<p>Kami memiliki Dokter yang bersahabat dan ramah dan teruji, tersertifikat. jangan ragu</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
                            <img style=border-radius:50px alt="" width="400px" height="400" border-radius="50"  src="component/img/hosd.jpg" >
			</div>

		</div>
	</div>

	<hr>

	<div class="container p-2">
		<p class="text-center fs-2 ">OUR TEAM</p>
		
		<div class="row">
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="component/img/doc.png" width="250px" height="350px">
						<p class="fw-bold fs-5">Reza Hafiz</p>
						<p class="fs-7">(Ketua Kelompok)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="component/img/doc1.png" width="185px" height="350px">
						<p class="fw-bold fs-5">Marcellinus Ryan</p>
						<p class="fs-7">(Anggota)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="component/img/doc2.png" width="250px" height="350px">
						<p class="fw-bold fs-5">Bernadi Shyudha</p>
						<p class="fs-7">(Anggota)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="component/img/doc3.png" width="270px" height="350px">
						<p class="fw-bold fs-5">Agung Nugraha Diyasta</p>
						<p class="fs-7">(Anggota)</p>
					</div>
				</div>
			</div>

		</div>

	</div>



<%@include file="component/footer.jsp" %>


</html>
