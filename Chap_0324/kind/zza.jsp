<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>짜장면</title>
</head>
<body>

<%= request.getParameter("customer") %> 님, 짜장면을 
<%= request.getParameter("amount") %> 그릇 주문하셨군요, 
품질은 <%= request.getAttribute("QUAL") %> 으로 신청하셨어요.
맛은 <%= request.getAttribute("TASTY") %> 으로 신청하셨어요.
맛있게 드세요. <br><hr><br>

<img alt="짜장면" src="../images/zza.jpeg" width="200" height="200"><br><hr><br>

</body>
</html>