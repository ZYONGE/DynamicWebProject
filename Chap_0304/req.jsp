<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%-- [페이지 지시어] 이 JSP 응답의 MIME 타입과 인코딩을 UTF-8로 지정한다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request method</title>
</head>
<body>
<%-- [표현식] request 내장 객체에서 클라이언트 IP 주소를 조회해 출력한다. --%>
client IP address: <%= request.getRemoteAddr() %><br>
<%-- [표현식] HTTP 메서드(GET/POST 등)를 조회해 출력한다. --%>
Info type: <%= request.getMethod() %><br>
<%-- [표현식] 요청된 URI 경로를 조회해 출력한다. --%>
URL path: <%= request.getRequestURI() %><br>
<%-- [표현식] 애플리케이션 컨텍스트 경로를 조회해 출력한다. --%>
Context path: <%= request.getContextPath() %><br>
<%-- [표현식] 요청을 처리한 서버 호스트 이름을 조회해 출력한다. --%>
Server name: <%= request.getServerName() %><br>
<%-- [표현식] 요청을 수신한 서버 포트를 조회해 출력한다. --%>
Server port: <%= request.getServerPort() %><br>
</body>
</html>
