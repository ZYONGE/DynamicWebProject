<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, my.dao.*, my.util.*, my.model.*" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="book" class="my.model.Book"/>
<jsp:setProperty name="book" property="*"/>
<%
    Connection conn = null;
    try {
        conn = ConnectionProvider.getConnection();
        book.setPublishDate(new java.util.Date());
        BookDao dao = new BookDao();
        dao.insert(conn, book);
        response.sendRedirect("../select/list.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>입력 오류</title></head>
<body>
  <p style="color:red;">입력 실패: <%= e.getMessage() %></p>
  <a href="input.jsp">← 돌아가기</a>
</body>
</html>
<%
    } finally {
        JdbcUtil.close(conn);
    }
%>
