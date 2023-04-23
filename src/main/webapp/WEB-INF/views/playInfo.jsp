<%--
  Created by IntelliJ IDEA.
  User: gion6
  Date: 2023-04-23
  Time: PM 7:58
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
    <title>공연에대한 상세 정보</title>
</head>
<body>

       <div>
        ${info.locId}
         ${info.playId}
         ${info.playPrfcast}
         ${info.playPrfcrew}
        ${info.playPrfruntime}
        ${info.playPrfage}
        ${info.playEntrpsnm}
        ${info.playTicketprice}
        ${info.playPoster}
        ${info.playStyurls}
        ${info.playDtguidance}
       </div>

</body>
<script>
    console.log()

</script>
</html>
