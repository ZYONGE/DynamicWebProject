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
    Cart cart = null;
    Integer flowerCount = (Integer)session.getAttribute("flowerCount");
    if(flowerCount == null) flowerCount = 0;
    int flowerId = 0;
    int amount = 0;
    String userId = (String)session.getAttribute("LOGIN");
    Purchase purchase = null;
    Connection conn = ConnectionProvider.getConnection();
    PurchaseDao dao = new PurchaseDao();
    FlowerDao fdao = new FlowerDao();
    Flower flower = null;
    try {
        for(int i=1; i<=flowerCount; i++){  // i=0 → i=1 수정
            cart = (Cart)session.getAttribute("flower" + i);  // folower → flower 수정
            if(cart == null) continue;  // null 체크 추가
            flowerId = cart.getFlowerId();
            amount = cart.getAmount();
            flower = fdao.selectById(conn, flowerId);
            if(flower == null) continue;  // null 체크 추가
            purchase = new Purchase(userId, flowerId, amount, flower.getPrice(), amount*flower.getPrice(), new java.util.Date());
            dao.insert(conn, purchase);
        }
        // 구매 완료 후 세션 카트 비우기
        for(int i=1; i<=flowerCount; i++){
            session.removeAttribute("flower" + i);
        }
        session.removeAttribute("flowerCount");
    } catch(SQLException e) {
        e.printStackTrace();
    } finally {
        JdbcUtil.close(conn);
    }
%>
구매가 완료되었습니다.
<a href="catalog.jsp">카탈로그 보기</a>
</body>
</html>