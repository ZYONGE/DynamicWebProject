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
	String bookName = request.getParameter("bookName");
	String author = request.getParameter("author");
	int price = Integer.parseInt(request.getParameter("price"));
%>
도서명 입력: <br><br>
<form action="output.jsp" method="post">
<input type="text" name="book" value="<%=bookName%>"><%--get 데이터 입력 --%>
<input type="text" name="author" value="<%=author%>"><%--get 데이터 입력 --%>
<input type="number" name="price" value="<%=price%>"><%--get 데이터 입력 --%>
<input type="submit" value="입력">
</form>
</body>
</html>
