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
    String pageAtt = (String) pageContext.getAttribute("pageAtt");
    String requestAtt = (String) request.getAttribute("requestAtt");
    String sessionAtt = (String) session.getAttribute("sessionAtt");
    String applAtt = (String) application.getAttribute("applicationAtt");
    %>

pageAtt = <%= pageAtt %><br>
requestAtt = <%= requestAtt %><br>
sessionAtt = <%= sessionAtt %><br>
applicationAtt = <%= applAtt %><br>
</body>
</html>
