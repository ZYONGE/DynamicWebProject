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
	int flowerId=Integer.parseInt(request.getParameter("flowerId"));
	int amount=Integer.parseInt(request.getParameter("amount"));
	int price=Integer.parseInt(request.getParameter("price"));
	

	String userId=(String)session.getAttribute("LOGIN");
    Purchase purchase = new Purchase(userId,flowerId,amount,price,amount*price,new java.util.Date());
    Connection conn = ConnectionProvider.getConnection();
    try {
        PurchaseDao dao = new PurchaseDao();
        dao.insert(conn,purchase);
        PreparedStatement pstmt = conn.prepareStatement("UPDATE flower SET fav = fav + 1 WHERE flowerId = ?");
        pstmt.setInt(1, flowerId);
        pstmt.executeUpdate();
    } catch(SQLException e) {}
%>
<%=flowerId %> 구매가 완료되었습니다.
<a href="catalog.jsp">카탈로그 보기</a>
</body>
</html>