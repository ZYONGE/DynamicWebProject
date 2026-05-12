<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.User, my.model.Purchase, my.dao.PurchaseDao, my.util.ConnectionProvider, my.util.JdbcUtil, java.sql.Connection, java.util.List" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    User loginUser = (User) session.getAttribute("loginUser");
    if (loginUser == null) {
        response.sendRedirect("../login/login.jsp");
        return;
    }

    Connection conn = ConnectionProvider.getConnection();
    List<Purchase> purchaseList = null;
    try {
        PurchaseDao purchaseDao = new PurchaseDao();
        purchaseList = purchaseDao.selectByUserId(conn, loginUser.getUserId());
    } finally {
        JdbcUtil.close(conn);
    }
    request.setAttribute("purchaseList", purchaseList);

    String success = request.getParameter("success");
    if ("1".equals(success)) {
        request.setAttribute("successMsg", true);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 구매 내역</title>
</head>
<body>
    <h2>내 구매 내역</h2>
    <p>안녕하세요, <strong>${sessionScope.loginUser.name}</strong>님 | <a href="../logout/logout.jsp">로그아웃</a></p>

    <c:if test="${successMsg}">
        <p style="color:green;"><strong>구매가 완료되었습니다!</strong></p>
    </c:if>

    <c:choose>
        <c:when test="${not empty purchaseList}">
            <table border="1">
                <tr>
                    <th>구매번호</th>
                    <th>꽃번호</th>
                    <th>수량</th>
                    <th>결제 예정일</th>
                    <th>구매일</th>
                </tr>
                <c:forEach var="p" items="${purchaseList}">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.flowerId}</td>
                        <td>${p.amount}</td>
                        <td><fmt:formatDate value="${p.payment}" pattern="yyyy-MM-dd" /></td>
                        <td><fmt:formatDate value="${p.purchaseDate}" pattern="yyyy-MM-dd" /></td>
                    </tr>
                </c:forEach>
            </table>
        </c:when>
        <c:otherwise>
            <p>구매 내역이 없습니다.</p>
        </c:otherwise>
    </c:choose>

    <br>
    <a href="../print_list/list.jsp">꽃 목록으로</a>
</body>
</html>
