<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
from.jsp에서 출력된 부분입니다.
<%
    request.setCharacterEncoding("UTF-8");
    String userName = request.getParameter("userName");
    String userID = request.getParameter("userID");
    request.setAttribute("userName", userName);
    request.setAttribute("userID", userID);
%>
<jsp:forward page="../to/to.jsp" />

</body>
</html>