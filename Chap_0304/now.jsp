<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<% page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 날짜와 시간</title>
</head>
<body>
<% 
	Date now = new Date();
%>
	
현재 날짜와 시간은 <%= now %> 입니다.
</body>
</html>
