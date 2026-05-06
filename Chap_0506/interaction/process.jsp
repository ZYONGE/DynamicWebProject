<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.Flower, my.dao.FlowerDao, my.util.ConnectionProvider, java.sql.Connection, java.sql.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<%-- input.jsp에서 전달받은 데이터를 flower 객체에 저장 후 완료 메세지를 출력. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꽃 등록</title>
</head>
<body>
<%
    String name            = request.getParameter("name");
    String origin          = request.getParameter("origin");
    String priceStr        = request.getParameter("price");
    String registerDateStr = request.getParameter("registerDate");
    String image           = request.getParameter("image");

    if (name == null || priceStr == null || registerDateStr == null) {
%>
    <p>잘못된 접근입니다. <a href="input.jsp">입력 폼으로 이동</a></p>
<%
    } else {
        int price = Integer.parseInt(priceStr);

        Flower flower = new Flower();
        flower.setName(name);
        flower.setOrigin(origin);
        flower.setPrice(price);
        flower.setRegisterDate(Date.valueOf(registerDateStr));
        flower.setImage(image);

        Connection conn = ConnectionProvider.getConnection();
        FlowerDao flowerDao = new FlowerDao();
        flowerDao.insert(conn, flower);
%>
    꽃 등록이 완료되었습니다.
<%
    }
%>
</body>
</html>
