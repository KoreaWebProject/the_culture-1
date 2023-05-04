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
<link rel="stylesheet" href="./resources/css/reple.css"/>

<script>
	document.addEventListener('DOMContentLoaded', function(){
	    //별점선택 이벤트 리스너
	    document.querySelector('.rating').addEventListener('click',function(e){
	        let elem = e.target;
	        if(elem.classList.contains('rate_radio')){
	            rating.setRate(parseInt(elem.value));
	        }
	    })
	
	    //상품평 작성 글자수 초과 체크 이벤트 리스너
	    document.querySelector('.review_textarea').addEventListener('keydown',function(){
	        //리뷰 400자 초과 안되게 자동 자름
	        let review = document.querySelector('.review_textarea');
	        let lengthCheckEx = /^.{400,}$/;
	        if(lengthCheckEx.test(review.value)){
	            //400자 초과 컷
	            review.value = review.value.substr(0,400);
	        }
	    });
	
	    //저장 전송전 필드 체크 이벤트 리스너
	    document.querySelector('#save').addEventListener('click', function(e){
	        //별점 선택 안했으면 메시지 표시
	        if(rating.rate == 0){
	            rating.showMessage('rate');
	            return false;
	        }
	        //리뷰 5자 미만이면 메시지 표시
	        if(document.querySelector('.review_textarea').value.length < 5){
	            rating.showMessage('review');
	            return false;
	        }
	        //폼 서밋
			//실제로는 서버에 폼을 전송하고 완료 메시지가 표시되지만 저장된 것으로 간주하고 폼을 초기화 함.
			alert("저장완료!");
			rating.setRate(0);
			document.querySelector('.review_textarea').value = '';
	    });
	});
	
	
	//별점 마킹 모듈 프로토타입으로 생성
	function Rating(){};
	Rating.prototype.rate = 0;
	Rating.prototype.setRate = function(newrate){
	    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
	    this.rate = newrate;
	    document.querySelector('.ratefill').style.width = parseInt(newrate * 60) + 'px';
	    let items = document.querySelectorAll('.rate_radio');
	    items.forEach(function(item, idx){
	        if(idx < newrate){
	            item.checked = true;
	        }else{
	            item.checked = false;
	        }
	    });
	}
	Rating.prototype.showMessage = function(type){//경고메시지 표시
	    switch(type){
	        case 'rate':
	            //안내메시지 표시
	            document.querySelector('.review_rating .warning_msg').style.display = 'block';
	            //지정된 시간 후 안내 메시지 감춤
	            setTimeout(function(){
	                document.querySelector('.review_rating .warning_msg').style.display = 'none';
	            },1000);            
	            break;
	        case 'review':
	            //안내메시지 표시
	            document.querySelector('.review_contents .warning_msg').style.display = 'block';
	            //지정된 시간 후 안내 메시지 감춤
	            setTimeout(function(){
	                document.querySelector('.review_contents .warning_msg').style.display = 'none';
	            },1000);    
	            break;
	    }
	}
	
	let rating = new Rating();//별점 인스턴스 생성
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
					<a href="#" onclick="location.href='qna_main.do'">Q&A</a>
				</c:if>

				<c:if test="${not empty login.user_id}">
					<span>${login.user_name}님</span> 
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

<div class="wrap">
        <h1>후기</h1>
        <form name="reviewform" class="reviewform" method="post" action="/save">
            <input type="hidden" name="rate" id="rate" value="0"/>
            <p class="title_star">별점과 이용경험을 남겨주세요.</p>
     
            <div class="review_rating rating_point">
                <div class="warning_msg">별점을 선택해 주세요.</div>
                <div class="rating">
                    <div class="ratefill"></div>
                    <!-- [D] 해당 별점이 선택될 때 그 점수 이하의 input엘리먼트에 checked 클래스 추가 -->
                    <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                    <label for="rating1"></label>
                    <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                    <label for="rating2"></label>
                    <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                    <label for="rating3"></label>
                    <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                    <label for="rating4"></label>
                    <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                    <label for="rating5"></label>
                </div>
            </div>
            <div class="review_contents">
                <div class="warning_msg">5자 이상의 리뷰 내용을 작성해 주세요.</div>
                <textarea rows="10" class="review_textarea"></textarea>
            </div>   
            <div class="cmd">
                <input type="button" name="save" id="save" value="등록">
            </div>
        </form>
    </div>
</body>
</html>