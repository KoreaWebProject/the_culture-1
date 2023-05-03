<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
					<a href="#" onclick="location.href='qna_main.do'">Q&A</a>
				</c:if>

				<c:if test="${not empty login.user_id}">
					<span>${login.user_name}님<span> <a href="#"
							onclick="location.href='logout.do'">로그아웃</a> <a href="#"
							onclick="location.href='qna_main.do'">Q&A</a> <a href="#"
							onclick="location.href='mypage.do'">마이페이지</a>
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
			<li><a href="#" onclick="location.href='myQna.do?user_id=${login.user_id}'">나의 문의 내역</a></li>
			<li><a href="#" onclick="location.href='delInfo.do'">회원탈퇴</a></li>
		</ul>
	</div>
	<!-- ======= end myPage list ======= -->
	
	<h2>회원정보 수정</h2>
	<form>
		<div>
			<div>
			<input type="hidden" name="user_id" value="${ login.user_id }">
				아이디 : ${ login.user_id }
			</div>
		</div>
		<div class="pw_wrap">
			<div class="pw_name">비밀번호</div>
			<input type="password" name="user_pw" class="pw_input" value="${ login.user_pw }">
		</div>
		<div class="pwck_wrap">
			<div class="pwck_name">비밀번호 확인</div>
			<input type="password" name="user_pwck" class="pwck_input" value="${ login.user_pw }">
		</div>
			
		<div class="user_wrap">
			<div class="user_name">이름</div>
			<input name="user_name" class="user_input" value="${ login.user_name }">
		</div>
		
		<c:set var="birth" value="${ login.user_birth }"/>
		<div class="birth_wrap">
			<div class="birth_name">생년월일</div>
			<div class="user_birth">
				<select class="birth_year" name="birth_year">
					<option value="년" >년</option>
					<c:forEach var="i" begin="1900" end="2023">
						<option value="${i}" <c:if test="${fn:substring(birth, 0, 4) eq i}">selected</c:if>>${i}</option>
					</c:forEach>
				</select> <select class="birth_month" name="birth_month">
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
				</select> <select class="birth_day" name="birth_day">
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
			<div class="gender_name">성별</div>
			<input type="radio" id="gender_male" name="contact" value="남"
			<c:if test="${login.user_gender eq '남'}">checked="checked"</c:if>>
			<label for="남">남</label> 
			<input type="radio" id="gender_female" name="contact" value="여"
			<c:if test="${login.user_gender eq '여'}">checked="checked"</c:if>> 
			<label for="여">여</label>
		</div>

		<div class="mail_wrap">
			<div class="mail_name">이메일</div>
			<input name="user_mail" class="user_mail" value="${ login.user_mail }">
		</div>

		<div class="addr_wrap">
			<div class="addr_name">주소</div>
			<div class="zip_code_wrap">
				<input id="user_zip_code" name="user_zip_code" value="${ login.user_zip_code }"> 
				<input type="button" value="주소찾기" onclick="kakao_addr()">
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="addr1_wrap">
			<input id="user_addr1" name="user_addr1" value="${ login.user_addr1 }">
		</div>
		<div class="addr2_wrap">
			<input type="text" id="user_addr2" name="user_addr2" value="${ login.user_addr2 }">
		</div>
		<div>
			<input type="button" value="확인" onClick="send(this.form)">
		</div>
	</form>
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

	<!-- 회원정보 수정 스크립트 -->
	<script src="./resources/js/httpRequest.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.6.4.js"
		integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
		crossorigin="anonymous"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
			if(user_name == null || user_birth.trim() == null || user_mail.trim() == null || user_zip_code.trim() == null || user_addr1.trim() == null){
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