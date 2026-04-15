<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, my.dao.*, my.util.*, my.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색 결과</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String target  = request.getParameter("target");
    String keyword = request.getParameter("keyword");
    List<Book> list = null;
    Connection conn = null;
    try {
        conn = ConnectionProvider.getConnection();
        BookDao dao = new BookDao();
        list = dao.selectLike(conn, target, keyword);
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        JdbcUtil.close(conn);
    }
%>

<h2>도서 검색 결과</h2>
검색 대상: <%= target %> | 검색어: <%= keyword %>
<br><br>

<table border="1">
  <tr>
    <th>아이디</th>
    <th>도서명</th>
    <th>저자</th>
    <th>가격</th>
    <th>출판일</th>
    <th>이미지</th>
    <th>상세</th>
  </tr>
  <%
    if (list != null) {
      for (Book book : list) {
  %>
  <tr>
    <td><%= book.getBookId() %></td>
    <td><%= book.getBookName() %></td>
    <td><%= book.getAuthor() %></td>
    <td><%= book.getPrice() %>원</td>
    <td><%= book.getPublishDate() %></td>
    <td><img src="<%= request.getContextPath() %>/images/<%= book.getBookImage() %>" width="70" height="100"></td>
    <td><a href="../select/detail.jsp?bookId=<%= book.getBookId() %>">상세보기</a></td>
  </tr>
  <%
      }
    }
  %>
</table>

<br>
<a href="input.jsp">다시 검색</a>
&nbsp;|&nbsp;
<a href="../select/list.jsp">전체 목록</a>
</body>
</html>
