<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.Flower, my.model.User, my.dao.FlowerDao, my.util.ConnectionProvider, my.util.JdbcUtil, java.sql.Connection, java.sql.Date" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
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
        int    flowerId        = Integer.parseInt(request.getParameter("flowerId"));
        String name            = request.getParameter("name");
        String origin          = request.getParameter("origin");
        int    price           = Integer.parseInt(request.getParameter("price"));
        String registerDateStr = request.getParameter("registerDate");
        String image           = request.getParameter("image");

        Flower flower = new Flower();
        flower.setFlowerId(flowerId);
        flower.setName(name);
        flower.setOrigin(origin);
        flower.setPrice(price);
        flower.setRegisterDate(Date.valueOf(registerDateStr));
        flower.setImage(image);

        Connection conn = ConnectionProvider.getConnection();
        FlowerDao flowerDao = new FlowerDao();
        flowerDao.update(conn, flower);

        response.sendRedirect("../print_list/list.jsp");
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
<title>꽃 정보 수정</title>
</head>
<body>
    <p><a href="../print_list/list.jsp">목록으로</a></p>
    <h2>꽃 정보 수정 (관리자)</h2>
    <form action="update.jsp" method="post">
        <input type="hidden" name="flowerId" value="${flower.flowerId}" />
        아이디: ${flower.flowerId}<br>
        꽃이름: <input type="text"   name="name"         value="${flower.name}" /><br>
        원산지: <input type="text"   name="origin"       value="${flower.origin}" /><br>
        가격:   <input type="number" name="price"        value="${flower.price}" /><br>
        등록일: <input type="date"   name="registerDate" value="<fmt:formatDate value='${flower.registerDate}' pattern='yyyy-MM-dd' />" /><br>
        이미지: <input type="text"   name="image"        value="${flower.image}" /><br>
        <input type="submit" value="수정" />
    </form>
</body>
</html>
