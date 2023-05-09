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

<script>
	function search() {
		//조회 카테고리 검색
		let search = document.getElementById("search").value;
		//검색어 조회
		let search_text = document.getElementById("search_text").value.trim();

		//카테고리가 전체보기(all)로 지정되어 있지 않은 경우라면 반드시 검색어가 입력되어 있어야 한다
		//유효성 체크
		if (search != 'all' && search_text == "") {
			alert("검색어를 입력하세요");
			return;
		}

		//검색 카테고리, 검색어, 페이지 정보를 myQna.do에게 전달
		location.href = "myQna.do?user_id="+${login.user_id}+"&search=" + search + "&search_text="
				+ encodeURIComponent(search_text);
	}
</script>

</head>
<body>
	<!-- check_login.jsp가 body에서 호출하도록 붙여줌 -->
	<jsp:include page="check_login.jsp"/>
		
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
					<span>${login.user_name}님</span> <a href="#"
							onclick="location.href='logout.do'">로그아웃</a> <a href="#"
							onclick="location.href='qna_main.do'">Q&A</a> <a href="#"
							onclick="location.href='mypage.do?user_id=${login.user_id}'">마이페이지</a>
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
		
	<!-- ======= myPage list ======= -->
	<div>
		<ul>
			<li><a href="#" onclick="location.href='mypage.do'">회원정보 수정</a></li>
			<li><a href="#" onclick="location.href='myReview.do?user_id=${login.user_id}'">나의 후기</a></li>
			<li><a href="#" onclick="location.href='favorite.do?user_id=${login.user_id}'">즐겨찾기</a></li>
			<li><a href="#" onclick="location.href='myQna.do?user_id=${login.user_id}&page=${param.page}&search=${param.search}&search_text=${param.search_text}'">나의 문의 내역</a></li>
			<li><a href="#" onclick="location.href='delInfo.do'">회원탈퇴</a></li>
		</ul>
	</div>
	<!-- ======= end myPage list ======= -->
	

	<main class="container">
		<hr>

		<table class="container">
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
					<c:if test="${ vo.qna_remove_lev ne 1 }">
						<tr>
							<td>${vo.qna_id}</td>
							<c:if test="${ login.user_role_id eq 2}">
								<th><a href="myQnaView.do?qna_id=${vo.qna_id}&page=${param.page}">${vo.qna_title}</a></th>
							</c:if>
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
					</c:if>
					<c:if test="${ vo.qna_remove_lev eq 1 }">
						<tr>
							<td>${vo.qna_id}</td>
							<td colspan="5">삭제된 문의글 입니다.</td>
						</tr>
					</c:if>

				</c:forEach>
			</tbody>
		</table>

		<div align="center" style="font-size: 20px; margin-top: 20px;">${ pageMenu }</div>

		<div class="row container d-flex justify-content-center"
			style="margin-top: 20px;">
			<div class="col-2">
				<select id="search" class="form-select ">
					<option value="all">전체보기</option>
					<option value="subject">제목</option>
					<option value="name">이름</option>
					<option value="content">내용</option>
					<option value="name_subject_content">이름+제목+내용</option>
				</select>
			</div>
			<div class="col-3">
				<input id="search_text" class="form-control col-2" type="text">
			</div>
			<button class="btn btn-outline-primary col-1" onclick="search();">검색</button>
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