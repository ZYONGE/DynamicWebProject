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
        response.sendRedirect(request.getContextPath() + "/Chap_0610/Flowerlist/catalog.jsp");
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
<form action="purchase.jsp" method="post">
꽃아이디:<input type=text name="flowerId" value="${flower.flowerId}">
가격:<input type=text name="price" value="${flower.price}">
수량:<select name="amount">
	<option value="1">1개</option>
	<option value="2">2개</option>
	<option value="3">3개</option>
	<option value="4">4개</option>
</select>
<input type="submit" value="구매하기">
<input type="button" onclick="putcart(form)" value="카트담기">
</form><br><hr><br>


<img src="${pageContext.request.contextPath}/Chap_0610/images/${flower.image}" width="350" height="500"><br>

</c:if>
<a href="catalog.jsp">카탈로그 보기</a>
<script>

function putcart(frm){
	var amount = frm.amount.value.trim();
	var flowerid = frm.flowerId.value.trim(); 
	window.open("putcart.jsp?flowerId="+flowerid+"&amount="+amount,"","width=500, height=300");
}
</script>

</body>
</html>