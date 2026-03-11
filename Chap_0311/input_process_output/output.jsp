<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String book = request.getParameter("bookName");
    String author = request.getParameter("author");
%>
output.jsp에서 출력...<br><br>
도서명: <%= book %><br>
저자: <%= author %><br>
</body>
</html>

