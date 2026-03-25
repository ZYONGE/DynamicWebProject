<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.cookiebox.CookieBox" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Make Cookie</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
    String cookieName = request.getParameter("cookieName");
    String cookieValue = request.getParameter("cookieValue");
    String path = request.getParameter("Path");


    CookieBox cookieBox = new CookieBox(request);
    Cookie cookie = CookieBox.createCookie(cookieName, cookieValue, path, -1);
    response.addCookie(cookie);
%>

쿠키를 만들고, 쿠키 저장소에 저장했습니다. <br><br>
<%= cookie.getName() %> : <%= cookie.getValue() %> <br>

</body>
</html>