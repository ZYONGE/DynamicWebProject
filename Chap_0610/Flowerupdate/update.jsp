<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*,java.util.*,my.model.*,my.dao.*,my.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="flower" class="my.model.Flower"/>
<jsp:setProperty property="*" name="flower"/>
<%
	
    Connection conn = ConnectionProvider.getConnection();
	flower.setRegisterDate(new java.util.Date());
    try {
        FlowerDao dao = new FlowerDao();
        dao.update(conn,flower);
    } catch(SQLException e) {}
%>
꽃정보 수정이 완료되었습니다.
<jsp:forward page="../Flowerlist/list.jsp"/>

</body>
</html>