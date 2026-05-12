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
    if (!Boolean.TRUE.equals(isAdmin)) {
        response.sendRedirect("../print_list/list.jsp");
        return;
    }

    if ("POST".equals(request.getMethod())) {
        int flowerId = Integer.parseInt(request.getParameter("flowerId"));
        Connection conn = ConnectionProvider.getConnection();
        FlowerDao flowerDao = new FlowerDao();
        flowerDao.deleteById(conn, flowerId);
        request.setAttribute("deleted", true);
    } else {
        int flowerId = Integer.parseInt(request.getParameter("flowerId"));
        Connection conn = ConnectionProvider.getConnection();
        try {
            FlowerDao flowerDao = new FlowerDao();
            Flower flower = flowerDao.selectById(conn, flowerId);
            request.setAttribute("flower", flower);
        } finally {
            JdbcUtil.close(conn);
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꽃 삭제</title>
</head>
<body>
    <p><a href="../print_list/list.jsp">목록으로</a></p>
    <c:choose>
        <c:when test="${deleted}">
            <p>삭제가 완료되었습니다.</p>
            <a href="../print_list/list.jsp">목록으로 이동</a>
        </c:when>
        <c:otherwise>
            <h2>꽃 삭제 확인 (관리자)</h2>
            아이디: ${flower.flowerId}<br>
            꽃이름: ${flower.name}<br>
            원산지: ${flower.origin}<br>
            가격: <fmt:formatNumber value="${flower.price}" type="number" />원<br>
            등록일: <fmt:formatDate value="${flower.registerDate}" pattern="yyyy-MM-dd" /><br>
            <img src="../images/${flower.image}" width="100" height="140" /><br>
            <form action="delete.jsp" method="post">
                <input type="hidden" name="flowerId" value="${flower.flowerId}" />
                <input type="submit" value="삭제 확인" />
            </form>
        </c:otherwise>
    </c:choose>
</body>
</html>
