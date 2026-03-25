<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Cookie</title>
</head>
<body>

<%
    Cookie[] cookies = request.getCookies(); //Client sends cookies to the server, and the server retrieves them using request

    if (cookies != null && cookies.length > 0) {
        for (Cookie cookie : cookies) {
            out.println(cookie.getName() + " : " + cookie.getValue() + "<br>");
        }
    } else {
        out.println("저장된 쿠키가 없습니다.");
    }
%>
<br><br>
<br>
</body>
</html>