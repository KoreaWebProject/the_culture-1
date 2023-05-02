<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>The Culture</title>

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
<script src="./resources/js/httpRequest.js"></script>
</head>

	<body>
	
		<header>
			<a href="#" onclick="location.href='culture.do'"
				class=" cotainer logo d-flex justify-content-center"
				style="margin-top: 150px;"> <img
				src="resources/img/the_culture_logo.png" alt="" width="165px"></a>
		</header>
		
		<main>
			<div class="content row  d-flex justify-content-center ">
				<div class="col-5 container d-flex justify-content-center row">
					<div class="col-7" style="border: 2px solid #e2e2e2; padding: 20px 20px; margin-top: 25px; border-radius: 20px;">
						<form>
							<input class="form-control col" name="user_id" type="text"
							placeholder="아이디" style="margin-top: 20px;"> <input
							class="form-control col" name="user_pw" type="password"
							placeholder="비밀번호" style="margin-top: 20px;">

							<button type="button" class="btn btn-primary col-12"
							style="margin-top: 20px;" onclick="login(this.form);">로그인</button>
							
							<!-- 카카오 로그인 -->
							<button type="button" id="btn2" class="btn col-12"  onclick="location.href='https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=a2fec8e26b856f784cee55f1fb98be1b&redirect_uri=http://localhost:9090/kakao-callback.do'">카카오 로그인</button>
							
							<!-- 네이버 로그인 창으로 이동 -->
							<button type="button" id="btn1" class="btn col-12"  onclick="location.href='${url}'">네이버 로그인</button>
							
							<div id="atag" class="d-flex justify-content-center"
							style="font-size: 13px;">
								<!-- <a href="#">비밀번호 찾기 |</a> 
								<a href="#">아이디 찾기 |</a>  -->
								<a href="#" onclick="location.href='join.do'">회원가입</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</main>
		
		<footer>
			<div class="content row  d-flex justify-content-center "
				style="margin-top: 20px;">
				<div class="col-5 container d-flex justify-content-center row">
					<div id="atag2" class="d-flex justify-content-center"
						style="font-size: 10px;">
						<a href="#">이용약관 |</a> 
						<a href="#">개인정보처리방침 |</a> 
						<a href="#">책임의 한계와 법적고지 |</a> 
						<a href="#">회원정보 고객센터</a>
					</div>
					<div class="d-flex justify-content-center" style="font-size: 13px;">
					<span style="font-weight: bold; color: #3b8af2">CULTURE</span>
					&nbsp; Copyright © NAVER Corp. All Rights Reserved.
					</div>
				</div>
			</div>
		</footer>
	</body>

	<script>
		//로그인
		function login(f){
			let user_id = f.user_id.value;
			let user_pw = f.user_pw.value;
			var url = "login.do";
			//encodeURIComponent : 특수문자가 섞여있는 데이터를 파라미터로 보내려면 필요한 함수
			var param = "user_id="+user_id+"&user_pw="+ encodeURIComponent(user_pw);
			sendRequest(url, param, resFn, "Post");
		}
		
		//콜백메서드
		function resFn(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				if(data == 'no_user_id'){
					alert("아이디가 존재하지 않습니다");
				}else if(data == 'no_user_pw'){
					alert("비밀번호가 일치하지 않습니다");
				}else if(data == 'joined_out'){
					alert("이미 탈퇴한 회원입니다");
				}else{
					// 목록을 보다가 로그인 시 메인으로 가버림
					// location.href="culture.do";
					// 단순 뒤로가기 . 세션 갱신이 안되어서 로그인이 되어도 안되어있는거처럼 나옴 새로고침하면 정상출력
					// history.back();
					window.location = document.referrer;	//이전 페이지  url이동 후 새로고침
				}
			}
		}
	</script>
</html>