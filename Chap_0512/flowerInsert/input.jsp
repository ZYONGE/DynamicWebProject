<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.User" %>
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꽃 정보 입력</title>
</head>
<body>
    <p><a href="../print_list/list.jsp">목록으로</a></p>
    <h2>꽃 등록 (관리자)</h2>
    <form action="process.jsp" method="post" enctype="multipart/form-data">
        꽃이름: <input type="text"   name="name"         /><br>
        원산지: <input type="text"   name="origin"       /><br>
        가격:   <input type="number" name="price"        /><br>
        등록일: <input type="date"   name="registerDate" /><br>
        이미지: <input type="file"   name="imageFile"    /><br>
        <input type="submit" value="저장" />
    </form>
</body>
</html>
