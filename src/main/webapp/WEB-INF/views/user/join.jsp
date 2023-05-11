<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
					<form method="post">
						<div class="id_wrap" class="zip_code_wrap d-flex justify-content-evenly">
							<div class="id_name" style="margin-top: 20px; font-weight: bold; font-size: 12px;">아이디</div>
							<div class=" d-flex justify-content-between">
							<div class="col-8">
								<input id="user_id" class="form-control col" placeholder="아이디">
							</div>
							<div class="col-3">
								<input type="button" class="btn btn-primary " id="idCheckButton" value="중복확인"  onclick="idCheck()">
							</div>
							</div>

						</div>
						<div class="pw_wrap">
							<div class="pw_name" style="font-weight: bold; font-size: 12px; margin-top: 10px;">비밀번호</div>
							<input type="password" name="user_pw" class="form-control col" id="user_pw" placeholder="비밀번호">
						</div>
						<div class="pwck_wrap">
							<div class="pwck_name" style="font-weight: bold; font-size: 12px; margin-top: 10px;">비밀번호 확인</div>
							<input type="password" name="user_pwck" class="form-control col" id="user_pwck" placeholder="비밀번호 확인">
						</div>
						<div class="user_wrap">
							<div class="user_name" style="font-weight: bold; font-size: 12px; margin-top: 10px;">이름</div>
							<input name="user_name" class="form-control col" value="${result.name}" id="user_name" placeholder="이름">
						</div>
						<div class="birth_wrap">
							<div class="birth_name" style="font-weight: bold; font-size: 12px; margin-top: 10px;">생년월일</div>
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
						</div>

						<div class="gender_wrap">
							<div class="gender_name" style="font-weight: bold; font-size: 12px; margin-top: 10px;">성별</div>
							<div class="form-check form-check-inline">
								<input type="radio" id="gender_male" name="contact" class="contact" value="M">남자
							</div>
							<div class="form-check form-check-inline">
								<input type="radio" id="gender_female" name="contact" class="contact" value="F">여자
							</div>
						</div>

						<div class="mail_wrap">
							<div class="mail_name" style="font-weight: bold; font-size: 12px; margin-top: 10px;">이메일</div>
							<input id="search_text" class="form-control col" name="user_mail" type="text" placeholder="이메일" value="${result.email}">
						</div>

						<div class="addr_wrap">
							<div class="addr_name" style="font-weight: bold; font-size: 12px; margin-top: 10px;">우편번호</div>
							<div class="zip_code_wrap d-flex justify-content-evenly">
								<input id="user_zip_code" class="form-control col" name="user_zip_code" readonly="readonly" placeholder="우편번호">
								<button type="button" class="btn btn-primary " id="postButton" onclick="kakao_addr();" style="margin-left: 10px; margin-right: 20px;">주소찾기</button>
							</div>

							<div class="clearfix"></div>
						</div>

						<div class="" style="font-weight: bold; font-size: 12px; margin-top: 10px;">
							<input class="form-control col" id="user_addr1" name="user_addr1" placeholder="주소" style="font-size: 13px;" readonly="readonly">
						</div>

						<div class="" style="font-weight: bold; font-size: 12px; margin-top: 10px;">
							<input class="form-control col" type="text" id="user_addr2" name="user_addr2" placeholder="상세주소" style="font-size: 13px;">
						</div>

						<div class="d-flex justify-content-evenly">
							<input type="button" class="btn btn-primary col" style="margin-top: 10px;" value="가입하기" onclick="send(this.form);"> <input
								type="button" class="btn btn-danger col" style="margin-top: 10px; margin-left: 10px;" value="취소" onclick="location.href='cancel.do'">
						</div>
					</form>
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

</body>

<script src="./resources/js/httpRequest.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	//소셜 로그인 세션에 대한 정보 불러온 상태에서 가입
    //가져온 값에 대해서는 변경 불가
    if('${result.birthyear}'){
			//생년
      $('.birth_year').val(${result.birthyear}).prop("selected",true);
      $('.birth_year').prop('disabled',true);
    }
    if( '${result.birthday}'){
			var birth_month = '${result.birthday}'.substring(0,2);	//'12-23' 이런 식으로 넘어와서 0부터 2까지
			var birth_day = '${result.birthday}'.substring(3,5);		//3부터 5까지 잘라서 씀
			//월
      $('.birth_month').val(birth_month).prop("selected",true);
      $('.birth_month').prop('disabled',true);
			//일
      $('.birth_day').val(birth_day).prop("selected",true);
      $('.birth_day').prop('disabled',true);
    }
    if('${result.gender}'){
      console.log('가져올 성별이 있어요( •́ ▾ •̀ )' + '${result.gender}');
      $("input[class='contact'][value='${result.gender}']").prop("checked", true);  //만약 젠더값이 있다면 class가 contect인 radio 에서 value가 'result.gender'인것을 체크
      $(".contact").prop('disabled',true);
    }
    if('${result.email}'){
      console.log('가져올 이메일이 있어요( •́ ▾ •̀ )' + '${result.email}');
      $("input[name='user_mail']").prop("disabled", true);
    }
		//다음POST API
		function kakao_addr() {
		    daum.postcode.load(function(){
		      new daum.Postcode({
		          oncomplete : function(data){
		              console.log(data); //뭐가 오는지 궁금하시나용
		              let fullAddr = '';
		              let extraAddr = '';
		              //도로명 주소를 선택 시
		              if(data.userSelectedType === 'R') {
		                  fullAddr = data.roadAddress;
		                  //법정동 명이 있을 시
		                  if(data.bname !== ''){
		                      extraAddr += data.bname;
		                  }
		              }else{
		                  fullAddr = data.jibunAddress;
		              }
		              //건물이름 있을 시
		              if(data.buildingName !== ''){
		                  //빈값이 아니라면 즉,법정동명이 있으면 ',' + buildingName ,,,,, 빈값이라면 buildingName
		                  extraAddr += ( extraAddr !== '' ? ', ' + data.buildingName : data.buildingName );
		              }
		              fullAddr += ( extraAddr !== '' ? '(' + extraAddr + ')' : '');
		              $( '#user_zip_code' ).val( data.zonecode );
		              $( '#user_addr1' ).val( fullAddr );
		              console.log('#user_zip_code');
		              console.log(data.zonecode);
		              console.log('#user_addr1');
		              console.log(fullAddr);
		          }
		      }).open();
		    })
		}
		//아이디
		function idCheck() {
			  var user_id = document.getElementById("user_id").value;
			  // 입력한 아이디에 대한 유효성 검사
			  if (user_id == '') {
				    alert("아이디를 입력하세요");
				    return;
			  }
			// 중복 체크를 위해 가입된 아이디 목록에서 검색
			 var url = "idChk?user_id="+user_id;
			// var param = user_id;
			sendRequest(url, null, resFn2, 'POST');
			}
		function resFn2(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				if( data == 'no_id' ){
					alert("사용 가능한 아이디");
					return;
				}else{
					alert("중복된 아이디");
					return;
				}
			}
		}
		//폼 전송 시 데이터 같이 전송 및 회원가입 실행
		function send(f){
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
			
			//유효성 체크
			if(!checkAll(f)){
				return;
			}
			
			//생년월일
			if(birth_year == '년'){
				alert("생년월일을 정확히 기입하시오");
				document.getElementsByName("birth_year")[0].focus();
				return;
			}
			if(birth_month == '월'){
				alert("생년월일을 정확히 기입하시오");
				document.getElementsByName("birth_month")[0].focus();
				return;
			}
			if(birth_day == '일'){
				alert("생년월일을 정확히 기입하시오");
				document.getElementsByName("birth_day")[0].focus();
				return;
			}
			//라디오버튼 유효성
			var user_gender = $('input:radio[name="contact"]:checked').val();
			if(user_gender == null){
				alert("성별을 선택하세요");
				//성별 div로 테두리?
				return;
			}
		
			//주소 의 필수 zipcode와 addr1 유효성
			if (!user_zip_code) {
				alert("주소를 입력하시오");
				$('#user_zip_code').focus();
				return;
			}

			/* $("input[name='user_name']").prop("disabled", false); */
			$("input[name='user_mail']").prop("disabled", false);
			$(".birth_year").prop('disabled',false);
			$(".birth_month").prop('disabled',false);
			$(".birth_day").prop('disabled',false);
			$(".contact").prop('disabled',false);

		    var url = "joinin.do";
		    var param = "user_id=" + user_id + "&user_pw=" + user_pw + "&user_name=" + user_name + "&user_birth=" + user_birth + "&user_gender=" + user_gender + "&user_mail=" + user_mail + "&user_zip_code=" + user_zip_code + "&user_addr1=" +  user_addr1 + "&user_addr2=" + user_addr2;
		    sendRequest(url, param, resFn, "get");
		
						
		}
		
		function resFn(){
			if(xhr.readyState == 4 && xhr.status == 200){
				//data = "no" 또는 data = "yes"
				var data = xhr.responseText;
				if(data == 'yes'){
					alert("회원가입 성공");
				}
				
				location.href = "login_main.do";//전체목록 갱신
			}
		}
		
		//합체!
		//유효성 검사
		function checkAll(f) {
	        if (!checkUserId(f.user_id.value)) {
	            return false;
	        } else if (!checkPassword(f.user_id.value, f.user_pw.value,
	                f.user_pwck.value)) {
	            return false;
	        } else if (!checkMail(f.user_mail.value)) {
	            return false;
	        } else if (!checkName(f.user_name.value)) {
	            return false;
	        }
	        return true;
	    }
		
		// 공백확인 함수
	    function checkExistData(value, dataName) {
	        if (value == "") {
	            alert(dataName + " 입력해주세요!");
	            return false;
	        }
	        return true;
	    }
		
		//아이디 체크
		function checkUserId(id) {
	        //Id가 입력되었는지 확인하기
	        if (!checkExistData(id, "아이디를"))
	            return false;
	 
	        var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
	        if (!idRegExp.test(id)) {
	            alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
	            form.userId.value = "";
	            form.userId.focus();
	            return false;
	        }
	        
	        if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				if( data == 'yes_id' ){
					alert("아이디를 다시 확인하세요");
	        		return false;
				}
	        }
	        return true; //확인이 완료되었을 때
	    }

		//패스워드 체크
		function checkPassword(id, password1, password2) {
	        //비밀번호가 입력되었는지 확인하기
	        if (!checkExistData(password1, "비밀번호를"))
	            return false;
	        //비밀번호 확인이 입력되었는지 확인하기
	        if (!checkExistData(password2, "비밀번호 확인을"))
	            return false;
	 
	        var password1RegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
	        if (!password1RegExp.test(password1)) {
	            alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
	            form.password1.value = "";
	            form.password1.focus();
	            return false;
	        }
	        //비밀번호와 비밀번호 확인이 맞지 않다면..
	        if (password1 != password2) {
	            alert("두 비밀번호가 맞지 않습니다.");
	            form.password1.value = "";
	            form.password2.value = "";
	            form.password2.focus();
	            return false;
	        }
	 
	        //아이디와 비밀번호가 같을 때..
	        if (id == password1) {
	            alert("아이디와 비밀번호는 같을 수 없습니다!");
	            form.password1.value = "";
	            form.password2.value = "";
	            form.password2.focus();
	            return false;
	        }
	        return true; //확인이 완료되었을 때
	    }    
		
		//이메일 검사
		function checkMail(mail) {
	        //mail이 입력되었는지 확인하기
	        if (!checkExistData(mail, "이메일을"))
	            return false;
	 
	        var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
	        if (!emailRegExp.test(mail)) {
	            alert("이메일 형식이 올바르지 않습니다!");
	            form.mail.value = "";
	            form.mail.focus();
	            return false;
	        }
	        return true; //확인이 완료되었을 때
	    }

		//이름 검사
		function checkName(name) {
	        if (!checkExistData(name, "이름을"))
	            return false; 
	 
	        var nameRegExp = /^[가-힣]{2,50}$/;
	        if (!nameRegExp.test(name)) {
	            alert("이름이 올바르지 않습니다.");
	            return false;
	        }
	        return true; //확인이 완료되었을 때
	    }
	</script>
</html>