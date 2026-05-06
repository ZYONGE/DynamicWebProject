<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.Flower, my.dao.FlowerDao, my.util.ConnectionProvider, my.util.JdbcUtil, java.sql.Connection, java.sql.Date" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<%-- list.jsp에서 수정 버튼을 클릭하면 update.jsp로 이동한다.
     flowerId로 꽃 정보를 조회한 후 폼을 출력하고, 수정 버튼을 클릭하면 수정한다. --%>
<%
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

    // GET: 현재 꽃 정보 조회
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
