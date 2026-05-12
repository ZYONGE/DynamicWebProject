<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (session.getAttribute("loginUser") != null) {
        response.sendRedirect("../print_list/list.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
    <h2>꽃 쇼핑몰 로그인</h2>
    <c:if test="${not empty param.error}">
        <p style="color:red;">아이디 또는 비밀번호가 올바르지 않습니다.</p>
    </c:if>
    <form action="loginProcess.jsp" method="post">
        아이디: <input type="text" name="userId" /><br>
        비밀번호: <input type="password" name="password" /><br>
        <input type="submit" value="로그인" />
    </form>
    <br>
    <a href="../register/register.jsp">회원가입</a>
</body>
</html>
