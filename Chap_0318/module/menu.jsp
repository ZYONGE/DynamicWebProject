<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    사용자 아이디: <%= request.getParameter("userID") %> <hr><br>
    사용자 이름: <%= request.getParameter("userName") %> <hr><br>

</body>
</html>