<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, my.dao.*, my.util.*, my.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
<style>
  body { font-family: Arial, sans-serif; margin: 30px; background: #f5f5f5; }
  h2 { color: #333; }
  .top-bar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px; }
  .add-btn { padding: 8px 18px; background: #4a90d9; color: #fff;
             text-decoration: none; border-radius: 4px; }
  .add-btn:hover { background: #357abd; }
  table { border-collapse: collapse; background: #fff; width: 100%;
          box-shadow: 0 2px 6px rgba(0,0,0,0.1); }
  th { background: #4a90d9; color: #fff; padding: 10px 14px; }
  td { padding: 8px 14px; border-bottom: 1px solid #ddd; text-align: center; vertical-align: middle; }
  tr:hover td { background: #eef4ff; }
  img { border-radius: 4px; }
  a img { transition: opacity 0.2s; }
  a img:hover { opacity: 0.75; }
  .no-image { color: #aaa; font-size: 12px; }
</style>
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

<div class="top-bar">
  <h2>도서 목록</h2>
  <a href="../insert/input.jsp" class="add-btn">+ 도서 추가</a>
</div>

<table>
  <tr>
    <th>아이디</th>
    <th>도서명</th>
    <th>저자</th>
    <th>가격</th>
    <th>출판일</th>
    <th>이미지</th>
  </tr>
  <%
    if (list != null && !list.isEmpty()) {
      for (Book book : list) {
        String img = book.getBookImage();
        boolean hasImage = (img != null && !img.trim().isEmpty());
  %>
  <tr>
    <td><%= book.getBookId() %></td>
    <td><a href="detail.jsp?bookId=<%= book.getBookId() %>"><%= book.getBookName() %></a></td>
    <td><%= book.getAuthor() %></td>
    <td><%= book.getPrice() %>원</td>
    <td><%= book.getPublishDate() %></td>
    <td>
      <% if (hasImage) { %>
        <a href="detail.jsp?bookId=<%= book.getBookId() %>">
          <img src="<%= request.getContextPath() %>/images/<%= img %>"
               width="70" height="100" alt="<%= book.getBookName() %>">
        </a>
      <% } else { %>
        <span class="no-image">이미지 없음</span>
      <% } %>
    </td>
  </tr>
  <%
      }
    } else {
  %>
  <tr>
    <td colspan="6" style="padding:20px; color:#999;">등록된 도서가 없습니다.</td>
  </tr>
  <% } %>
</table>
</body>
</html>
