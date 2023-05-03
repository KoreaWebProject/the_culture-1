<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ empty login.user_id }">
	
	<script>
		alert("로그인 후 이용하세요");
		location.href="login_main.do";
	</script>
	
</c:if>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 마이페이지 이용 시 로그인을 해야하도록 설정하는 jsp임! -->
	</body>
</html>