<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, my.dao.*, my.util.*, my.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세 정보</title>
<style>
  body { font-family: Arial, sans-serif; margin: 30px; background: #f5f5f5; }
  .card { background: #fff; padding: 30px; max-width: 480px;
          border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.12); }
  .card h2 { margin-top: 0; color: #333; }
  .card table { width: 100%; border-collapse: collapse; }
  .card td { padding: 8px 4px; border-bottom: 1px solid #eee; }
  .card td:first-child { color: #666; width: 80px; }
  .book-img { margin: 16px 0; }
  .back-btn { display: inline-block; margin-top: 20px; padding: 8px 18px;
              background: #4a90d9; color: #fff; text-decoration: none;
              border-radius: 4px; }
  .back-btn:hover { background: #357abd; }
</style>
</head>
<body>

<%
  Connection conn = null;
  Book book = null;
  String errorMsg = null;

  try {
    String bookIdParam = request.getParameter("bookId");
    if (bookIdParam == null || bookIdParam.isEmpty()) {
      errorMsg = "bookId 파라미터가 없습니다.";
    } else {
      int bookId = Integer.parseInt(bookIdParam);
      conn = ConnectionProvider.getConnection();
      BookDao dao = new BookDao();
      book = dao.selectById(conn, bookId);
      if (book == null) {
        errorMsg = "해당 도서를 찾을 수 없습니다. (bookId=" + bookId + ")";
      }
    }
  } catch (NumberFormatException e) {
    errorMsg = "잘못된 bookId 형식입니다.";
  } catch (SQLException e) {
    e.printStackTrace();
    errorMsg = "DB 오류: " + e.getMessage();
  } finally {
    JdbcUtil.close(conn);
  }

  String img = (book != null) ? book.getBookImage() : null;
  boolean hasImage = (img != null && !img.trim().isEmpty());
%>

<% if (errorMsg != null) { %>
  <div class="card">
    <h2>오류</h2>
    <p style="color:red;"><%= errorMsg %></p>
    <a href="list.jsp" class="back-btn">← 목록으로</a>
  </div>
<% } else { %>
  <div class="card">
    <h2>도서 상세 정보</h2>
    <% if (hasImage) { %>
    <div class="book-img">
      <img src="<%= request.getContextPath() %>/images/<%= img %>"
           width="140" height="200" alt="<%= book.getBookName() %>">
    </div>
    <% } %>
    <table>
      <tr><td>도서 ID</td><td><%= book.getBookId() %></td></tr>
      <tr><td>도서명</td><td><strong><%= book.getBookName() %></strong></td></tr>
      <tr><td>저자</td><td><%= book.getAuthor() %></td></tr>
      <tr><td>가격</td><td><%= book.getPrice() %>원</td></tr>
      <tr><td>출판일</td><td><%= book.getPublishDate() %></td></tr>
      <tr><td>이미지</td><td><%= hasImage ? img : "없음" %></td></tr>
    </table>
    <a href="list.jsp" class="back-btn">← 목록으로</a>
  </div>
<% } %>

</body>
</html>
