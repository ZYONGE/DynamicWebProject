<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, my.dao.*, my.util.*, my.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
</head>
<body>
<%
  request.setCharacterEncoding("utf-8");
  Connection conn = null;
  List<Book> list = null;
  try {
    conn = ConnectionProvider.getConnection();
    BookDao dao = new BookDao();
    list = dao.selectList(conn);
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    JdbcUtil.close(conn);
  }
%>

<h2>도서 목록</h2>
<a href="../insert/input.jsp">도서 추가</a>
<a href="../update/input.jsp">도서 수정</a>
<br><br>

<table border="1">
  <tr>
    <th>아이디</th>
    <th>도서명</th>
    <th>저자</th>
    <th>가격</th>
    <th>출판일</th>
    <th>이미지</th>
  </tr>
  <%
    if (list != null) {
      for (Book book : list) {
  %>
  <tr>
    <td><%= book.getBookId() %></td>
    <td><a href="detail.jsp?bookId=<%= book.getBookId() %>"><%= book.getBookName() %></a></td>
    <td><%= book.getAuthor() %></td>
    <td><%= book.getPrice() %>원</td>
    <td><%= book.getPublishDate() %></td>
    <td>
      <a href="detail.jsp?bookId=<%= book.getBookId() %>">
        <img src="<%= request.getContextPath() %>/images/<%= book.getBookImage() %>" width="70" height="100">
      </a>
    </td>
  </tr>
  <%
      }
    }
  %>
</table>
</body>
</html>
