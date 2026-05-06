<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.Flower, my.dao.FlowerDao, my.util.ConnectionProvider, my.util.JdbcUtil, java.sql.Connection" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- list.jsp에서 삭제 버튼을 클릭하면 delete.jsp로 이동한다.
     flowerId로 꽃 정보를 조회한 후 꽃 정보를 출력한 후 삭제한다. --%>
<%
    if ("POST".equals(request.getMethod())) {
        int flowerId = Integer.parseInt(request.getParameter("flowerId"));
        Connection conn = ConnectionProvider.getConnection();
        FlowerDao flowerDao = new FlowerDao();
        flowerDao.deleteById(conn, flowerId);
        request.setAttribute("deleted", true);
    } else {
        // GET: 삭제 대상 꽃 정보 조회
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
    <c:choose>
        <c:when test="${deleted}">
            삭제가 완료되었습니다.
        </c:when>
        <c:otherwise>
            아이디: ${flower.flowerId}<br>
            꽃이름: ${flower.name}<br>
            원산지: ${flower.origin}<br>
            가격: ${flower.price}<br>
            등록일: <fmt:formatDate value="${flower.registerDate}" pattern="yyyy-MM-dd" /><br>
            <img src="../images/${flower.image}" width="100" height="140" /><br>
            <form action="delete.jsp" method="post">
                <input type="hidden" name="flowerId" value="${flower.flowerId}" />
                <input type="submit" value="삭제" />
            </form>
        </c:otherwise>
    </c:choose>
</body>
</html>
