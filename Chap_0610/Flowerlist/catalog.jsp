<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*,java.util.*,my.model.*,my.dao.*,my.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   List<Flower> list = null;
   request.setCharacterEncoding("utf-8");
   String target = request.getParameter("target");
   String keyword = request.getParameter("keyword");
   String orderBy = request.getParameter("orderBy");
   String sortDir = request.getParameter("sortDir");
   if (orderBy == null) orderBy = "fav";
   if (sortDir == null) sortDir = "DESC";
   Connection conn = ConnectionProvider.getConnection();
   try {
      FlowerDao dao = new FlowerDao();
      if (target == null || keyword == null || keyword.trim().isEmpty()) {
         list = dao.selectListSorted(conn, orderBy, sortDir);
      } else {
         list = dao.selectLikeSorted(conn, target, keyword, orderBy, sortDir);
      }
   }
   catch(SQLException e) {
      e.printStackTrace();
   } finally {
      JdbcUtil.close(conn);
   }
%>
사용자 아이디: ${LOGIN } <br><hr><br>
<c:set var="list" value="<%=list %>"/>
<c:if test="${list != null}">
<table border="1">
<tr>
<th>아이디</th><th>꽃이름</th><th>원산지</th><th>가격</th><th>등록일</th><th>이미지</th><th>상세보기</th><th>구매하기</th>
</tr>
<c:forEach var="flower" items="${list}">
<tr>
<td>${flower.flowerId}</td><td>${flower.name}</td><td>${flower.origin}</td><td>${flower.price}</td>
<td><fmt:formatDate value="${flower.registerDate}" pattern="yyyy년 MM월 dd일"/></td>
<td>
<a href="detail.jsp?flowerId=${flower.flowerId}"><img src="${pageContext.request.contextPath}/Chap_0610/images/${flower.image}" width="70" height="100"></a></td>
<td>
   <button type="button" onclick="location.href='detail.jsp?flowerId=${flower.flowerId}'" value="상세보기">상세보기</button>
</td>
<td>
   <button type="button" onclick="location.href='purchaseForm.jsp?flowerId=${flower.flowerId}'" value="구매하기">구매하기</button>
</td>
</tr>
</c:forEach>
<tr>
<td colspan="8">
<form action="" method="get">
타겟: <select name="target">
   <option value="name">꽃이름</option>
   <option value="origin">원산지</option>
</select>
검색어: <input type="text" name="keyword">
<input type="hidden" name="orderBy" value="<%=orderBy%>">
<input type="hidden" name="sortDir" value="<%=sortDir%>">
<input type="submit" value="검색">
</form>
</td>
</tr>
</table>


<form action="" method="get">
정렬 기준:
<select name="orderBy">
   <option value="fav" <%="fav".equals(orderBy) ? "selected" : ""%>>선호도</option>
   <option value="price" <%="price".equals(orderBy) ? "selected" : ""%>>가격</option>
   <option value="registerDate" <%="registerDate".equals(orderBy) ? "selected" : ""%>>출시일</option>
</select>
정렬 방향:
<select name="sortDir">
   <option value="DESC" <%="DESC".equals(sortDir) ? "selected" : ""%>>내림차순</option>
   <option value="ASC" <%="ASC".equals(sortDir) ? "selected" : ""%>>오름차순</option>
</select>
<%if (target != null && keyword != null && !keyword.trim().isEmpty()) {%>
<input type="hidden" name="target" value="<%=target%>">
<input type="hidden" name="keyword" value="<%=keyword%>">
<%}%>
<input type="submit" value="정렬">
</form>
</c:if>
</body>
</html>
