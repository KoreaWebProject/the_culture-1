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
<link href="./resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="./resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="./resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="./resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="./resources/assets/css/style.css?ver=1" rel="stylesheet">
<script src="./resources/js/httpRequest.js"></script>
<style>
.rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;

	z-index: 10;
	width: 15px;
	height: 35px;
	background-repeat: no-repeat;
	background-size: 15px 35px;
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
	width: 15px;
	height: 35px;
	background-repeat: no-repeat;
	background-size: 15px 35px;
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
							onclick="location.href='qna_main.do'">Q&A</a> <a href="#" onclick="location.href='mypage.do'">마이페이지</a>
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
		<hr style="margin-bottom: 50px;">
		<div class=" container row d-flex justify-content-evenly " style="margin-bottom: 50px;">
			<img class="col-3  img-thumbnail rounded float-start" src="${playInfo.play_poster}">
			<table class="col-6" border="1">
				<tr>
					<th style="width: 100px;">공연기간</th>
					<td style="width: 500px;">${play.play_from}~${play.play_to}</td>
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
			<button type="button" class="btn btn-dark" onclick="location.href='<%=root%>/list.do'" style="cursor: pointer;">목록보기</button>
			<button type="button" class="btn btn-dark" onclick="favorites()" style="cursor: pointer;">
				즐겨찾기
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
			<path
						d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
		</svg>
			</button>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
				<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
			</svg>

		</div>

		<div class="btn-group container" role="group" aria-label="Basic radio toggle button group" style="margin-bottom: 30px;">


			<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" onclick="showInfo()" checked> <label
				class="btn  btn-outline-danger" for="btnradio1">소개</label>

			<%--
			<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off"
						 onclick="location.href='loc.do?loc_id=${info.loc_id}'" style="cursor: pointer">
			<label class="btn  btn-outline-danger" for="btnradio2">공연장</label>
--%>
			<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" onclick="showLocInfo();" style="cursor: pointer"> <label
				class="btn  btn-outline-danger" for="btnradio2">공연장</label> <input type="radio" class="btn-check" name="btnradio" id="btnradio3"
				autocomplete="off" onclick="showTest();" style="cursor: pointer"> <label class="btn  btn-outline-danger" for="btnradio3">후기</label>

			<%--			<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off"--%>
			<%--						 onclick="location.href='<%=root%>/loc.do?loc_id=${playInfo.loc_id}'" style="cursor: pointer">--%>
			<%--			<label class="btn  btn-outline-danger" for="btnradio3">공연장</label>--%>
		</div>

		<div class="container d-flex justify-content-center" style="margin-bottom: 30px; display: block" id="divContainer">
			<div id="styurls" style="display: block">
				<img src="${playInfo.play_styurls}" alt="" style="max-width: 100%; height: auto;">
			</div>
		</div>
		<div style="display: none" id="test">
			<div class="container row d-flex justify-content-center">
				<div class="col-8" style="border: solid black 3px; margin-top: 20px; position: relative; padding-bottom: 20px;">
					<h4 class="d-flex justify-content-center" style="margin-top: 20px;">후기 작성하기</h4>

					<div class="rating d-flex align-items-center justify-content-center " style="text-align: center">
						<form>
							<input type="hidden" name="reple_rating" id="rate" value="0" /> <input type="hidden" name="play_id" value="${play_id}"> <input
								type="hidden" name="user_id" value="${login.user_id}">
							<div class="review_rating">
								<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
								<c:forEach var="i" begin="1" end="10">
									<c:choose>
										<c:when test="${i % 2 eq 0 }">
											<input type="checkbox" style="visibility: hidden; position: absolute;" id="rating${i}" value="${i}" class="rate_radio" title="${i}점">
											<label for="rating${i}" style="background-image: url('./resources/img/starrate_r.png');" value="${i}"></label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" style="visibility: hidden; position: absolute;" id="rating${i}" value="${i}" class="rate_radio" title="${i}점">
											<label for="rating${i}" style="background-image: url('./resources/img/starrate_l.png');" value="${i}"></label>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
							<label class="rating-emoji" style="font-size: 25px; margin-top: 10px;">😢</label>

							<div style="top: 15px; left: 10px; position: relative;">
								<textarea rows="3" cols="92" placeholder="후기를 입력해 주세요" name="reple_contents" style="resize: none; margin-bottom: 20px;"></textarea>
							</div>
							<div class="d-flex justify-content-center" style="margin-top: 10px;">
								<input type="button" class="btn btn-outline-secondary" name="save" id="save" value="등록" onclick="register(this.form);"> <input
									type="button" style="margin-left: 20px;" class="btn btn-outline-secondary" onclick="win_close();" value="닫기">
							</div>
						</form>
					</div>
				</div>

			</div>

			<div>
				<button type="button" onclick="win_open('replewrite.do?play_id=${play_id}', 'a')">팝업 1</button>
			</div>

			<c:forEach var="vo" items="${reple_list}">
				<div class="container row d-flex justify-content-center">
					<div class="col-8" style="border: solid black 3px; margin-top: 20px; position: relative; padding-bottom: 50px; border-radius: 0px 0px 60px 0px">

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
						<div style="top: 50px; left: 15px; position: absolute; font-size: 13px;">
							<span>${vo.user_id} </span><span style="color: #c1c1c1;">| ${vo.reple_regdate}</span>
						</div>

						<div style="top: 25px; right: 40px; position: absolute; border-radius: 10px; background: #86e186; padding: 3px 15px;">
							<img style="padding-bottom: 5px;" width="17px;" src="./resources/assets/img/like.png"> ${vo.reple_good } <span style="padding-top: 20px;"></span>
						</div>

						<div style="top: 43px; left: 10px; position: relative;">
							<pre id="ba" style="word-wrap: break-word; overflow: auto; white-space: pre-wrap; padding-right: 15px; word-break: keep-all;">${vo.reple_contents}</pre>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>




		<div style="display: none" id="locInfo">
			<!--공연장 정보-->
			<%--				<div class="bxo_vcb" style>--%>
			<h4 class="nb_tit1">${locInfo.loc_name}</h4>
			<ul class="ro_utb nvw">

				<li>
					<dl>
						<dt>좌석수</dt>
						<dd>${locInfo.loc_seatscale}석</dd>
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
						<dd style="word-break: break-all;" wrap="hard">
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
		<div id="map" style="width: 70%; height: 350px; display: none">
			<!--표시즁~~◠ ͜ ◠-->
			<!--표시즁~~◠ ͜ ◠-->
			<!--표시즁~~◠ ͜ ◠-->
			<!--표시즁~~◠ ͜ ◠-->
		</div>






	</main>



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

			<li>공연장ID: ${locInfo.loc_id}</li>
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
								&copy; Copyright <strong><span>THE CULTURE</span></strong>. All Rights Reserved
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
/* 	 console.log(${login.user_id});
	const user_id = ${login.user_id}
	const play_id = ${play.play_id}
	function favorites(){
		if (window.confirm("즐겨찾기에 추가하시겠습니까?")) {
			location.href="favorite.do";
			alert("즐겨찾기 목록에 추가했습니다.")
		}
	} 
 */










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
<script>
		document.addEventListener('DOMContentLoaded', function() {
			//별점선택 이벤트 리스너
			document.querySelector('.rating').addEventListener('click',
					function(e) {
						let elem = e.target;
						console.log(elem.value);
						let reple_rating = document.getElementById('rate');
						if(!isNaN(elem.value) && elem.value != "undefined"){							
						reple_rating.value = elem.value / 2;
						}
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

		let rating = new Rating();//별점 인스턴스 생성
		
		function register(f) {
			
			let play_id = f.play_id.value;
			let user_id = f.user_id.value;
			let reple_contents = f.reple_contents.value;
			let reple_rating = f.reple_rating.value;
			
			var url = "review.do";
			var param = "play_id="+play_id+"&user_id="+user_id+"&reple_contents="+encodeURIComponent(reple_contents)+"&reple_rating="+reple_rating;
			
			
			console.log(play_id);
			console.log(user_id);
			console.log(reple_contents);
			console.log(reple_rating);
			sendRequest(url, param, resFn, "POST")
	
		}
		
		
		
		function resFn(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				if(data == 'success'){
		
					location.href="info.do?play_id=${play_id}";
					return;
				}else{
					alert('오류');
				}
			}
			
		}
		
	</script>
<script type="text/javascript">
    function win_open(page, name) {
    	var popupX = (window.screen.width / 2) - (475 / 2);
    	var popupY= (window.screen.height /2) - (460 / 2);
      // window.open("팝업될 문서 경로","팝업될 문서 이름","옵션(위치, bar표시, 크기 등)");
    	window.open(page, name, 'height=460, width=475, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
    };
  </script>
</html>
