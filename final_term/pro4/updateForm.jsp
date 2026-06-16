<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>악기 정보 수정</title>
</head>
<body>
<%
    String idParam = request.getParameter("id");
    if (idParam == null) {
        response.sendRedirect(request.getContextPath() + "/pro3/list.jsp");
        return;
    }
    int id = Integer.parseInt(idParam);
    Instrument inst = null;
    Connection conn = ConnectionProvider.getConnection();
    try {
        InstrumentDao dao = new InstrumentDao();
        inst = dao.selectById(conn, id);
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        JdbcUtil.close(conn);
    }
%>
<c:set var="inst" value="<%=inst %>"/>
<c:if test="${inst != null}">
<form action="update.jsp" method="post">
아이디: <input type="text" id="id" name="id" value="${inst.id}" readonly><br>
악기명: <input type="text" id="name" name="name" value="${inst.name}"><br>
가격: <input type="text" id="price" name="price" value="${inst.price}"><br>
특징: <input type="text" id="desc" name="desc" value="${inst.desc}"><br>
이미지: <input type="text" id="image" name="image" value="${inst.image}"><br>
<input type="submit" value="수정하기">
</form>
</c:if>
</body>
</html>
