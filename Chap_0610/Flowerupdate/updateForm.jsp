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
<%
    String flowerIdParam = request.getParameter("flowerId");
    if (flowerIdParam == null) {
        response.sendRedirect(request.getContextPath() + "/Chap_0610/Flowerlist/list.jsp");
        return;
    }
	int flowerId = Integer.parseInt(flowerIdParam);
    Flower flower = null;
    Connection conn = ConnectionProvider.getConnection();
    try {
        FlowerDao dao = new FlowerDao();
        flower = dao.selectById(conn,flowerId);
    } catch(SQLException e) {}
%>
<c:set var="flower" value="<%= flower %>"/>
<c:if test="${flower != null }">
<form action="update.jsp" method="post">
꽃아이디:<input type="text" name="flowerId" value="${flower.flowerId }">
꽃이름:<input type="text" name="name" value="${flower.name }">
원산지:<input type="text" name="origin" value="${flower.origin }">
가격:<input type="text" name="price" value="${flower.price }">
이미지:<input type="text" name="image" value="${flower.image }">
<input type="submit" value="수정">
</form>

</c:if>
</body>
</html>