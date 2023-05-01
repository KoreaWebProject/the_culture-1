<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>THE CULTURE</title>

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="./resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="./resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="./resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="./resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="./resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="./resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

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
					<a href="#" onclick="location.href='qna_main.do'">고객센터</a>
				</c:if>

				<c:if test="${not empty login.user_id}">
					<span>${login.user_name}님</span>
					<a href="#" onclick="location.href='logout.do'">로그아웃</a>
					<a href="#" onclick="location.href='qna_main.do'">고객센터</a>
					<a href="#" onclick="location.href='mypage.do'">마이페이지</a>
				</c:if>

			</div>
		</div>
	</section>

	<!-- ======= Header ======= -->
	<header id="header" class="d-flex align-items-center">
		<div
			class="container d-flex align-items-center justify-content-between">
			<a href="#" onclick="location.href='culture.do'" class="logo"><img
				src="resources/img/the_culture_logo.png" alt="" width="130px"></a>
			<nav class="navbar">
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
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
				<li><a class="nav-link scrollto" href="#"
					onclick="location.href='geinfo.do?genrenm=연극'">연극</a></li>
				<li><a class="nav-link scrollto" href="#"
					onclick="location.href='geinfo.do?genrenm=뮤지컬'">뮤지컬</a></li>
				<li class="dropdown"><a href="#"
					onclick="location.href='geinfo.do?genrenm=음악'"><span>음악</span>
						<i class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="#"
							onclick="location.href='geinfo.do?genrenm=서양음악(클래식)'">서양음악(클래식)</a></li>
						<li><a href="#"
							onclick="location.href='geinfo.do?genrenm=한국음악(국악)'">한국음악(국악)</a></li>
						<li><a href="#"
							onclick="location.href='geinfo.do?genrenm=대중음악'">대중음악</a></li>
					</ul></li>
				<li><a class="nav-link scrollto" href="#"
					onclick="location.href='geinfo.do?genrenm=무용'">무용</a></li>
				<li><a class="nav-link scrollto" href="#"
					onclick="location.href='geinfo.do?genrenm=서커스/마술'">서커스/마술</a></li>
				<li><a class="nav-link scrollto" href="#"
					onclick="location.href='geinfo.do?genrenm=복합'">복합</a></li>
			</ul>
		</nav>
	</div>
	<!-- ======= end menubar ======= -->

	<!-- 목록으로 돌아가기 버튼 -->
	<div>
		<input type="button" value="목록으로"
			onClick="location.href='myQna.do?page=${param.page}'">
	</div>
	<!-- 문의 수정 기능 추가? -->

	<!-- 선택한 문의 내용 상세보기 -->
	<h1>문의 상세 보기</h1>
	<!-- 현재 접속자와 해당 게시글의 작성자가 동일하면 삭제할 수 있도록 -->
	<div>
		<input type="button" value="삭제하기" onClick="location.href='qna_del.do?qna_id=${vo.qna_id}'">
	</div>
	<div>
		<div>제목</div>
		<div>${ vo.qna_title }</div>
	</div>
	<div>
		<div>아이디 :</div>
		<div>${ vo.user_id }</div>
	</div>
	<div>
		<div>내용 :</div>
		<div>${ vo.qna_contents }</div>
	</div>
	<div>
		<div>등록일 :</div>
		<div>${ vo.qna_regdate }</div>
	</div>
	<div>
		<div>공개여부 :</div>
		<c:if test="${ vo.qna_public_lev eq 0 }">
			<div>공개</div>
		</c:if>
		<c:if test="${ vo.qna_public_lev eq 1 }">
			<div>비공개</div>
		</c:if>
	</div>
	<div>
		<div>처리상태 :</div>
		<div>
			<c:if test="${ vo.qna_status eq 0 }">
				<div>처리중</div>
			</c:if>
			<c:if test="${ vo.qna_status eq 1 }">
				<div>답변완료</div>
			</c:if>
		</div>
	</div>

	<!-- 문의에 대한 답글 목록 -->
	<div>
		<hr>
		<h1>문의에 대한 답글 보기</h1>

		<div>
			<c:forEach var="list" items="${ list }">
				<div>
					<c:if test="${ list.qna_re_remove_lev eq 0}">
						<div>${ vo.qna_title }에 대한 답변입니다</div>
						<div>${ list.qna_re_contents }</div>
						<div>등록일</div>
						<div>${ list.qna_re_regdate }</div>
						<div>수정일</div>
						<div>${ list.qna_re_update }</div>
						<div>
							<hr>
						</div>
					</c:if>
					<c:if test="${ list.qna_re_remove_lev eq 1}">
						삭제된 답글입니다
					</c:if>
				</div>
			</c:forEach>
		</div>
	</div>

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
								&copy; Copyright <strong><span>THE CULTURE</span></strong>. All
								Rights Reserved
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
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="./resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="./resources/assets/vendor/aos/aos.js"></script>

	<script src="./resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="./resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="./resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="./resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script src="./resources/assets/vendor/php-email-form/validate.js"></script>
	<!-- Template Main JS File -->
	<script src="./resources/assets/js/main.js"></script>

</body>
</html>