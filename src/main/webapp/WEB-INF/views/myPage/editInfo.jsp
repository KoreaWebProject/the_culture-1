<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
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
					<span>${login.user_name}님<span> <a href="#" onclick="location.href='logout.do'">로그아웃</a> <a href="#"
							onclick="location.href='qna_main.do'">Q&A</a> <a href="#" onclick="location.href='mypage.do'">마이페이지</a>
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
					</ul></li>
				<li><a class="nav-link scrollto" href="#" onclick="location.href='geinfo.do?genrenm=무용'">무용</a></li>
				<li><a class="nav-link scrollto" href="#" onclick="location.href='geinfo.do?genrenm=서커스/마술'">서커스/마술</a></li>
				<li><a class="nav-link scrollto" href="#" onclick="location.href='geinfo.do?genrenm=복합'">복합</a></li>
			</ul>
		</nav>
	</div>
	<!-- ======= end menubar ======= -->
	<main class="container">
		<hr>
		<div class="d-flex justify-content-between">
			<h2 style="margin-bottom: 30px;">마이페이지</h2>
		</div>
		<!-- ======= Clients Section ======= -->
		<section id="clients" class="clients section-bg">
			<div class="container" data-aos="zoom-in">

				<div class="row">
					<div class="row" data-aos="fade-up" data-aos-delay="100">
						<div class=" col-12 d-flex justify-content-center ">
							<ul id="portfolio-flters">

								<li class="filter-active" data-filter=".filter-app"><img src="./resources/assets/img/clients/user.png" class="img-fluid" alt=""><a
									class="col-8" href="location.href='mypage.do'" style="margin-left: 10px;">정보수정</a></li>

								<li data-filter=".filter-card"><img src="./resources/assets/img/clients/comment.png" class="img-fluid" alt=""><a class="col-8"
									href="#" onclick="location.href='myQna.do?user_id=${login.user_id}'" style="margin-left: 10px;">후기내역</a></li>
								<li data-filter=".filter-web"><img src="./resources/assets/img/clients/star.png" class="img-fluid" alt=""><a class="col-8" href="#"
									style="margin-left: 10px;">즐겨찾기</a></li>
								<li data-filter=".filter-we"><img src="./resources/assets/img/clients/qna.png" class="img-fluid" alt=""><a class="col-8" href="#"
									style="margin-left: 10px;">문의내역</a></li>

								<li data-filter=".filter-w"><img src="./resources/assets/img/clients/unsub.png" class="img-fluid" alt=""><a class="col-8" href="#"
									style="margin-left: 10px;">회원탈퇴</a></li>
							</ul>
						</div>
					</div>
					<!-- <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
					<img src="./resources/assets/img/clients/user.png" class="img-fluid" alt=""><a href="#" style="margin-left: 10px;">정보수정</a>
				</div>

				<div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
					<img src="./resources/assets/img/clients/comment.png" class="img-fluid" alt=""><a href="#" style="margin-left: 10px;">후기내역</a>
				</div>

				<div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
					<img src="./resources/assets/img/clients/star.png" class="img-fluid" alt=""><a href="#" style="margin-left: 10px;">즐겨찾기</a>
				</div>

				<div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
					<img src="./resources/assets/img/clients/qna.png" class="img-fluid" alt=""><a href="#" style="margin-left: 10px;">문의내역</a>
				</div>

				<div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
					<img src="./resources/assets/img/clients/unsub.png" class="img-fluid" alt=""><a href="#" style="margin-left: 10px;">회원탈퇴</a>
				</div> -->
				</div>

			</div>
		</section>
		<!-- End Clients Section -->

		<section id="portfolio" class="portfolio">
			<div class="container" data-aos="fade-up">


				<!-- 	<div class="row" data-aos="fade-up" data-aos-delay="100">
				<div class="col-lg-12 d-flex justify-content-center">
					<ul id="portfolio-flters">
						<li data-filter="*" class="filter-active">All</li>
						<li data-filter=".filter-app">App</li>
						<li data-filter=".filter-card">Card</li>
						<li data-filter=".filter-web">Web</li>
					</ul>
				</div>
			</div> -->

				<div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">

					<div class="col-12 portfolio-item filter-app">
						<div class="portfolio-info">
							<div class="content row  d-flex justify-content-center ">
								<div class="col-12 container d-flex justify-content-center row">
									<div class="col-12 row" style="border: 2px solid #e2e2e2; padding: 20px 20px; margin-top: 25px; border-radius: 20px; width: 350px">
										<div class="d-flex justify-content-center" style="margin-top: 10px; font-weight: bold; font-size: 20px; color: #3b8af2;">회원정보수정</div>
										<form method="post">
											<div class="id_wrap" class="zip_code_wrap d-flex justify-content-evenly">
												<div class="id_name" style="margin-top: 20px; font-weight: bold; font-size: 12px;">아이디</div>
												<div class=" d-flex justify-content-between">
													<div class="col-12">
														<input id="user_id" class="form-control col" placeholder="아이디" value="${login.user_id}" disabled>
													</div>

												</div>

											</div>
											<div class="pw_wrap">
												<div class="pw_name" style="font-weight: bold; font-size: 12px; margin-top: 10px;">비밀번호</div>
												<input type="password" name="user_pw" class="form-control col" id="user_pw" placeholder="비밀번호">
											</div>
											<div class="pwck_wrap">
												<div class="pwck_name" style="font-weight: bold; font-size: 12px; margin-top: 10px;">비밀번호 확인</div>
												<input type="password" name="user_pwck" class="form-control col" id="user_pwck" placeholder="비밀번호 확인">
											</div>
											<div class="user_wrap">
												<div class="user_name" style="font-weight: bold; font-size: 12px; margin-top: 10px;">이름</div>
												<input name="user_name" class="form-control col" id="user_name" placeholder="이름" value="${login.user_name}">
											</div>
											<c:set var="birth" value="${ login.user_birth }" />
											<div class="birth_wrap">
												<div class="birth_name" style="font-weight: bold; font-size: 12px; margin-top: 10px;">생년월일</div>
												<div class="d-flex justify-content-evenly">
													<select class="form-select birth_year w-30" name="birth_year">
														<option value="년">년</option>

														<c:forEach var="i" begin="1900" end="2023">
															<option value="${i}" <c:if test="${fn:substring(birth, 0, 4) eq i}">selected</c:if>>${i}</option>
														</c:forEach>

													</select> <select class=" form-select birth_month justify-content-center" name="birth_month" style="margin-left: 10px;">
														<option value="월">월</option>
														<c:forEach var="i" begin="1" end="12">
															<c:choose>
																<c:when test="${i lt 10 }">
																	<option value="0${i}" <c:if test="${fn:substring(birth, 4, 6) eq i}">selected</c:if>>0${i}</option>
																</c:when>
																<c:otherwise>
																	<option value="${i}" <c:if test="${fn:substring(birth, 4, 6) eq i}">selected</c:if>>${i}</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select> <select class="form-select birth_day" name="birth_day" style="margin-left: 10px;">
														<option value="일">일</option>
														<c:forEach var="i" begin="1" end="31">
															<c:choose>
																<c:when test="${i lt 10 }">
																	<option value="0${i}" <c:if test="${fn:substring(birth, 6, 8) eq i}">selected</c:if>>0${i}</option>
																</c:when>
																<c:otherwise>
																	<option value="${i}" <c:if test="${fn:substring(birth, 6, 8) eq i}">selected</c:if>>${i}</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="gender_wrap">
												<div class="gender_name" style="font-weight: bold; font-size: 12px; margin-top: 10px;">성별</div>
												<div class="form-check form-check-inline">
													<input type="radio" id="gender_male" name="contact" class="contact" value="M">남자
												</div>
												<div class="form-check form-check-inline">
													<input type="radio" id="gender_female" name="contact" class="contact" value="F">여자
												</div>
											</div>

											<div class="mail_wrap">
												<div class="mail_name" style="font-weight: bold; font-size: 12px; margin-top: 10px;">이메일</div>
												<input id="search_text" class="form-control col" name="user_mail" type="text" placeholder="이메일" value="${ login.user_mail }">
											</div>

											<div class="addr_wrap">
												<div class="addr_name" style="font-weight: bold; font-size: 12px; margin-top: 10px;">우편번호</div>
												<div class="zip_code_wrap d-flex justify-content-evenly">
													<input id="user_zip_code" class="form-control col" name="user_zip_code" readonly="readonly" placeholder="우편번호" value="${ login.user_zip_code }">
													<button type="button" class="btn btn-primary " id="postButton" onclick="kakao_addr();" style="margin-left: 10px; margin-right: 20px;">주소찾기</button>
												</div>

												<div class="clearfix"></div>
											</div>

											<div class="" style="font-weight: bold; font-size: 12px; margin-top: 10px;">
												<input class="form-control col" id="user_addr1" name="user_addr1" placeholder="주소" style="font-size: 13px;" readonly="readonly" value="${ login.user_addr1 }" >
											</div>

											<div class="" style="font-weight: bold; font-size: 12px; margin-top: 10px;">
												<input class="form-control col" type="text" id="user_addr2" name="user_addr2" placeholder="상세주소" style="font-size: 13px;"  value="${ login.user_addr2 }">
											</div>

											<div class="d-flex justify-content-evenly">
												<input type="button" class="btn btn-primary col" style="margin-top: 10px;" value="수정하기" onclick="send(this.form);"> <input
													type="button" class="btn btn-danger col" style="margin-top: 10px; margin-left: 10px;" value="취소" onclick='history.go(-1)'>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-web">
						<img src="assets/img/portfolio/portfolio-2.jpg" class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>Web 3</h4>
							<p>Web</p>
							asdasdasd <a href="assets/img/portfolio/portfolio-2.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Web 3"><i
								class="bx bx-plus"></i></a> <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
						</div>
					</div>



					<div class="col-lg-4 col-md-6 portfolio-item filter-card">
						<img src="assets/img/portfolio/portfolio-4.jpg" class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>Card 2</h4>
							<p>Card</p>
							<a href="assets/img/portfolio/portfolio-4.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Card 2"><i
								class="bx bx-plus"></i></a> <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-web">
						<img src="assets/img/portfolio/portfolio-5.jpg" class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>Web 2</h4>
							<p>Web</p>
							<a href="assets/img/portfolio/portfolio-5.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Web 2"><i
								class="bx bx-plus"></i></a> <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
						</div>
					</div>



					<div class="col-lg-4 col-md-6 portfolio-item filter-card">
						<img src="assets/img/portfolio/portfolio-7.jpg" class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>Card 1</h4>
							<p>Card</p>
							<a href="assets/img/portfolio/portfolio-7.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Card 1"><i
								class="bx bx-plus"></i></a> <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-card">
						<img src="assets/img/portfolio/portfolio-8.jpg" class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>Card 3</h4>
							<p>Card</p>
							<a href="assets/img/portfolio/portfolio-8.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Card 3"><i
								class="bx bx-plus"></i></a> <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-web">
						<img src="assets/img/portfolio/portfolio-9.jpg" class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>Web 3</h4>
							<p>Web</p>
							<a href="assets/img/portfolio/portfolio-9.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Web 3"><i
								class="bx bx-plus"></i></a> <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-we">
						<img src="assets/img/portfolio/portfolio-9.jpg" class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>Web 3</h4>
							<p>Web</p>
							<a href="assets/img/portfolio/portfolio-9.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Web 3"><i
								class="bx bx-plus"></i></a> <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-w">
						<img src="assets/img/portfolio/portfolio-9.jpg" class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>Web 3</h4>
							<p>Web</p>
							<a href="assets/img/portfolio/portfolio-9.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Web 3"><i
								class="bx bx-plus"></i></a> <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- End Portfolio Section -->
		<!-- ======= myPage list ======= -->
		<div>
			<ul>
				<li><a href="#" onclick="location.href='mypage.do'">회원정보 수정</a></li>
				<li><a href="#" onclick="location.href='myReview.do?user_id=${login.user_id}'">나의 후기</a></li>
				<li><a href="#" onclick="location.href='favorite.do?user_id=${login.user_id}'">즐겨찾기</a></li>
				<li><a href="#" onclick="location.href='myQna.do?user_id=${login.user_id}'">나의 문의 내역</a></li>
				<li><a href="#" onclick="location.href='delInfo.do'">회원탈퇴</a></li>
			</ul>
		</div>
		<!-- ======= end myPage list ======= -->

		마이페이지 기본 첫화면

		<h2>회원정보 수정</h2>
		<form>
			<div>
				ID : ${ login.user_id }<input type="hidden" name="user_id" value="${ login.user_id }">
			</div>
			<div>
				PW : <input name="user_pw">
			</div>
			<div>
				<input type="button" value="확인" onClick="send(this.form)">
			</div>
		</form>

	</main>

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

	<!-- 회원정보 수정 스크립트 -->
	<script src="./resources/js/httpRequest.js"></script>

	<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
		function kakao_addr() {
			daum.postcode.load(function() {
				new daum.Postcode({
					oncomplete : function(data) {

						console.log(data); //뭐가 오는지 궁금하시나용

						let fullAddr = '';
						let extraAddr = '';

						//도로명 주소를 선택 시
						if (data.userSelectedType === 'R') {
							fullAddr = data.roadAddress;

							//법정동 명이 있을 시
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
						} else {
							fullAddr = data.jibunAddress;
						}

						//건물이름 있을 시
						if (data.buildingName !== '') {
							//빈값이 아니라면 즉,법정동명이 있으면 ',' + buildingName ,,,,, 빈값이라면 buildingName
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}

						fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')'
								: '');

						$('#user_zip_code').val(data.zonecode);
						$('#user_addr1').val(fullAddr);
						console.log('#user_zip_code');
						console.log(data.zonecode);
						console.log('#user_addr1');
						console.log(fullAddr);
					}
				}).open();
			})
		}

		function send(f) {

			let user_id = f.user_id.value;
			let user_pw = f.user_pw.value;
			let user_pwck = f.user_pwck.value;
			let user_name = f.user_name.value.trim();
			let birth_year = f.birth_year.value;
			let birth_month = f.birth_month.value;
			let birth_day = f.birth_day.value;
			let user_birth = birth_year + birth_month + birth_day;
			let user_mail = f.user_mail.value;
			let user_zip_code = f.user_zip_code.value;
			let user_addr1 = f.user_addr1.value.trim();
			let user_addr2 = f.user_addr2.value.trim();

			//pw유효성
			if (user_pw !== user_pwck || user_pw == null) {
				alert("비밀번호가 일치하지 않습니다");
				return;
			}

			//빈칸 존재 확인
			if (user_name == null || user_birth.trim() == null
					|| user_mail.trim() == null || user_zip_code.trim() == null
					|| user_addr1.trim() == null) {
				alert("빈칸을 채워주세요");
				return;
			}

			//라디오버튼 유효성
			var user_gender = $('input:radio[name="contact"]:checked').val();
			if (user_gender == null) {
				alert("성별을 선택하세요");
				return;
			}

			var url = "updateInfo.do";
			var param = "user_id=" + user_id + "&user_pw=" + user_pw
					+ "&user_name=" + user_name + "&user_birth=" + user_birth
					+ "&user_gender=" + user_gender + "&user_mail=" + user_mail
					+ "&user_zip_code=" + user_zip_code + "&user_addr1="
					+ user_addr1 + "&user_addr2=" + user_addr2;
			sendRequest(url, param, resFn, "get");
		}

		function resFn() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				//data = "fail" 또는 data = "success"
				var data = xhr.responseText;

				if (data == 'success') {
					alert("회원 정보 수정 성공");
				}
				location.href = "editInfo.do";//되돌아오기
			}
		}
	</script>


</body>
</html>