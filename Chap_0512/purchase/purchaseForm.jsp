<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.Flower, my.model.User, my.dao.FlowerDao, my.util.ConnectionProvider, my.util.JdbcUtil, java.sql.Connection" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    User loginUser = (User) session.getAttribute("loginUser");
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (loginUser == null) {
        response.sendRedirect("../login/login.jsp");
        return;
    }
    if (Boolean.TRUE.equals(isAdmin)) {
        response.sendRedirect("../print_list/list.jsp");
        return;
    }

    String flowerIdStr = request.getParameter("flowerId");
    if (flowerIdStr == null) {
        response.sendRedirect("../print_list/list.jsp");
        return;
    }
    int flowerId = Integer.parseInt(flowerIdStr);
    Connection conn = ConnectionProvider.getConnection();
    Flower flower = null;
    try {
        FlowerDao flowerDao = new FlowerDao();
        flower = flowerDao.selectById(conn, flowerId);
    } finally {
        JdbcUtil.close(conn);
    }
    if (flower == null) {
        response.sendRedirect("../print_list/list.jsp");
        return;
    }
    request.setAttribute("flower", flower);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꽃 구매</title>
</head>
<body>
    <h2>꽃 구매</h2>
    <p>구매자: ${sessionScope.loginUser.name}</p>
    <hr>
    <p>꽃번호: ${flower.flowerId}</p>
    <p>꽃이름: ${flower.name}</p>
    <p>원산지: ${flower.origin}</p>
    <p>가격: <fmt:formatNumber value="${flower.price}" type="number" />원</p>
    <img src="../images/${flower.image}" width="150" height="210" /><br><br>

    <form action="purchaseProcess.jsp" method="post">
        <input type="hidden" name="flowerId" value="${flower.flowerId}" />
        수량: <input type="number" name="amount" min="1" value="1" required /><br>
        결제 예정일: <input type="date" name="payment" required /><br>
        <input type="submit" value="구매하기" />
    </form>
    <br>
    <a href="../detail/detail.jsp?flowerId=${flower.flowerId}">상세보기로 돌아가기</a>
    &nbsp;|&nbsp;
    <a href="../print_list/list.jsp">목록으로</a>
</body>
</html>
