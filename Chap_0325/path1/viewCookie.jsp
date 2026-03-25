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
    Cookie[] cookies = request.getCookies();

    if (cookies != null && cookies.length > 0) {
        for (Cookie cookie : cookies) {
            out.println(cookie.getName() + " : " + cookie.getValue() + "<br>");
        }
    } else {
        out.println("저장된 쿠키가 없습니다.");
    }

    //Session is, in a way, a special cookie that is automatically created and managed by the server.
    //It is used to maintain state and store user-specific information across multiple requests.
    //The session ID is stored in a cookie on the client side, and the server uses this ID to associate the client's
    //requests with their session data.
%>

<br><br>
<br>
</body>
</html>