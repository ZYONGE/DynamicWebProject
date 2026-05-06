<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.Flower, my.dao.FlowerDao, my.util.ConnectionProvider, my.util.JdbcUtil, java.sql.Connection" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- list.jsp에서 이미지를 클릭하면 세부정보를 표시하는 detail.jsp로 이동한다.
     list.jsp에서 전달받은 flowerId로 꽃 정보를 조회한 후 EL로 출력한다. --%>
<%
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
    아이디: ${flower.flowerId}<br>
    꽃이름: ${flower.name}<br>
    원산지: ${flower.origin}<br>
    가격: ${flower.price}<br>
    등록일: <fmt:formatDate value="${flower.registerDate}" pattern="yyyy-MM-dd" /><br>
    <img src="../images/${flower.image}" width="350" height="500" />
</body>
</html>
