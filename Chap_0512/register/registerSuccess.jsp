<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String name = request.getParameter("name");
    String role = request.getParameter("role");
    String roleLabel = "admin".equals(role) ? "관리자" : "사용자";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>
    <h2>회원가입이 완료되었습니다!</h2>
    <p><strong><%= name %></strong>님, <%= roleLabel %> 계정으로 가입되었습니다.</p>
    <a href="../login/login.jsp">로그인하러 가기</a>
</body>
</html>
