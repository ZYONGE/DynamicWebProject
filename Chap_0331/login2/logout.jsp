<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout.jsp</title>
</head>
<body>

    <%
        session.removeAttribute("LOGIN");
        session.removeAttribute("USERNAME");
    %>

    로그아웃 하셨습니다. <br><br>

    <a href="login.jsp"> 로그인하기 </a>

</body>
</html>