<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>The Culture</title>
		
		<script src="/login/resources/js/httpRequest.js"></script>
		
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
				</table>
			</div>
		</div>
		</form>
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
				}else{
					location.href="login_suc.jsp";						
				}
			}
		}
	</script>
</html>