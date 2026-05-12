<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.Flower, my.model.User, my.dao.FlowerDao, my.util.ConnectionProvider, my.util.JdbcUtil, java.sql.Connection" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    User loginUser = (User) session.getAttribute("loginUser");
    if (loginUser == null) {
        response.sendRedirect("../login/login.jsp");
        return;
    }

    int flowerId = Integer.parseInt(request.getParameter("flowerId"));
    Connection conn = ConnectionProvider.getConnection();
    try {
        FlowerDao flowerDao = new FlowerDao();
        Flower flower = flowerDao.selectById(conn, flowerId);
        request.setAttribute("flower", flower);
    } finally {
        JdbcUtil.close(conn);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꽃 상세정보</title>
</head>
<body>
    <p>
        <a href="../print_list/list.jsp">목록으로</a>
        | <a href="../logout/logout.jsp">로그아웃</a>
    </p>
    <h2>꽃 상세정보</h2>
    아이디: ${flower.flowerId}<br>
    꽃이름: ${flower.name}<br>
    원산지: ${flower.origin}<br>
    가격: <fmt:formatNumber value="${flower.price}" type="number" />원<br>
    등록일: <fmt:formatDate value="${flower.registerDate}" pattern="yyyy-MM-dd" /><br>
    <img src="../images/${flower.image}" width="350" height="500" /><br><br>

    <c:if test="${not sessionScope.isAdmin}">
        <a href="../purchase/purchaseForm.jsp?flowerId=${flower.flowerId}">
            <button>이 꽃 구매하기</button>
        </a>
    </c:if>
    <c:if test="${sessionScope.isAdmin}">
        <a href="../edit/update.jsp?flowerId=${flower.flowerId}">수정</a>
        &nbsp;|&nbsp;
        <a href="../delete/delete.jsp?flowerId=${flower.flowerId}">삭제</a>
    </c:if>
</body>
</html>
