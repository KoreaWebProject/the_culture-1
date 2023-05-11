<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<script>
	//로그인
</script>
<style>
.rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 10px;
	height: 25px;
	background-repeat: no-repeat;
	background-size: 10px 25px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rate_radio:checked+label {
	background-color: #fc3;
}

.rate_radio2+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 10px;
	height: 25px;
	background-repeat: no-repeat;
	background-size: 10px 25px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rate_radio2:checked+label {
	background-color: #fc3;
}
</style>
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
							onclick="location.href='qna_main.do'">Q&A</a> <a href="#" onclick="location.href='mypage.do?user_id=${login.user_id}'">마이페이지</a>
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

								<li data-filter=".filter-app" id="1" class="filter-active"><img src="./resources/assets/img/clients/user.png" class="img-fluid" alt=""><a
									class="col-8" href="#" style="margin-left: 10px;">정보수정</a></li>

								<li data-filter=".filter-card" id="2"><img src="./resources/assets/img/clients/comment.png" class="img-fluid" alt=""> <a
									class="col-8" href="#" style="margin-left: 10px;">후기내역</a></li>
								<li data-filter=".filter-web" id="3"><img src="./resources/assets/img/clients/star.png" class="img-fluid" alt=""><a class="col-8"
									href="#" style="margin-left: 10px;">즐겨찾기</a></li>
								<li data-filter=".filter-we" id="4"><img src="./resources/assets/img/clients/qna.png" class="img-fluid" alt=""><a class="col-8"
									href="#" style="margin-left: 10px;" onclick="myQna('${login.user_id}');">문의내역</a></li>

								<li data-filter=".filter-w" id="5"><img src="./resources/assets/img/clients/unsub.png" class="img-fluid" alt=""><a class="col-8"
									href="#" style="margin-left: 10px;">회원탈퇴</a></li>
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
					<div class="portfolio-info" id="modify">
						<form class="col-12 d-flex justify-content-center">
							<div class="content row  d-flex justify-content-center ">
								<div class="col container d-flex justify-content-center row">
									<div class="col-12" style="border: 2px solid #e2e2e2; padding: 20px 20px; margin-top: 25px; border-radius: 20px; width: 400px;">
										<form>
											<input class="form-control col-12" name="user_id" type="text" placeholder="아이디" style="margin-top: 20px;" value="${ login.user_id }"
												disabled> <input class="form-control col-12" name="user_pw" type="password" placeholder="비밀번호" style="margin-top: 20px;">

											<input type="button" class="btn btn-primary col-12" style="margin-top: 20px;" onclick="send(this.form);" value="확인">
										</form>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="portfolio-info" id="modifyab" style="display: none;">
						<div class="content row  d-flex justify-content-center">
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
												<input id="user_zip_code" class="form-control col" name="user_zip_code" readonly="readonly" placeholder="우편번호"
													value="${ login.user_zip_code }">
												<button type="button" class="btn btn-primary " id="postButton" onclick="kakao_addr();" style="margin-left: 10px; margin-right: 20px;">주소찾기</button>
											</div>

											<div class="clearfix"></div>
										</div>

										<div class="" style="font-weight: bold; font-size: 12px; margin-top: 10px;">
											<input class="form-control col" id="user_addr1" name="user_addr1" placeholder="주소" style="font-size: 13px;" readonly="readonly"
												value="${ login.user_addr1 }">
										</div>

										<div class="" style="font-weight: bold; font-size: 12px; margin-top: 10px;">
											<input class="form-control col" type="text" id="user_addr2" name="user_addr2" placeholder="상세주소" style="font-size: 13px;"
												value="${ login.user_addr2 }">
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





				<div class="col-12 portfolio-item filter-card">
					<div class="portfolio-info">
						<c:forEach var="vo" items="${reple_list}">

							<div class="container row d-flex justify-content-center">
								<c:if test="${ vo.reple_remove_lev eq 0 }">
									<div class="col-8"
										style="border: solid black 3px; margin-top: 20px; position: relative; padding-bottom: 50px; border-radius: 0px 0px 60px 0px">
										<img style="width: 50px; top: 3px; left: 10px; position: absolute;" src="${vo.play_poster }" onclick="location.href='info.do?play_id=${vo.play_id}'">
										<a href="#" onclick="location.href='info.do?play_id=${vo.play_id}'"><div style="top: 5px; left: 63px; position: absolute; font-size: 13px;">"${vo.play_prfnm }"</div></a>

										<div style="top: 23px;; left: 55px; position: relative;">
											<c:forEach var="i" begin="1" end="10">
												<c:choose>
													<c:when test="${i % 2 eq 0 }">
														<c:choose>
															<c:when test="${vo.reple_rating ge i / 2.0}">
																<input type="checkbox" style="visibility: hidden; position: absolute;" name="rating" id="rating${i}_${vo.reple_id}" value="${i}"
																	class="rate_radio2" title="${i}점" checked="checked" disabled="disabled">
																<label for="rating${i}_${vo.reple_id}" style="background-image: url('./resources/img/starrate_r.png');"></label>
															</c:when>
															<c:otherwise>
																<input type="checkbox" style="visibility: hidden; position: absolute;" name="rating" id="rating${i}_${vo.reple_id}" value="${i}"
																	class="rate_radio2" title="${i}점" disabled="disabled">
																<label for="rating${i}_${vo.reple_id}" style="background-image: url('./resources/img/starrate_r.png');"></label>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${vo.reple_rating ge i / 2.0}">
																<input type="checkbox" style="visibility: hidden; position: absolute;" name="rating" id="rating${i}_${vo.reple_id}" value="${i}"
																	class="rate_radio2" title="${i}점" checked="checked" disabled="disabled">
																<label for="rating${i}_${vo.reple_id}" style="background-image: url('./resources/img/starrate_l.png');"></label>
															</c:when>
															<c:otherwise>
																<input type="checkbox" style="visibility: hidden; position: absolute;" name="rating" id="rating${i}_${vo.reple_id}" value="${i}"
																	class="rate_radio2" title="${i}점" disabled="disabled">
																<label for="rating${i}_${vo.reple_id}" style="background-image: url('./resources/img/starrate_l.png');"></label>
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</div>
										<div style="top: 50px; left: 65px; position: absolute; font-size: 13px;">
											<span>${vo.user_id} </span><span style="color: #c1c1c1;">| ${vo.reple_regdate}</span>
										</div>

										<div style="top: 25px; right: 40px; position: absolute;">
											<c:choose>
												<c:when test="${vo.good_check eq 1}">
													<button id="${vo.reple_id}" value="1" onclick="good('${vo.reple_id}','${vo.play_id}')"
														style="border: #c1c1c1 1px solid; background: #c1c1c1; width: 60px; border-radius: 10px; padding: 3px 5px;">
														<img style="padding-bottom: 5px;" width="17px;" src="./resources/assets/img/like.png"> <span name="${vo.reple_id}">${vo.reple_good }</span>
													</button>
												</c:when>
												<c:when test="${vo.good_check eq 0}">
													<button id="${vo.reple_id}" value="0" onclick="good('${vo.reple_id}','${vo.play_id}')"
														style="border: #c1c1c1 1px solid; background: none; width: 60px; border-radius: 10px; padding: 3px 5px;">
														<img style="padding-bottom: 5px;" width="17px;" src="./resources/assets/img/like.png"> <span name="${vo.reple_id}">${vo.reple_good }</span>
													</button>
												</c:when>
											</c:choose>
										</div>

										<div style="top: 43px; left: 10px; position: relative;">
											<pre id="ba" style="word-wrap: break-word; overflow: auto; white-space: pre-wrap; padding-top: 20px; padding-right: 15px; word-break: keep-all;">${vo.reple_contents}</pre>
										</div>
										<c:if test="${login.user_id eq vo.user_id or login.user_role_id eq 2}">
											<div style="bottom: 5px; right: 60px; position: absolute;">
												<input class="btn btn-outline-secondary" style="height: 27px; width: 50px; font-size: 8px;" type="button" value="삭제"
													onclick="location.href='repledel.do?reple_id=${vo.reple_id}'">
											</div>
										</c:if>
									</div>
								</c:if>
								<c:if test="${ vo.reple_remove_lev eq 1 }">
									<div class="col-8 " style="border: solid black 3px; margin-top: 20px; border-radius: 0px 0px 60px 0px;">

										<div class="d-flex justify-content-center align-items-center" style="font-size: 20px; font-weight: bold; height: 80px;">삭제된 후기 입니다.</div>
									</div>
								</c:if>
							</div>
						</c:forEach>

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









				<div class="col-12 portfolio-item filter-we">
					<div class="portfolio-info">
						<table>
							<thead>
								<tr>
									<th style="text-align: center">NO</th>
									<th style="text-align: center">제목</th>
									<th style="text-align: center">이름</th>
									<th style="text-align: center">진행상황</th>
									<th style="text-align: center">등록일</th>
									<th style="text-align: center">공개여부</th>

								</tr>
							</thead>
							<tbody style="text-align: center">
								<c:forEach var="vo" items="${ list }">

									<tr>
										<%-- <td>${vo.qna_id}</td>
												<c:if test="${ login.user_id eq vo.user_id and login.user_role_id eq 0}">
													<th><a href="myQnaView.do?qna_id=${vo.qna_id}&page=${param.page}">${vo.qna_title}</a></th>
												</c:if>
												<c:if test="${ login.user_id ne vo.user_id and login.user_role_id eq 0 and vo.qna_public_lev eq 1}">
													<th><a href="myQnaView.do?qna_id=${vo.qna_id}&page=${param.page}">${vo.qna_title}</a></th>
												</c:if>
												<c:if test="${ login.user_id ne vo.user_id and login.user_role_id eq 0 and vo.qna_public_lev eq 0}">
													<th>${vo.qna_title}</th>
												</c:if>
												<c:if test="${ empty login.user_id}">
													<th>${vo.qna_title}</th>
												</c:if> --%>

										<td>${vo.qna_id}</td>
										<c:if test="${ login.user_id eq vo.user_id and login.user_role_id eq 0 and vo.qna_status ne 0}">
											<th><a href="myQnaView.do?qna_id=${vo.qna_id}&page=${param.page}">${vo.qna_title}</a></th>
										</c:if>
										<c:if test="${login.user_id eq vo.user_id and login.user_role_id eq 0 and vo.qna_status ne 1}">
											<th><a href="myQnaUpdate.do?qna_id=${vo.qna_id}&page=${param.page}">${vo.qna_title}</a></th>
										</c:if>
										<td>${vo.user_id}</td>
										<c:if test="${ vo.qna_status eq 0 }">
											<td style="color: red;">처리중</td>
										</c:if>
										<c:if test="${ vo.qna_status ne 0 }">
											<td style="color: blue;">답변완료</td>
										</c:if>
										<td>${vo.qna_regdate}</td>
										<c:if test="${ vo.qna_public_lev eq 0 }">
											<td style="color: red;">비공개</td>
										</c:if>
										<c:if test="${ vo.qna_public_lev eq 1 }">
											<td style="color: blue;">공개</td>
										</c:if>
									</tr>


								</c:forEach>
							</tbody>
						</table>

						<div align="center" style="font-size: 20px; margin-top: 20px;">${ pageMenu }</div>
					</div>
				</div>

				<div class="col-12 portfolio-item filter-w row">
					<div class="portfolio-info d-flex justify-content-center ">
						<div class="col-9 ">
							<h4>・회원탈퇴</h4>
							<div>
								<div style="border: solid #c1c1c1 2px; padding: 20px; margin-bottom: 10px;">
									<h4 style="color: red;">
										회원탈퇴 시 개인정보 및 THE CULTURE에서 만들어진 모든 데이터는 삭제됩니다.<br> (단, 아래 항목은 표기된 법률에 따라 특정 기간 동안 보관됩니다.)
									</h4>
									1. 계약 또는 청약철회 등에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 / 보존 기간 : 5년 <br>2. 대금결제 및 재화 등의 공급에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 / 보존
									기간 : 5년 <br>3. 전자금융 거래에 관한 기록 보존 이유 : 전자금융거래법 보존 기간 / 5년 <br>4. 소비자의 불만 또는 분쟁처리에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 보존 기간 / 3년 <br>5.
									신용정보의 수집/처리 및 이용 등에 관한 기록 보존 이유 : 신용정보의 이용 및 보호에 관한 법률 보존기간 / 3년
								</div>
								<h4>・유의사항</h4>
								<div style="border: solid #c1c1c1 2px; padding: 18px; font-size: 14px; margin-bottom: 10px;">- 회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없으며, 회원탈퇴 진행
									시 해당 아이디는 영구적으로 삭제되어 재가입이 불가합니다.</div>
								<form action="userDel.do">
									<div style="font-size: 14px; margin-bottom: 20px;">
										<input type="checkbox" name="agree" value="agree"> 해당내용을 모두 확인했으며, 회원탈퇴에 동의합니다.
									</div>
									<div>
										<input type="hidden" name="user_id" value="${ login.user_id }">
									</div>
									<div>
										<input type="hidden" name="ori_user_pw" value="${ login.user_pw }">
									</div>
									<div class="d-flex justify-content-start row">
										・비밀번호 확인 : <input class="form-control " type="password" name="user_pw" style="width: 300px; height: 25px; margin-left: 10px;">
									</div>
									<div class="d-flex justify-content-center" style="margin-top: 20px;">
										<input type="button" class="btn btn-outline-secondary" value="탈퇴하기" onClick="del(this.form);">
									</div>
								</form>


							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

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

	<!-- send function -->
	<script src="./resources/js/httpRequest.js"></script>

	<script>
		function send(f) {
			let user_id = f.user_id.value;
			let user_pw = f.user_pw.value;

			var url = "checkInfo.do";

			//encodeURIComponent : 특수문자가 섞여있는 데이터를 파라미터로 보내려면 필요한 함수
			var param = "user_id=" + user_id + "&user_pw="
					+ encodeURIComponent(user_pw);

			sendRequest(url, param, resFn, "Post");
		}

		//콜백메서드
		function resFn() {
			if (xhr.readyState == 4 && xhr.status == 200) {

				var data = xhr.responseText;

				if (data == 'no_user_pw') {
					alert("비밀번호가 일치하지 않습니다");
				} else {
					/* location.href = "editInfo.do"; */

					const modify = document.getElementById("modify");
					const modifyab = document.getElementById("modifyab");

					modifyab.style.display = "block";
					modify.style.display = "none";
				}
			}
		}

		function myQna(user_id) {

			var url = "myQna.do";

			//encodeURIComponent : 특수문자가 섞여있는 데이터를 파라미터로 보내려면 필요한 함수
			var param = "user_id=" + user_id;
			sendRequest(url, param, resFns, "POST");
		}

		//콜백메서드
		function resFns() {
			if (xhr.readyState == 4 && xhr.status == 200) {

				var data = xhr.responseText;
				if (data == 'success') {
					location.href = "redirect:myPage.do";
				}
			}
		}
	</script>
	<script type="text/javascript">
		function good(go, id) {
			const good = document.getElementById(go);

			var url = "replegood.do";
			var param = "play_id=" + id + "&reple_id=" + go + "&good_check="
					+ good.value + "&user_id=" + "${login.user_id}";
			sendRequest(url, param, resF, "Post");
		}

		function resF() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var data = JSON.parse(xhr.responseText);
				var reple_id = data.reple_id;
				const good = document.getElementById(reple_id);
				const count = document.getElementsByName(reple_id);
				if (data.result == 'plus') {
					good.style.background = "#c1c1c1";
					count[0].innerHTML = data.goodnum;
					good.value = 1;
				} else if (data.result == 'minus') {
					good.style.background = "none";
					count[0].innerHTML = data.goodnum;
					good.value = 0;

				}

			}
		}
	</script>
</body>
</html>