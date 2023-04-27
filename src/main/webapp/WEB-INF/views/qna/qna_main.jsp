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


<style>
a {
	text-decoration: none;
}
</style>

<script>
	function classToggle() {
		var el = document.querySelector('.icon-cards__content');
		el.classList.toggle('step-animation');
	}
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

		//검색 카테고리, 검색어, 페이지 정보를 qna_main.do에게 전달
		location.href = "qna_main.do?search=" + search + "&search_text="
				+ encodeURIComponent(search_text);
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
					<a href="#" onclick="location.href='qna_main.do'">고객센터</a>
				</c:if>

				<c:if test="${not empty login.user_id}">
					<span>${login.user_name}님<span> 
					<a href="#" onclick="location.href='logout.do'">로그아웃</a> 
					<a href="#" onclick="location.href='qna_main.do'">고객센터</a> 
					<a href="#">마이페이지</a>
				</c:if>

			</div>
		</div>
	</section>

	<!-- ======= Header ======= -->
	<header id="header" class="d-flex align-items-center">
		<div class="container d-flex align-items-center justify-content-between">
			<a href="#" onclick="location.href='culture.do'" class="logo"><img src="./resources/assets/img/the_culture_logo.png" alt="" width="130px"></a>
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
	<h1>문의하기</h1>
	<div>
		<c:if test="${not empty login.user_id and login.user_role_id == 0}">
			<input type="hidden" name="user_id" value="${login.user_id}">
			<input type="button" value="문의하기" onClick="location.href='qna_reg.do'">
		</c:if>
	</div>
	<div>
		<div>
			<div>NO</div>
			<div>제목</div>
			<div>이름</div>
			<div>진행상황</div>
			<div>등록일</div>
		</div>

		<c:forEach var="vo" items="${ list }">
			<div>${vo.qna_id}</div>
			<div>
				<c:if test="${ vo.qna_remove_lev ne 1 }">
					<div>
						<!-- 링크를 누르면 qna_id를 가지고 페이지를 넘어가기 -->
						<a href="qna_view.do?qna_id=${vo.qna_id}&page=${param.page}&search=${param.search}&search_text=${param.search_text}">${vo.qna_title}</a>
						<div>${vo.user_id}</div>
						<div>
							<c:if test="${ vo.qna_status eq 0 }">처리중</c:if>
							<c:if test="${ vo.qna_status ne 0 }">답변완료</c:if>
						</div>
						<div>${vo.qna_regdate}</div>
					</div>
				</c:if>
				<c:if test="${ vo.qna_remove_lev eq 1 }">
					<font color="gray">삭제된글입니다</font>
				</c:if>
			</div>
		</c:forEach>

		<!-- 페이지 선택 -->
		<div>${ pageMenu }</div>

		<div>
			<!-- 조회 카테고리 -->
			<select id="search">
				<option value="all">전체보기</option>
				<option value="subject">제목</option>
				<option value="name">이름</option>
				<option value="content">내용</option>
				<option value="name_subject_content">이름+제목+내용</option>
			</select>

			<!-- 검색어 입력 창 -->
			<input id="search_text"> <input type="button" value="검색" onClick="search();">
		</div>
	</div>
</body>
</html>