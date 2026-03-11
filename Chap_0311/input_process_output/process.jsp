<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import = "java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String bookName = request.getParameter("bookName");
    String author = request.getParameter("author");
    String urlBookName = URLEncoder.encode(bookName, "UTF-8");
    String urlAuthor = URLEncoder.encode(author, "UTF-8");
    response.sendRedirect("output.jsp?bookName=" + urlBookName + "&author=" + urlAuthor);
%>
도서명: <%= bookName %><br>
저자: <%= author %><br>
</body>
</html>
