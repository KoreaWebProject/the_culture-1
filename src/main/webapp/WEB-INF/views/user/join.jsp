<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<!-- <link rel="stylesheet" href="/user/resources/css/join2.css"> -->
	</head>

	<body>
		<div id="main_box">
			<div class="wrap"  align="center">
				<form method="post">
				<div id="image" align="center">
					<img src="resources/img/the_culture_logo.png" width="250">
				</div>
				<div class="subjecet">회원가입</div>
				<div class="id_wrap">
					<div class="id_name">아이디</div>
						<input id="user_id" class="id_input">
						<input type="button" value="아이디 중복확인" onclick="idCheck()">
				</div>
				<div class="pw_wrap">
					<div class="pw_name">비밀번호</div>
						<input type="password" name="user_pw" class="pw_input" id="user_pw">
				</div>
				<div class="pwck_wrap">
					<div class="pwck_name">비밀번호 확인</div>
						<input type="password" name="user_pwck" class="pwck_input" id="user_pwck">
				</div>
				<div class="user_wrap">
					<div class="user_name">이름</div>
						<input name="user_name" class="user_input" value="${result.name}" id="user_name">
				</div>
				<div class="birth_wrap">
					<div class="birth_name">생년월일</div>
					<div class="user_birth">
						<select class="birth_year" name="birth_year">
						  <option value="년">년</option>
						  <c:forEach var="i" begin="1900" end="2023">
						    <option value="${i}">${i}</option>
						  </c:forEach>
						</select>

						<select class="birth_month" name="birth_month">
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
						</select>

						<select class="birth_day" name="birth_day">
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
					<div class="gender_name">성별
						<input type="radio" id="gender_male" name="contact" class="contact" value="M">남
						<input type="radio" id="gender_female" name="contact" class="contact" value="F">여
          </div>
				</div>

				<div class="mail_wrap">
					<div class="mail_name">이메일</div>
						<input name="user_mail" class="user_mail" value="${result.email}">
				</div>

				<div class="addr_wrap">
					<div class="addr_name">주소</div>
					<div class="zip_code_wrap">
							<input id="user_zip_code" name="user_zip_code" readonly="readonly">
							<input type="button" id="postButton" value="주소찾기" onclick="kakao_addr()">
					</div>
					<div class="clearfix"></div>
					</div>
					<div class="addr1_wrap">
							<input id="user_addr1" name="user_addr1" readonly="readonly">
					</div>
					<div class="addr2_wrap">
							<input type="text" id="user_addr2" name="user_addr2">
					</div>
				<div class="join_button_wrap">
					<input type="button" class="join_btn" value="가입하기" onclick="send(this.form);">
					<input type="button" class="cancel_btn" value="취소" onclick="location.href='cancel.do'">
				</div>
				</form>
			</div><!-- wrap -->
		</div><!-- main_box -->
	</body>

		<script src="./resources/js/httpRequest.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
		//소셜 로그인 세션에 대한 정보 불러온 상태에서 가입
    //가져온 값에 대해서는 변경 불가
    if('${result.name}'){
      console.log('가져올 이름이 있어요( •́ ▾ •̀ )');
      $("input[name='user_name']").prop("disabled", true);
    }
    if('${result.birthyear}' && '${result.birthday}'){
      console.log('가져올 생일이 있어요( •́ ▾ •̀ )' + '${result.birthyear}' + '${result.birthday}');
			//생년
      $('.birth_year').val(${result.birthyear}).prop("selected",true);
      $('.birth_year').prop('disabled',true);
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


			//id유효성
			if(user_id == ''){
				alert("ID를 입력하세요");
				$('#user_id').focus();
				return;
			}
			//pw유효성
			if(user_pw == ''){
				alert("PW를 입력하세요");
				$('#user_pw').focus();
				return;
			}
			//pw체크유효성
			if(user_pw !== user_pwck){
				alert("비밀번호가 일치하지 않습니다");
				$('#user_pwck').focus();
				return;
			}

			//이름유효성
			if(user_name == ''){
				alert("이름을 입력하세요");
				$('#user_name').focus();
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

			//이메일 유효성검사
			if (!user_mail) {
				alert("이메일을 작성하시오.");
				$('.user_mail').focus();
				return;
			}
			//주소 의 필수 zipcode와 addr1 유효성
			if (!user_zip_code) {
				alert("주소를 입력하시오");
				$('#user_zip_code').focus();
				return;
			}







			$("input[name='user_name']").prop("disabled", false);
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

	</script>
</html>