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
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37eb6d4d340481c71f7f17add0ea7792&libraries=services,clusterer"></script>
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

<!--공연장 정보-->
<div class="bxo_vcb" style>
  <div class="tib">
    <h4 class="nb_tit1">
      ${loc.loc_name}
    </h4>
    <p class="tip_btn_area"><a href="javascript:fnPrfplcView('FC001418');" class="bt_st3">시설정보 상세 <span>&gt;</span></a></p>
  </div>
  <ul class="ro_utb nvw">

    <li>
      <div>
        <dl>
          <dt>좌석수</dt>
          <dd>${loc.loc_seatscale}</dd>
        </dl>
      </div>
    </li>
    <li>
      <div>
        <dl>
          <dt>주소</dt>
          <dd>${loc.loc_addr}</dd>
        </dl>
      </div>
    </li>
    <li>
      <div>
        <dl>
          <dt>홈페이지</dt>
          <dd style="word-break:break-all;" wrap="hard">
            <!-- Java 모바일 체크 -->

            <a href="${loc.loc_url}" target="_blank" title="새 창 열림">${loc.loc_url}</a>

          </dd>
        </dl>
      </div>
    </li>
    <li>
      <div>
        <dl class="bkv">
          <dt>공연장 위치</dt>
        </dl>
      </div>
    </li>

  </ul>
</div>

<!--지도 표시 영역-->
<div id="map" style="width:70%;height:350px;">
  <!--표시즁~~◠ ͜ ◠-->
  <!--표시즁~~◠ ͜ ◠-->
  <!--표시즁~~◠ ͜ ◠-->
  <!--표시즁~~◠ ͜ ◠-->
</div>

<!--공연장 정보 -->
<ul>

  <li>공연장ID: ${loc.loc_id} </li>
  <li>이름:${loc.loc_name}</li>
  <li>번호:${loc.loc_tel}</li>
  <li>홈피:${loc.loc_url}</li>
  <li>주소:${loc.loc_addr}</li>
  <li>위:${loc.loc_la}</li>
  <li>경도:${loc.loc_lo}</li>
  <li>객석수:${loc.loc_seatscale}</li>
</ul>

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

<script>
    //=====기본 지도 설정 및 생성=====>>>>>//

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div(id로 따짐)
    mapOption = {
    center: new kakao.maps.LatLng(${loc.loc_la}, ${loc.loc_lo}), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
    };

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성
    var map = new kakao.maps.Map(mapContainer, mapOption);

    //<<<<<=====기본 지도 설정 및 생성=====//


    //=====지도 내부 스카이뷰, 줌 기능 컨트롤 버튼 생성=====>>>>>//

    // 일반지도, 스카이뷰 전환 가능한 컨트롤 만들기
    var mapTypeControl = new kakao.maps.MapTypeControl();

    //map 지도에 addControl 한다 mapTypeControl의 컨트롤 버튼을 kakao.maps.ControlPosition.TOPRIGHT 의 위치로
    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치 정의, TOPRIGHT는 오른쪽 위 생성
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

    //  확대 축소를 제어할 수 있는  줌 컨트롤을 생성
    //addControl로 zoomControl을 kakao.maps.ControlPosition.RIGHT의 위치에 생성
    var zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

    //<<<<<=====지도 내부 스카이뷰, 줌 기능 컨트롤 버튼 생성=====//


    //=====지도 내부에 해당 주소 마커 생성=====>>>>>//

    // 마커가 표시될 위치입니다
    var markerPosition = new kakao.maps.LatLng(${loc.loc_la}, ${loc.loc_lo});

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
      position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    //<<<<<=====지도 내부에 해당 주소 마커 생성=====//

</script>
</html>
