<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="my.model.Flower, my.model.User, my.dao.FlowerDao, my.util.ConnectionProvider" %>
<%@ page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    String contentType = request.getContentType();
    if (contentType == null || !contentType.startsWith("multipart/form-data")) {
%>
    <p>잘못된 접근입니다. <a href="input.jsp">입력 폼으로 이동</a></p>
<%
    } else {
        String savePath = application.getRealPath("/Chap_0506/images/");
        int maxSize = 10 * 1024 * 1024;

        MultipartRequest multi = new MultipartRequest(
            request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy()
        );

        String name            = multi.getParameter("name");
        String origin          = multi.getParameter("origin");
        String priceStr        = multi.getParameter("price");
        String registerDateStr = multi.getParameter("registerDate");
        String imageFile       = multi.getFilesystemName("imageFile");

        if (name == null || name.trim().isEmpty() || priceStr == null
                || registerDateStr == null || registerDateStr.isEmpty()) {
%>
    <p>필수 항목이 누락되었습니다. <a href="input.jsp">입력 폼으로 이동</a></p>
<%
        } else {
            Flower flower = new Flower();
            flower.setName(name.trim());
            flower.setOrigin(origin == null ? "" : origin.trim());
            flower.setPrice(Integer.parseInt(priceStr));
            flower.setRegisterDate(java.sql.Date.valueOf(registerDateStr));
            flower.setImage(imageFile != null ? imageFile : "");

            Connection conn = ConnectionProvider.getConnection();
            FlowerDao flowerDao = new FlowerDao();
            flowerDao.insert(conn, flower);
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>꽃 등록</title></head>
<body>
    <p><strong><%= name %></strong> 꽃을 등록하였습니다.</p>
    <a href="../print_list/list.jsp">목록으로 이동</a>
</body>
</html>
<%
        }
    }
%>
