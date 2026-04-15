<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, my.dao.*, my.util.*, my.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세 정보</title>
</head>
<body>
<%
  Connection conn = null;
  Book book = null;
  try {
    int bookId = Integer.parseInt(request.getParameter("bookId"));
    conn = ConnectionProvider.getConnection();
    BookDao dao = new BookDao();
    book = dao.selectById(conn, bookId);
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    JdbcUtil.close(conn);
  }
%>

<h2>도서 상세 정보</h2>
<% if (book != null) { %>
  <img src="<%= request.getContextPath() %>/images/<%= book.getBookImage() %>" width="140" height="200">
  <br>
  <table border="1">
    <tr><td>도서 ID</td><td><%= book.getBookId() %></td></tr>
    <tr><td>도서명</td><td><%= book.getBookName() %></td></tr>
    <tr><td>저자</td><td><%= book.getAuthor() %></td></tr>
    <tr><td>가격</td><td><%= book.getPrice() %>원</td></tr>
    <tr><td>출판일</td><td><%= book.getPublishDate() %></td></tr>
  </table>
<% } %>
<br>
<a href="list.jsp">목록으로</a>
</body>
</html>
