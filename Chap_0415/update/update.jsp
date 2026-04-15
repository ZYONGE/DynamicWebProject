<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, my.util.*" %>
<%
    request.setCharacterEncoding("utf-8");
    int bookId = Integer.parseInt(request.getParameter("bookId"));
    String bookName = request.getParameter("bookName");
    String author = request.getParameter("author");
    String bookImage = request.getParameter("bookImage");

    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        conn = ConnectionProvider.getConnection();
        pstmt = conn.prepareStatement(
            "update book set bookName=?, author=?, bookImage=? where bookId=?");
        pstmt.setString(1, bookName);
        pstmt.setString(2, author);
        pstmt.setString(3, bookImage);
        pstmt.setInt(4, bookId);
        pstmt.executeUpdate();
        response.sendRedirect("../select/list.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수정 오류</title>
</head>
<body>
    <p>수정 실패: <%= e.getMessage() %></p>
    <a href="input.jsp?bookId=<%= bookId %>">돌아가기</a>
</body>
</html>
<%
    } finally {
        JdbcUtil.close(pstmt);
        JdbcUtil.close(conn);
    }
%>
