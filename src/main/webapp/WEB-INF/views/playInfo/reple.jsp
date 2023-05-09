<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37eb6d4d340481c71f7f17add0ea7792&libraries=services,clusterer"></script>

<!-- 별점 css -->
<!-- <link rel="stylesheet" href="/css/replecss.css"> -->
<style>
.rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 30px;
	height: 60px;
	background-repeat: no-repeat;
	background-size: 30px 60px;
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
	width: 30px;
	height: 60px;
	background-repeat: no-repeat;
	background-size: 30px 60px;
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
					<a href="#" onclick="location.href='qna_main.do'">고객센터</a>
				</c:if>
				<c:if test="${not empty login.user_id}">
					<span>${login.user_name}님<span> <a href="#" onclick="location.href='logout.do'">로그아웃</a>
							<a href="#" onclick="location.href='qna_main.do'">Q&A</a> <a href="#"
							onclick="location.href='mypage.do?user_id=${login.user_id}'">마이페이지</a>
				</c:if>
			</div>
		</div>
	</section>

	<!-- ======= Header ======= -->
	<header id="header" class="d-flex align-items-center">
		<div class="container d-flex align-items-center justify-content-between">
			<a href="#" onclick="location.href='culture.do'" class="logo"><img
				src="resources/img/the_culture_logo.png" alt="" width="130px"></a>
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
				<li class="dropdown"><a href="#" onclick="location.href='geinfo.do?genrenm=음악'"><span>음악</span>
						<i class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="#" onclick="location.href='geinfo.do?genrenm=서양음악(클래식)'">서양음악(클래식)</a></li>
						<li><a href="#" onclick="location.href='geinfo.do?genrenm=한국음악(국악)'">한국음악(국악)</a></li>
						<li><a href="#" onclick="location.href='geinfo.do?genrenm=대중음악'">대중음악</a></li>
					</ul></li>
				<li><a class="nav-link scrollto" href="#" onclick="location.href='geinfo.do?genrenm=무용'">무용</a></li>
				<li><a class="nav-link scrollto" href="#"
					onclick="location.href='geinfo.do?genrenm=서커스/마술'">서커스/마술</a></li>
				<li><a class="nav-link scrollto" href="#" onclick="location.href='geinfo.do?genrenm=복합'">복합</a></li>
			</ul>
		</nav>
	</div>
	<!-- ======= end menubar ======= -->

	<!-- main -->
	<main>
		<div class="wrap">
			<h3>관람평</h3>
			<form>
				<input type="hidden" name="reple_rating" id="rate" value="0" />
				<input type="hidden" name="play_id" value="${play_id}">
				<input type="hidden" name="user_id" value="${login.user_id}">

				<div class="review_rating">
					<div class="warning_msg">별점을 선택해 주세요.</div>
					<div class="rating">
						<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
						<c:forEach var="i" begin="1" end="10">
							<c:choose>
								<c:when test="${i % 2 eq 0 }">
									<input type="checkbox" style="visibility: hidden; position: absolute;" id="rating${i}"
										value="${i}" class="rate_radio" title="${i}점">
									<label for="rating${i}" style="background-image: url('./resources/img/starrate_r.png');"></label>
								</c:when>
								<c:otherwise>
									<input type="checkbox" style="visibility: hidden; position: absolute;" id="rating${i}"
										value="${i}" class="rate_radio" title="${i}점">
									<label for="rating${i}" style="background-image: url('./resources/img/starrate_l.png');"></label>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
				<div class="review_contents">
					<input type="text" maxlength='50' class="review_text" name="reple_contents"
						placeholder="관람평을 작성해 주세요">
					<input type="button" name="save" id="save" value="등록" onclick="register(this.form);">
				</div>
				<div>
					<span>${ r.reple_rating }</span>
				</div>
				<div>
					<span>${ r.user_id }</span> <span>${ r.reple_contents }</span>
				</div>
			</form>
		</div>

		<div>
			<table>
				<tr>
					<th>아이디</th>
					<th>별점</th>
					<th>내용</th>
				</tr>
				<c:forEach var="vo" items="${reple_list}">
					<tr>
						<td>${vo.user_id}</td>
						<td><c:forEach var="i" begin="1" end="10">
								<c:choose>
									<c:when test="${i % 2 eq 0 }">
										<c:choose>
											<c:when test="${vo.reple_rating ge i / 2.0}">
												<input type="checkbox" style="visibility: hidden; position: absolute;" name="rating"
													id="rating${i}_${vo.reple_id}" value="${i}" class="rate_radio2" title="${i}점"
													checked="checked" disabled="disabled">
												<label for="rating${i}_${vo.reple_id}"
													style="background-image: url('./resources/img/starrate_r.png');"></label>
											</c:when>
											<c:otherwise>
												<input type="checkbox" style="visibility: hidden; position: absolute;" name="rating"
													id="rating${i}_${vo.reple_id}" value="${i}" class="rate_radio2" title="${i}점"
													disabled="disabled">
												<label for="rating${i}_${vo.reple_id}"
													style="background-image: url('./resources/img/starrate_r.png');"></label>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${vo.reple_rating ge i / 2.0}">
												<input type="checkbox" style="visibility: hidden; position: absolute;" name="rating"
													id="rating${i}_${vo.reple_id}" value="${i}" class="rate_radio2" title="${i}점"
													checked="checked" disabled="disabled">
												<label for="rating${i}_${vo.reple_id}"
													style="background-image: url('./resources/img/starrate_l.png');"></label>
											</c:when>
											<c:otherwise>
												<input type="checkbox" style="visibility: hidden; position: absolute;" name="rating"
													id="rating${i}_${vo.reple_id}" value="${i}" class="rate_radio2" title="${i}점"
													disabled="disabled">
												<label for="rating${i}_${vo.reple_id}"
													style="background-image: url('./resources/img/starrate_l.png');"></label>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:forEach></td>
						<td>${vo.reple_contents}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</main>
	<!-- main end -->

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
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

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
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			//별점선택 이벤트 리스너
			document.querySelector('.rating').addEventListener('click',
					function(e) {
						let elem = e.target;
						console.log(elem.value);
						let reple_rating = document.getElementById('rate');
						reple_rating.value = elem.value / 2;
						if (elem.classList.contains('rate_radio')) {
							rating.setRate(parseInt(elem.value));
						}
					})
		});

		//별점 마킹 모듈 프로토타입으로 생성
		function Rating() {
		};
		Rating.prototype.rate = 0;
		Rating.prototype.setRate = function(newrate) {
			//별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
			this.rate = newrate;
			let items = document.querySelectorAll('.rate_radio');
			items.forEach(function(item, idx) {
				if (idx < newrate) {
					item.checked = true;
				} else {
					item.checked = false;
				}
			});
		}

		function register(f) {
			if ("${login}" == "") {
				if (confirm("로그인후 사용가능한 서비스입니다. 로그인 하시겠습니까?")) {
					location.href = "login_main.do";
					return;
				}
				return;
			}
			f.action = "review.do"
			f.submit();

		}

		let rating = new Rating();//별점 인스턴스 생성
	</script>
</body>
</html>