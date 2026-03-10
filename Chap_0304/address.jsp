<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%-- [페이지 지시어] 응답 Content-Type과 JSP 소스 인코딩을 UTF-8로 설정해 한글 깨짐을 방지한다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My address</title>
</head>
<body>
<%-- [스크립틀릿] 서버에서 사용할 지역 변수(name/address/age)를 요청 처리 시점에 생성한다. --%>
<%
    String name = "홍길동";
    String address = "한국공학대학교";
    int age = 20;
%>
<%-- [표현식] 서버 변수 name 값을 HTML 응답에 출력한다. --%>
my name is <%= name %>.<br>
<%-- [표현식] 서버 변수 address 값을 HTML 응답에 출력한다. --%>
my address is <%= address %>.<br>
<%-- [표현식] 서버 변수 age 값을 HTML 응답에 출력한다. --%>
my age is <%= age %>.<br>

</body>
</html>
