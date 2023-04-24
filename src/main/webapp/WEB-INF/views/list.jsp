<%--
  Created by IntelliJ IDEA.
  User: gion6
  Date: 2023-04-23
  Time: PM 4:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String root = request.getContextPath();
  System.out.println(root);
%>
<html>
<head>
    <title>Title</title>
  <!-- CSS only -->
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <!-- Google Fonts -->
  <link
          href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

<%--  <!-- Vendor CSS Files -->--%>
<%--  <link href="/culture/resources/assets/vendor/aos/aos.css"--%>
<%--        rel="stylesheet">--%>
<%--  <link--%>
<%--          href="/culture/resources/assets/vendor/bootstrap/css/bootstrap.min.css"--%>
<%--          rel="stylesheet">--%>
<%--  <link--%>
<%--          href="/culture/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"--%>
<%--          rel="stylesheet">--%>
<%--  <link--%>
<%--          href="/culture/resources/assets/vendor/boxicons/css/boxicons.min.css"--%>
<%--          rel="stylesheet">--%>
<%--  <link--%>
<%--          href="/culture/resources/assets/vendor/glightbox/css/glightbox.min.css"--%>
<%--          rel="stylesheet">--%>
<%--  <link--%>
<%--          href="/culture/resources/assets/vendor/swiper/swiper-bundle.min.css"--%>
<%--          rel="stylesheet">--%>

<%--  <!-- Template Main CSS File -->--%>
<%--  <link href="/culture/resources/assets/css/style.css?ver=1"--%>
<%--        rel="stylesheet">--%>

  <!-- =======================================================
    * Template Name: BizLand
    * Updated: Mar 10 2023 with Bootstrap v5.2.3
    * Template URL: https://bootstrapmade.com/bizland-bootstrap-business-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>
<body>
<!-- ======= Top Bar ======= -->
<section id="topbar" class="d-flex align-items-center">
  <div class="container d-flex justify-content-end">
    <div class="social-links d-none d-md-flex align-items-end">
      <c:if test="${empty login.user_id}">
        <a href="#" onclick="location.href='login_form.do'">로그인</a>
        <a href="#">회원가입</a>
        <a href="#">고객센터</a>
        <a href="#">마이페이지</a>
      </c:if>

      <c:if test="${not empty login.user_id}">
      <span>${login.user_name}님<span> <a href="#"
                                         onclick="location.href='logout.do'">로그아웃</a> <a href="#">고객센터</a>
							<a href="#">마이페이지</a>
				</c:if>

    </div>
  </div>
</section>
하이용
<ul>
<c:forEach var="i" items="${list}">
  <h2>${i}번째</h2>
  <li> ${i.playId} </li>
  <li> <a href='<%=root%>/info.do?playId=${i.playId}'> ${i.playPrfnm} </a> </li>
  <li> ${i.playFrom} </li>
  <li> ${i.playTo} </li>
  <li> ${i.playLocnm} </li>
  <li> ${i.playPoster} </li>
  <li> ${i.playGenrenm} </li>
  <li> ${i.playPrfstate} </li>
  <li> ${i.playRef} </li>
</c:forEach>

</ul>
</body>
</html>
