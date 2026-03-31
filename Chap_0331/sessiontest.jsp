<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessiontest.jsp</title>
</head>
<body>
    <%

        //세션이란, 웹 서버가 클라이언트의 상태를 유지하기 위해 사용하는 기술입니다.
        //세션은 클라이언트가 웹 서버에 접속할 때 생성되며, 클라이언트가 웹 서버에 접속하는 동안 유지됩니다.
        //쉽게 말해, 세션은 클라이언트와 웹 서버 간의 대화 상태를 유지하는 방법입니다.
        session.setAttribute("userName", "손흥민"); 

    %>

    userName = <%= session.getAttribute("userName") %> <br>

</body>
</html>