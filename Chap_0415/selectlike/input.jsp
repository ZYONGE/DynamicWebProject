<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색</title>
</head>
<body>
<h2>도서 검색</h2>
<form action="search.jsp" method="post">
  검색 대상:
  <select name="target">
    <option value="bookName">도서명</option>
    <option value="author">저자</option>
  </select>
  검색어: <input type="text" name="keyword">
  <input type="submit" value="검색">
</form>
<br>
<a href="../select/list.jsp">전체 목록 보기</a>
</body>
</html>
