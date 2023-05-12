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

</script>
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
									href="#" style="margin-left: 10px;">문의내역</a></li>

								<li data-filter=".filter-w" id="5"><img src="./resources/assets/img/clients/unsub.png" class="img-fluid" alt=""><a class="col-8"
									href="#" style="margin-left: 10px;">회원탈퇴</a></li>

							</ul>
						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- End Clients Section -->


		<div class="container" data-aos="fade-up">


			<div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">
				<div class="col-12 portfolio-item filter-app" style="position: relative;">
					<hr>
					<p id="up">정보수정</p>
					<div class="portfolio-info position-absolute top-50 start-50 translate-middle" id="modify">
						<div class="col-12 d-flex justify-content-center">
							<div class="content row  d-flex justify-content-center ">
								<div class="col container d-flex justify-content-center row">
									<div class="col-12" style="border: 2px solid #e2e2e2; padding: 20px 20px; margin-top: 25px; border-radius: 20px; width: 400px;">

										<form>
											<input class="form-control col-12" name="user_id" type="text" placeholder="아이디" style="margin-top: 20px;" value="${ login.user_id }"
												disabled> <input class="form-control col-12" name="user_pw" type="password" placeholder="비밀번호" style="margin-top: 20px;">

											
										<div class="captcha_member">
											<!-- [D]이미지캡차시 display:block -->
											<div id="captcha_image_legend" style="display: block">
												<p class="captcha_txt" style="margin-top: 10px;">아래 이미지를 보이는 대로 입력해주세요.</p>
												<div id="image_captcha_div" class="captcha_box">
													<span class="captcha_img"><img name='captchaImage' id='chptchaimg'
														src='https://nid.naver.com/login/image/captcha/nhncaptchav4.gif?key=T0DMVfILwbYnZW4O&1' width='100%' height='87' alt='자동입력 방지문자'></span>
				
												</div>
											</div>
									
											<!-- 자동 입력 방지 문자 -->
											<div id="bdr_autoValue" class="spc_row">
												<label id="lbCapcha"  style="margin-top: 10px;" for="autoValue" class="lbl_in" style="display: block ;margin-top: 10px;"">자동입력 방지문자</label> <span class="int_box"> <!-- 캡챠 어뷰징 방지를 위해 maxlength는 제거함 : 2014-02-11- euli0912 -->
													<input type="text" id="autoValue" class="int form-control" title="자동입력 방지문자" style="width: 336px" ">
													
												</span>
											</div>
										</div>
										<input type="button" class="btn btn-primary col-12 " style="margin-top: 20px;" onclick="send(this.form);" value="확인">
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="portfolio-info invisible " id="modifyab">
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
											<input type="password" name="user_pw" class="form-control col" id="user_pw" placeholder="새 비밀번호">
										</div>
										<div class="pwck_wrap">
											<div class="pwck_name" style="font-weight: bold; font-size: 12px; margin-top: 10px;">비밀번호 확인</div>
											<input type="password" name="user_pwck" class="form-control col" id="user_pwck" placeholder="새 비밀번호 확인">
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
												<input type="radio" id="gender_male" name="contact" class="contact" value="M"
													<c:if test="${login.user_gender eq 'M'}">checked="checked"</c:if>>남자
											</div>
											<div class="form-check form-check-inline">
												<input type="radio" id="gender_female" name="contact" class="contact" value="F"
													<c:if test="${login.user_gender eq 'F'}">checked="checked"</c:if>>여자
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
											<input type="button" class="btn btn-primary col" style="margin-top: 10px;" value="수정하기" onclick="correction(this.form);"> <input
												type="button" class="btn btn-danger col" style="margin-top: 10px; margin-left: 10px;" value="취소"
												onclick="location.href='mypage.do?user_id=${login.user_id}'">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>





				<div class="col-12 portfolio-item filter-card">
					<hr>
					<p id="up">후기내역</p>
					<div class="portfolio-info">
						<c:forEach var="vo" items="${reple_list}">

							<div class="container row d-flex justify-content-center">
								<c:if test="${ vo.reple_remove_lev eq 0 }">
									<div class="col-8"
										style="border: solid black 3px; margin-top: 20px; position: relative; padding-bottom: 50px; border-radius: 0px 0px 60px 0px">
										<img style="width: 50px; top: 3px; left: 10px; position: absolute;" src="${vo.play_poster }"
											onclick="location.href='info.do?play_id=${vo.play_id}'"> <a href="#" onclick="location.href='info.do?play_id=${vo.play_id}&num=2'"><div
												style="top: 5px; left: 63px; position: absolute; font-size: 13px;">"${vo.play_prfnm }"</div></a>

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
											<pre id="ba"
												style="word-wrap: break-word; overflow: auto; white-space: pre-wrap; padding-top: 20px; padding-right: 15px; word-break: keep-all;">${vo.reple_contents}</pre>
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

				<div class="col-12 portfolio-item filter-web">
					<hr>
					<p id="up">즐겨찾기</p>
					<div class="portfolio-info">
						<div class="row justify-content-center">
							<div class="container d-flex justify-content-between">
								<p id="up" style="position: relative;">${genrenm}</p>
							</div>

							<div class="wrapper row justify-content-center">
								<c:forEach var="vo" items="${ prf_list }" varStatus="status">
									<a href="#" onclick="location.href='info.do?play_id=${vo.play_id}&num=2'" class="card col-3">

										<div>
											<img style="z-index: 0;" src="${vo.play_poster}" />


											<div style="font-size: 35px;; color: #e9d023; z-index: 1; position: absolute; bottom: 210px; left: 0">★</div>


											<div class="info">
												<span>${vo.play_prfnm}<span>
														<p></p>
														<p>장소 : ${vo.play_locnm}</p>
														<p>시작날짜 : ${vo.play_from}</p>
														<p>종료날짜 : ${vo.play_to}</p>
											</div>
										</div>

									</a>
								</c:forEach>
								<hr>

							</div>
						</div>

					</div>
				</div>









				<div class="col-12 portfolio-item filter-we">
					<hr>
					<p id="up">문의내역</p>
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
										<td>${vo.qna_id}</td>
										<c:if test="${ login.user_role_id eq 0 and vo.qna_status ne 0}">
											<th><a href="myQnaView.do?qna_id=${vo.qna_id}&user_id=${login.user_id}">${vo.qna_title}</a></th>
										</c:if>
										<c:if test="${login.user_role_id eq 0 and vo.qna_status ne 1}">
											<th><a href="myQnaUpdate.do?qna_id=${vo.qna_id}&user_id=${login.user_id}">${vo.qna_title}</a></th>
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

					</div>
				</div>

				<div class="col-12 portfolio-item filter-w row">
					<hr>
					<p id="up">회원탈퇴</p>
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
										<input type="radio" name="agree" value="agree" > 해당내용을 모두 확인했으며, 회원탈퇴에 동의합니다.
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

			alert(user_id);
			alert(user_pw);

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
				alert(data);
				if (data == "no_user_pwd") {
					console.log(data);
					alert("비밀번호가 일치하지 않습니다");
				} else {

					const modify = document.getElementById("modify");
					const modifyab = document.getElementById("modifyab");

					modify.style.display = "none";
					modifyab.classList.remove('invisible');
					modifyab.classList.add('visible');

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

		function correction(f) {

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
			if (!user_pw || user_pwck == "" || user_name == null || user_birth.trim() == null
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
			sendRequest(url, param, resCorrection, "get");
		}

		function resCorrection() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				//data = "fail" 또는 data = "success"
				var data = xhr.responseText;

				if (data == 'success') {
					alert("회원 정보 수정 성공");
				}
				location.href = "mypage.do?user_id=${login.user_id}";//되돌아오기
			}
		}
	</script>
	<script>
		function del(f) {
			let user_id = f.user_id.value;
			let ori_user_pw = f.ori_user_pw.value;
			let user_pw = f.user_pw.value;
			let agree = $('input:radio[name="agree"]:checked').val();
			
			console.log(user_id);
			console.log(ori_user_pw);
			console.log(user_pw);
			console.log(agree);
			
			if(ori_user_pw !== user_pw  || user_pw === ""){
				alert("비밀번호가 다르거나 입력하셔야 합니다.");
				return;
			}
			
			if (agree == null){
				alert("탈퇴동의를 체크해주십시오.");
				return;
			}
			
			

			var url = "userDel.do";

			//encodeURIComponent : 특수문자가 섞여있는 데이터를 파라미터로 보내려면 필요한 함수
			var param = "user_id=" + user_id;

			sendRequest(url, param, resDel, "Post");
		}

		//콜백메서드
		function resDel() {
			if (xhr.readyState == 4 && xhr.status == 200) {

				var data = xhr.responseText;
				alert(data);
				if (data == "success") {

					location.href="culture.do";
				} else {

					alert("오류 발생!!");

				}
			}
		}
	</script>
</body>
</html>