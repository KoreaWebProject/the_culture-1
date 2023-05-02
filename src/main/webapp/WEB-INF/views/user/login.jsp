<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>The Culture</title>

		<script src="./resources/js/httpRequest.js"></script>
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

		<style>
			.btn{
				width: 90px;
			    height: 30px;
			    background-color: #3366CC;
			    font-size: 18px;
			    font-weight: 900;
			    color: white;
			    margin : auto;}
		</style>

	</head>

	<body>
		<form>


		<div id="main_box">
			<div id="image" align="center">
				<img src="resources/img/the_culture_logo.png" width="250">
			</div>
			<br>
			<div class="login" align="center">
				<table>
					<tr>
						<th>ID</th>
						<td><input name="user_id"></td>
					</tr>

					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="user_pw"></td>
					</tr>

					<tr>
						<td colspan="2" align="center">
							<input type="button" class="btn" value="로그인" onclick="login(this.form)" >
							<input type="button" class="btn" value="회원가입" onclick="location.href='join.do'">
						</td>
					</tr>
					<!-- 카카오 로그인 버튼 -->
					<tr>
						<td colspan="2" align="center">
				 			<!-- <img src="resources/img/kakao_login.png" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=602c023b6ce1daeba7c38f4497a12be6&redirect_uri=https://localhost:9090/kakaologin" onclick="kakaoLogin();"> -->
							<img src="resources/img/kakao_login.png" width="200" href="javascript:void(0)" onclick="KakaoLogin();"></a>
						</td>
					</tr>
					<!-- 네이버 로그인 창으로 이동 -->
					<tr>
						<td colspan="2" align="center">
							<a href="${url}">
								<!--NaverLoginBO.java 파일에 REDIRECT_URI란의 주소로 이동된다.(callback uri)-->
							<img width="200" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
							</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</form>
	</body>
	<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
					location.href="culture.do";
				}
			}
		}
		
		
		//카카오로그인
		  function KakaoLogin() {
		    $.ajax({
		        url: 'logintest.do',
		        type: 'get',
		        async: false,
		        dataType: 'text',
		        success: function (res) {
		            location.href = res;
		        },fail: function (error) {
		            alert(error);
		        }
		    });

		  }

		  $(document).ready(function() {
				
		      var kakaoInfo = '${kakaoInfo}';

		      if(kakaoInfo != ""){
		          var data = JSON.parse(kakaoInfo);

		          alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
		          alert(
		          "user : \n" + "email : "
		          + data['email']  
		          + "\n nickname : " 
		          + data['nickname']);
		      }
		  });  
	</script>
</html>