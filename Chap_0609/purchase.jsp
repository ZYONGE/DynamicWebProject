<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.Purchase,my.dao.*,my.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 완료</title>
</head>
<body>
<%
    String userId = (String) session.getAttribute("LOGIN");
    if (userId == null) userId = "guest";

    int flowerId = Integer.parseInt(request.getParameter("flowerId"));
    int price    = Integer.parseInt(request.getParameter("price"));
    int amount   = Integer.parseInt(request.getParameter("amount"));

    Connection conn = null;
    try {
        conn = ConnectionProvider.getConnection();
        Purchase purchase = new Purchase(userId, flowerId, amount, price, amount * price, new java.util.Date());
        new PurchaseDao().insert(conn, purchase);
        conn.commit();
%>
<h2>구매가 완료되었습니다!</h2>
<p>꽃 ID: <%= flowerId %> / 수량: <%= amount %>개 / 단가: <%= price %>원 / 합계: <%= amount * price %>원</p>
<%
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<h3 style='color:red;'>오류가 발생했습니다: " + e.getMessage() + "</h3>");
    } finally {
        JdbcUtil.close(conn);
    }
%>
<br>
<a href="purchaseForm.jsp">다시 구매하기</a>
</body>
</html>
