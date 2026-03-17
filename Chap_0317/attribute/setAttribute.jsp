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
    pageContext.setAttribute("pageAtt", "JSP 페이지 속성");
    request.setAttribute("requestAtt", "request 속성");
    session.setAttribute("sessionAtt", "session 속성");
    application.setAttribute("applicationAtt", "application 속성");
    %>

속성정의를 완료함<br>
</body>
</html>
