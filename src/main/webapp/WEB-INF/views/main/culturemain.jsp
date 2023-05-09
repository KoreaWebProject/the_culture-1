<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>THE CULTURE</title>

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="./resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="./resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="./resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="./resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="./resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="./resources/assets/css/style.css?ver=1" rel="stylesheet">


<!-- =======================================================
  * Template Name: BizLand
  * Updated: Mar 10 2023 with Bootstrap v5.2.3
  * Template URL: https://bootstrapmade.com/bizland-bootstrap-business-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->

<script>
	function classToggle() {
		var el = document.querySelector('.icon-cards__content');
		el.classList.toggle('step-animation');
	}

	function info(index) {

		document.getElementById('info' + index).submit();
	}

	function update(index) {

		document.getElementById('update' + index).submit();
	}
</script>

</head>

<body>

	<!-- ======= Top Bar ======= -->
	<section id="topbar" class="d-flex align-items-center">
		<div class="container d-flex justify-content-end">
			<div class="social-links d-none d-md-flex align-items-end">
				<c:if test="${empty login.user_id}">
					<a href="#" onclick="location.href='login_main.do'">로그인</a>
					<a href="#" onclick="location.href='join.do'">회원가입</a>
					<a href="#" onclick="location.href='qna_main.do'">Q&A</a>
				</c:if>

				<c:if test="${not empty login.user_id}">
					<span>${login.user_name}님</span> 
					<a href="#" onclick="location.href='logout.do'">로그아웃</a> 
					<a href="#" onclick="location.href='qna_main.do'">Q&A</a> 
					<a href="#" onclick="location.href='mypage.do?user_id=${login.user_id}'">마이페이지</a>
				</c:if>

			</div>
		</div>
	</section>

	<!-- ======= Header ======= -->
	<header id="header" class="d-flex align-items-center">
		<div class="container d-flex align-items-center justify-content-between">
			<a href="#" onclick="location.href='culture.do'" class="logo"><img src="resources/img/the_culture_logo.png" alt="" width="130px"></a>
			<nav class="navbar">
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-primary" type="submit">Search</button>
				</form>
			</nav>
		</div>
	</header>
	<!-- End Header -->

	<!-- ======= menubar ======= -->
	<div id="menubar" class="navbar container justify-content-left">
		<nav class="navbar">
			<ul>
				<li><a class="nav-link scrollto" href="#" onclick="location.href='geinfo.do?genrenm=연극'">연극</a></li>
				<li><a class="nav-link scrollto" href="#" onclick="location.href='geinfo.do?genrenm=뮤지컬'">뮤지컬</a></li>
				<li class="dropdown"><a href="#" onclick="location.href='geinfo.do?genrenm=음악'"><span>음악</span> <i class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="#" onclick="location.href='geinfo.do?genrenm=서양음악(클래식)'">서양음악(클래식)</a></li>
						<li><a href="#" onclick="location.href='geinfo.do?genrenm=한국음악(국악)'">한국음악(국악)</a></li>
						<li><a href="#" onclick="location.href='geinfo.do?genrenm=대중음악'">대중음악</a></li>
					</ul>
				</li>
				<li><a class="nav-link scrollto" href="#" onclick="location.href='geinfo.do?genrenm=무용'">무용</a></li>
				<li><a class="nav-link scrollto" href="#" onclick="location.href='geinfo.do?genrenm=서커스/마술'">서커스/마술</a></li>
				<li><a class="nav-link scrollto" href="#" onclick="location.href='geinfo.do?genrenm=복합'">복합</a></li>

			</ul>

		</nav>

	</div>
	<!-- ======= end menubar ======= -->
	
	
	<main id="main">

		<div class="container">
			<hr>
			<p id="up">실시간 랭킹</p>
		</div>
		<figure class="icon-cards mt-3 container">
			<div class="icon-cards__content">
				<c:forEach var="vo" items="${ rank }" begin="0" end="4" varStatus="status">
					<div class="icon-cards__item d-flex align-items-center container">
						
						<a href="#" onclick="info('${vo.play_id }');">
							<form action="info.do" id="info${vo.play_id }">
								<input type="hidden" name="play_id" value="${vo.play_id }">
								<img src="${vo.play_poster}" width="250px"  style="position: relative;"/>
								<div class="" style="position: absolute; top: -80px; left:100px; font-size: 30px; font-family: 'Cooper';">NO.${status.count}</div>
							</form>
						</a>
					</div>
				</c:forEach>
			</div>
		</figure>

		<!-- ======= Featured Services Section ======= -->
		<section id="featured-services" class="featured-services">
			<div class="container" data-aos="fade-up">
				<hr>
				<div class="row ">
					<p id="up">오늘의 추천</p>
					<div class="containers">
						<c:forEach var="vo" items="${ today }">
							<div class="cards">
								<div class="Box">
									<c:choose>
										<c:when test="${login.user_role_id eq 2}">
											<a href="#" onclick="update('${vo.play_id }');">
												<form action="update.do" id="update${vo.play_id }">
													<input type="hidden" name="play_id" value="${vo.play_id }">
													<img src="${vo.play_poster}" />
												</form>
											</a>
										</c:when>
										<c:when test="${login.user_role_id eq 0}">
											<a href="#" onclick="info('${vo.play_id }');">
												<form action="info.do" id="info${vo.play_id }">
													<input type="hidden" name="play_id" value="${vo.play_id }">
													<img src="${vo.play_poster}" />
												</form>
											</a>
										</c:when>
										<c:otherwise>
											<img src="${vo.play_poster}" />
										</c:otherwise>
									</c:choose>
								</div>
								<div class="details">
									<h2>${vo.play_prfnm}</h2>
									<p>장소 : ${vo.play_locnm}</p>
									<p>기간 : ${vo.play_from} ~ ${vo.play_to}</p>
									<p>장르 : ${vo.play_genrenm}</p>
									<p>공연상태 : ${vo.play_prfstate}</p>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
		<!-- End Featured Services Section -->
		
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-6 footer-contact">
						<h3>
							THE CULTURE<span>.</span>
						</h3>


						<div class="container py-4">
							<div class="copyright">
								&copy; Copyright <strong><span>THE CULTURE</span></strong>. All Rights Reserved
							</div>
							<div class="credits d-flex align-item-left">
								<p>park sang soo</p>
								<p>kim dong joon</p>
								<p>kim si yoon</p>
								<p>kim yu mi</p>
								Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>	
	</footer>
	<!-- End Footer -->


	<div id="preloader"></div>
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="./resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="./resources/assets/vendor/aos/aos.js"></script>

	<script src="./resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="./resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="./resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="./resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script src="./resources/assets/vendor/php-email-form/validate.js"></script>
	<!-- Template Main JS File -->
	<script src="./resources/assets/js/main.js"></script>


</body>

</html>
