<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<% page import="java.util.Date" %>
<%-- [import 지시] Date 클래스를 사용하기 위한 import 구문이다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 날짜와 시간</title>
</head>
<body>
<%-- [스크립틀릿] 서버 시각 기준으로 Date 객체를 생성해 now 변수에 저장한다. --%>
<% 
	Date now = new Date();
%>
	
<%-- [표현식] now 객체의 문자열 표현을 응답 HTML에 삽입해 사용자에게 현재 시각을 보여준다. --%>
현재 날짜와 시간은 <%= now %> 입니다.
</body>
</html>
