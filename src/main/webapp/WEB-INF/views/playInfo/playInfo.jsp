<%--
  Created by IntelliJ IDEA.
  User: gion6
  Date: 2023-04-23
  Time: PM 7:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String root = request.getContextPath();
%>
<html>
<head>
<title>공연에대한 상세 정보</title>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<%--<link href="./resources/assets/css/style.css"--%>
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
					<span>${login.user_name}님<span> 
					<a href="#" onclick="location.href='logout.do'">로그아웃</a> 
					<a href="#" onclick="location.href='qna_main.do'">Q&A</a> 
					<a href="#" onclick="location.href='mypage.do'">마이페이지</a>
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
	
	

	<main class=" container ">
	
		<h2>${play.play_prfnm}</h2>
  <div>${play.play_genrenm}</div>
  <hr  style="margin-bottom: 50px;">
  <div class=" container row d-flex justify-content-evenly " style="margin-bottom: 50px;">
    <img class="col-3  img-thumbnail rounded float-start"
         src="${playInfo.play_poster}">
    <table class="col-6" border="1">
      <tr>
        <th style="width: 100px;">공연기간</th>
        <td style="width: 500px;">${play.play_from}  ~  ${play.play_to}</td>
      </tr>
      <tr>
        <th>공연장소</th>
        <td>${play.play_locnm}</td>
      </tr>
      <tr>
        <th>공연시간</th>
        <td>${playInfo.play_dtguidance}</td>
      </tr>
      <tr>
        <th>관람연령</th>
        <td>${playInfo.play_prfage}</td>
      </tr>
      <tr>
        <th>티켓가격</th>
        <td>${playInfo.play_ticketprice}</td>
      </tr>
      <tr>
        <th>출연진</th>
        <td>${playInfo.play_prfcast}</td>
      </tr>
      <tr>
        <th>제작진</th>
        <c:if test="${fn:trim(playInfo.play_prfcrew) eq ''}">
          <td>해당정보 없음</td>
        </c:if>
        <c:if test="${fn:trim(playInfo.play_prfcrew) ne ''}">
          <td>${playInfo.play_prfcrew}</td>
        </c:if>

      </tr>
      <tr>
        <th>주최-주관</th>
				<c:if test="${fn:trim(playInfo.play_entrpsnm) eq ''}">
					<td>해당정보 없음</td>
				</c:if>
				<c:if test="${fn:trim(playInfo.play_entrpsnm) ne ''}">
					<td>${playInfo.play_entrpsnm}</td>
				</c:if>
      </tr>
      <tr>
        <th>기획-제작</th>
        <td>해당정보 없음</td>
      </tr>
    </table>

  </div>

  <div>
    <button type="button" class="btn btn-dark" onclick="location.href='<%=root%>/list.do'" style="cursor:pointer;">목록보기</button>
    <button type="button" class="btn btn-light" onclick="favorites()" style="cursor:pointer;" id="favoriteButton">
			즐겨찾기	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
			<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
		</svg>
		</button>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
				<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
			</svg>

  </div>
	
		<div class="btn-group container" role="group"
			aria-label="Basic radio toggle button group"
			style="margin-bottom: 30px;">
			<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" onclick="showInfo()" checked>
			<label class="btn  btn-outline-danger" for="btnradio1">소개</label>

<%--
			<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off"
						 onclick="location.href='loc.do?loc_id=${info.loc_id}'" style="cursor: pointer">
			<label class="btn  btn-outline-danger" for="btnradio2">공연장</label>
--%>
			<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off"
						 onclick="showLocInfo();" style="cursor: pointer" >
			<label class="btn  btn-outline-danger" for="btnradio2">공연장</label>

			<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off"
						 onclick="showTest();" style="cursor: pointer">
			<label class="btn  btn-outline-danger" for="btnradio3">Test</label>

<%--			<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off"--%>
<%--						 onclick="location.href='<%=root%>/loc.do?loc_id=${playInfo.loc_id}'" style="cursor: pointer">--%>
<%--			<label class="btn  btn-outline-danger" for="btnradio3">공연장</label>--%>
		</div>

		<div class="container d-flex justify-content-center"
			style="margin-bottom: 30px; display: block" id="divContainer">
			<div id="styurls" style="display: block">
				<img src="${playInfo.play_styurls}" alt="" style="max-width: 100%; height: auto;">
			</div>

			<div style="display: none" id="test">
				<img src="data:image/jpeg;base64,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"
						 alt="" style="max-width: 100%; height: auto;">
			</div>
		</div>

		<div style="display: none" id="locInfo">
			<!--공연장 정보-->
			<%--				<div class="bxo_vcb" style>--%>
			<h4 class="nb_tit1">
				${locInfo.loc_name}
			</h4>
			<ul class="ro_utb nvw">

				<li>
					<dl>
						<dt>좌석수</dt>
						<dd>${locInfo.loc_seatscale} 석</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>주소</dt>
						<dd>${locInfo.loc_addr}</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>홈페이지</dt>
						<dd style="word-break:break-all;" wrap="hard">
							<!-- Java 모바일 체크 -->

							<a href="${locInfo.loc_url}" target="_blank" title="새 창 열림">${locInfo.loc_url}</a>

						</dd>
					</dl>
				</li>
				<li>
					<dl class="bkv">
						<dt>공연장 위치</dt>
					</dl>
				</li>

			</ul>
			<%--				</div>--%>
			<!--공연장 정보 -->
		</div>

			<!--지도 표시 영역-->
			<!--스크립트에서 id 참조 중 지도를 표시 할 div임-->
			<div id="map" style="width:70%;height:350px; display: none">
				<!--표시즁~~◠ ͜ ◠-->
				<!--표시즁~~◠ ͜ ◠-->
				<!--표시즁~~◠ ͜ ◠-->
				<!--표시즁~~◠ ͜ ◠-->
			</div>






	</main>



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

	<div>
		<ul>

			<li>공연 시설ID:${info.loc_id}</li>
			<li>공연ID:${playInfo.play_id}</li>
			<li>출연진 정보:${playInfo.play_prfcast}</li>
			<li>제작진 정보:${playInfo.play_prfcrew}</li>
			<li>공연런타임:${playInfo.play_prfruntime}</li>
			<li>관람연령:${playInfo.play_prfage}</li>
			<li>제작사였구나:${playInfo.play_entrpsnm}</li>
			<li>티켓가격${playInfo.play_ticketprice}</li>
			<li>포스터 이미지 ${playInfo.play_poster}</li>
			<li>상세정보 이미지${playInfo.play_styurls}</li>
			<li>공연시작 일시${playInfo.play_dtguidance}</li>

			<li>공연장ID: ${locInfo.loc_id} </li>
			<li>이름:${locInfo.loc_name}</li>
			<li>번호:${locInfo.loc_tel}</li>
			<li>홈피:${locInfo.loc_url}</li>
			<li>주소:${locInfo.loc_addr}</li>
			<li>위:${locInfo.loc_la}</li>
			<li>경도:${locInfo.loc_lo}</li>
			<li>객석수:${locInfo.loc_seatscale}</li>
		</ul>
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
							<div class="credits">
								<!-- All the links in the footer should remain intact. -->
								<!-- You can delete the links only if you purchased the pro version. -->
								<!-- Licensing information: https://bootstrapmade.com/license/ -->
								<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/bizland-bootstrap-business-template/ -->
								Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37eb6d4d340481c71f7f17add0ea7792&libraries=services,clusterer"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>

<script>
	let user_id = '${favoriteVO.user_id}';
	if(user_id){
		alert("즐겨찾기 되어있는 작품입니다!");
		$('#favoriteButton').attr('class', 'btn btn-dark')


	}

	function favorites(){
		if (window.confirm("즐겨찾기에 추가하시겠습니까?")) {
			//유저 아이디와 공연 아이디를 보내 즐겨찾기에 추가하고 새로고침
			location.href="favorite.do?user_id=${login.user_id}&play_id=${play.play_id}"
			alert("즐겨찾기 목록에 추가했습니다.")
		}
	}
	<%--window.onload = location.href="loc.do?loc_id=${info.loc_id}";--%>

	function showInfo() {
		$('#divContainer').css("display", "block");
		$('#styurls').css("display", "block");
		$('#locInfo').css("display", "none");
		$('#map').css("display", "none");
		$('#test').css("display", "none");
	}
	function showLocInfo() {
		$('#divContainer').css("display", "none");
		$('#styurls').css("display", "none");
		$('#locInfo').css("display", "block");
		$('#map').css("display", "block");
		$('#test').css("display", "none");
		makeMap();
	}
	function showTest() {
		$('#divContainer').css("display", "none");
		$('#styurls').css("display", "none");
		$('#locInfo').css("display", "none");
		$('#map').css("display", "none");
		$('#test').css("display", "block");
	}





	function makeMap() {

		//=====기본 지도 설정 및 생성=====>>>>>//

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div(id로 따짐)
						mapOption = {
							center: new kakao.maps.LatLng(${locInfo.loc_la}, ${locInfo.loc_lo}), // 지도의 중심좌표
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
		var markerPosition = new kakao.maps.LatLng(${locInfo.loc_la}, ${locInfo.loc_lo});

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		//<<<<<=====지도 내부에 해당 주소 마커 생성=====//

	}



</script>
</html>
