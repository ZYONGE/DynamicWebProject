<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.util.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
</head>
<body>  
    <%
        User user = (User) session.getAttribute("LOGIN");
    %>

    <%= user.getUserName() %> 고객님 반갑습니다. <br><hr><br>
    여기서 필요한 물건을 구매하시면 됩니다. <br><br>

    <a href="purchase.jsp">구매하러 가기> </a>
    <br><br>
    <a href="logout.jsp">로그아웃하기> </a>

</body>
</html>