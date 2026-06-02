<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="my.dao.LoginDao"/>
<%
 int rst = 0;
 String id = (String)request.getParameter("id");
 rst = dao.idCheck(id);
%>
<%
if(rst == 1){
%>
<img src="image/idno.png" width="290" height="166">
<!-- 아이디가 이미 존재할때 이미지 -->
<%}else{ %>
<img src="image/idok.png" width="290" height="166">
<!-- 아이디가 존재하지 않을 때 이미지 -->
<%} %>
</body>
</html>