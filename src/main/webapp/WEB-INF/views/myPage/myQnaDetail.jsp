<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>The Culture</title>
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
<script src="./resources/js/ckeditor/ckeditor.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

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
		<div class="row justify-content-center" style="padding-bottom: 5px;">
			<hr>
			<h2 style="margin-bottom: 50px; font-weight: bold">문의 상세 보기</h2>
			<div class="container col-10 ">
				<form>
					<table>
						<tr>
							<th class="col-2">제목</th>
							<td>${vo.qna_title}</td>
						</tr>

						<tr>
							<th>작성자</th>
							<td>${vo.user_id }</td>
						</tr>

						<tr>
							<th>내용</th>
							<td class="row">
							<%-- <textarea class="col-11" name="qna_contents" id="qna_contents">${ vo.qna_contents }</textarea> --%>
							<div class="col-11 " style="white-space: pre-line;  font-weight: bold; font-size: 20px;">${ vo.qna_contents }</div>
							</td>
						</tr>

						<tr>
							<th class="col-2">등록일</th>
							<td>${ vo.qna_regdate }</td>
						</tr>

						<tr>
							<th class="col-2">처리상태</th>
							<c:if test="${ vo.qna_status eq 0 }">
								<td>처리중</td>
							</c:if>
							<c:if test="${ vo.qna_status eq 1 }">
								<td>답변완료</td>
							</c:if>
						</tr>

						<tr>
							<td colspan="2">
								<div class="d-flex justify-content-center">
								
										<input type="button" class="btn btn-outline-primary" onClick="location.href='myqna_del.do?qna_id=${vo.qna_id}&user_id=${login.user_id}'" style="margin-left: 50px;"
											value='삭제하기'>
								

									<input type="button" class="btn btn-outline-primary" onClick="window.location = document.referrer;" style="margin-left: 50px;" value='목록으로'>
								</div>
							</td>
						</tr>
					</table>
					<hr>
					<h2 style="margin-top: 20px; font-weight: bold">문의 답글</h2>

					<c:forEach var="list" items="${ list }">
						<c:if test="${ list.qna_re_remove_lev eq 0}">
							<div class="col-11 d-flex justify-content-right row">

								<table class="col-12" style="margin-top: 20px; word-wrap: break-word; table-layout: fixed;">
									<tr>
										<th>작성자</th>
										<td colspan="3">${login.user_id}</td>

									</tr>
									<tr>
										<th>제목</th>
										<td colspan="3">${ vo.qna_title }에대한문의답글입니다</td>

									</tr>


									<tr>
										<th>내용</th>
										<td colspan="3">
											<div class="col-11 " style="white-space: pre-line;  font-weight: bold; font-size: 20px;">${ list.qna_re_contents }</div>
										</td>

									</tr>

									<tr>
										<th>등록일</th>
										<td>${ list.qna_re_regdate }</td>

									</tr>

								</table>
							</div>
							<div class="col-1 d-flex justify-content-right align-items-start">
								<c:if test="${ list.qna_re_remove_lev eq 0 and login.user_role_id == 2}">
									<td><input class="btn btn-outline-primary" style="margin-top: 20px;" type="button" value="답글삭제"
										onClick="location.href='qna_reple_del.do?qna_id=${vo.qna_id}&qna_re_ref=${ list.qna_re_ref }&page=${param.page}&search=${ param.search }&search_text=${ param.search_text }'"></td>
								</c:if>
							</div>

						</c:if>
						<c:if test="${ list.qna_re_remove_lev eq 1}">
							<div class="col-11  d-flex justify-content-right row">
								<table style="margin-top: 20px;">
									<tr>
										<th>삭제된 답글입니다</th>
									</tr>
								</table>
							</div>
						</c:if>
					</c:forEach>
				</form>
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

	<!-- 현 접속자가 관리자일 경우 답글 달기 기능 및 답글 삭제 활성화 -->

</body>
</html>