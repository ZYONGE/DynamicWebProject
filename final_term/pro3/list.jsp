<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*,java.util.*,my.model.*,my.dao.*,my.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>악기 목록</title>
</head>
<body>
<%
    List<Instrument> list = null;
    request.setCharacterEncoding("utf-8");
    String target = request.getParameter("target");
    String keyword = request.getParameter("keyword");
    Connection conn = ConnectionProvider.getConnection();
    try {
        InstrumentDao dao = new InstrumentDao();
        if (target == null || keyword == null || keyword.trim().isEmpty()) {
            list = dao.selectList(conn);
        } else {
            list = dao.selectLike(conn, target, keyword);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        JdbcUtil.close(conn);
    }
%>
<c:set var="list" value="<%=list %>"/>
<c:if test="${list != null}">
<table border="1">
<tr>
  <th>아이디</th>
  <th>이름</th>
  <th>가격</th>
  <th>특징</th>
  <th>등록일</th>
  <th>이미지</th>
  <th>삭제</th>
</tr>
<c:forEach var="inst" items="${list}">
<tr>
  <td>${inst.id}</td>
  <td><a href="#">${inst.name}</a></td>
  <td>${inst.price}</td>
  <td>${inst.desc}</td>
  <td><fmt:formatDate value="${inst.registertime}" pattern="yyyy-MM-dd HH:mm:ss.S"/></td>
  <td>
    <a href="${pageContext.request.contextPath}/pro4/updateForm.jsp?id=${inst.id}">
      <img src="${pageContext.request.contextPath}/images/instrument_imgaes/${inst.image}" width="70" height="100">
    </a>
  </td>
  <td>
    <button type="button"
      onclick="location.href='${pageContext.request.contextPath}/pro3/delete.jsp?id=${inst.id}'">삭제</button>
  </td>
</tr>
</c:forEach>
<tr>
  <td colspan="7">
    <form action="" method="post">
      검색 대상:
      <select name="target">
        <option value="name">이름</option>
        <option value="desc">특징</option>
      </select>
      검색어: <input type="text" name="keyword" value="${param.keyword}">
      <input type="submit" value="검색">
    </form>
  </td>
</tr>
</table>
</c:if>
</body>
</html>

