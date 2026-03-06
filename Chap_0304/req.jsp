<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request method</title>
</head>
<body>
client IP address: <%= request.getRemoteAddr() %><br>
Info type: <%= request.getMethod() %><br>
URL path: <%= request.getRequestURI() %><br>
Context path: <%= request.getContextPath() %><br>
Server name: <%= request.getServerName() %><br>
Server port: <%= request.getServerPort() %><br>
</body>
</html>
