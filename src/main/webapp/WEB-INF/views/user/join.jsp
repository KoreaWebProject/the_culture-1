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

<!-- <link rel="stylesheet" href="/user/resources/css/join2.css"> -->
</head>

<body>
	<header>
		<a href="#" onclick="location.href='culture.do'" class=" cotainer logo d-flex justify-content-center" style="margin-top: 20px;"> <img
			src="resources/img/the_culture_logo.png" alt="" width="165px"></a>
	</header>
	<main>
		<div class="content row  d-flex justify-content-center ">

			<div class="col-5 container d-flex justify-content-center row">

				<div class="col-7 row" style="border: 2px solid #e2e2e2; padding: 20px 20px; margin-top: 25px; border-radius: 20px;">

					<div class="d-flex justify-content-center" style="margin-top: 10px; font-weight: bold; font-size: 20px; color: #3b8af2;">회원가입</div>
					<form>
						<div class="" style="margin-top: 20px; font-weight: bold; font-size: 12px;">아이디</div>

						<input class="form-control col" name="user_id" type="text" placeholder="아이디">
						<div class="" style="font-weight: bold; font-size: 12px; margin-top: 10px;">비밀번호</div>
						<input class="form-control col" name="user_pw" type="password" placeholder="비밀번호">
						<div class="" style="font-weight: bold; font-size: 12px; margin-top: 10px;">비밀번호 확인</div>
						<input class="form-control col" name="user_pwck" type="password" placeholder="비밀번호 확인">
						<div class="" style="font-weight: bold; font-size: 12px; margin-top: 10px;">이름</div>
						<input class="form-control col" name="user_name" type="text" placeholder="이름">

						<div class="" style="font-weight: bold; font-size: 12px; margin-top: 10px;">생년월일</div>
						<div class="d-flex justify-content-evenly">
							<select class="form-select birth_year w-30" name="birth_year">
								<option value="년">년</option>
								<c:forEach var="i" begin="1900" end="2023">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select> <select class=" form-select birth_month justify-content-center" name="birth_month" style="margin-left: 10px;">
								<option value="월">월</option>
								<c:forEach var="i" begin="1" end="12">
									<c:choose>
										<c:when test="${i lt 10 }">
											<option value="0${i}">0${i}</option>
										</c:when>
										<c:otherwise>
											<option value="${i}">${i}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select> <select class="form-select birth_day" name="birth_day" style="margin-left: 10px;">
								<option value="일">일</option>
								<c:forEach var="i" begin="1" end="31">
									<c:choose>
										<c:when test="${i lt 10 }">
											<option value="0${i}">0${i}</option>
										</c:when>
										<c:otherwise>
											<option value="${i}">${i}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>

						<div class="" style="font-weight: bold; font-size: 12px; margin-top: 10px;">성별</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="contact" id="inlineRadio1" value="남자"> <label class="form-check-label" for="남자">남자</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="contact" id="inlineRadio2" value="여자"> <label class="form-check-label" for="여자">여자</label>
						</div>

						<div class="" style="font-weight: bold; font-size: 12px; margin-top: 10px;">이메일</div>
						<input id="search_text" class="form-control col" name="user_mail" type="text" placeholder="이메일">
						<div class="" style="font-weight: bold; font-size: 12px; margin-top: 10px;">우편번호</div>
						<div class="zip_code_wrap d-flex justify-content-evenly">
							<input id="user_zip_code" class="form-control col" name="user_zip_code" type="text" placeholder="우편번호">
							<button type="button" class="btn btn-primary " onclick="kakao_addr();" style="margin-left: 10px; margin-right: 20px;">주소찾기</button>
						</div>


						<div class="" style="font-weight: bold; font-size: 12px; margin-top: 10px;">주소</div>
						<input class="form-control col" id="user_addr1" name="user_addr1" placeholder="주소" style="font-size: 13px;">
						<div class="" style="font-weight: bold; font-size: 12px; margin-top: 10px;">상세주소</div>
						<input class="form-control col" type="text" id="user_addr2" name="user_addr2" placeholder="상세주소" style="font-size: 13px;">



						<div class="d-flex justify-content-evenly">
							<button type="button" class="btn btn-primary col" style="margin-top: 10px;" onclick="send(this.form);">가입하기</button>
							<button type="button" class="btn btn-danger col" style="margin-top: 10px; margin-left: 10px;" onclick="history.go(-1)">취소하기</button>
						</div>
					</form>



				</div>
			</div>


		</div>


		</div>
	</main>
	<footer>
		<div class="content row  d-flex justify-content-center " style="margin-top: 20px;">
			<div class="col-5 container d-flex justify-content-center row">
				<div id="atag2" class="d-flex justify-content-center" style="font-size: 10px;">

					<a href="#">이용약관 |</a> <a href="#">개인정보처리방침 |</a> <a href="#">책임의 한계와 법적고지 |</a> <a href="#">회원정보 고객센터</a>

				</div>
				<div class="d-flex justify-content-center" style="font-size: 13px;">

					<span style="font-weight: bold; color: #3b8af2">CULTURE</span> &nbsp; Copyright © NAVER Corp. All Rights Reserved.


				</div>

			</div>
		</div>
	</footer>

	<script src="./resources/js/httpRequest.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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

			//id유효성
			if (user_id == '') {
				alert("ID를 입력하세요");
				return;
			}

			//pw유효성
			if (user_pw !== user_pwck) {
				alert("비밀번호가 일치하지 않습니다");
				return;
			}

			//라디오버튼 유효성
			var user_gender = $('input:radio[name="contact"]:checked').val();
			if (user_gender == null) {
				alert("성별을 선택하세요");
				return;
			}

			var url = "joinin.do";
			var param = "user_id=" + user_id + "&user_pw=" + user_pw
					+ "&user_name=" + user_name + "&user_birth=" + user_birth
					+ "&user_gender=" + user_gender + "&user_mail=" + user_mail
					+ "&user_zip_code=" + user_zip_code + "&user_addr1="
					+ user_addr1 + "&user_addr2=" + user_addr2;
			sendRequest(url, param, resFn, "get");
		}

		function resFn() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				//data = "no" 또는 data = "yes"
				var data = xhr.responseText;

				if (data == 'yes') {
					alert("회원가입 성공");
				}
				location.href = "login_main.do";//전체목록 갱신
			}
		}
	</script>
</html>