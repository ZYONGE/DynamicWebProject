<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    String manager = application.getInitParameter("managerName");
    String userNum = application.getInitParameter("userNum");
    String path = application.getRealPath("param");
    %>
매니저 이름: <%= manager %><br>
사용자 수: <%= userNum %><br>
폴더 경로: <%= path %><br>
</body>
</html>