<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.dao.FlowerDao, my.util.ConnectionProvider, java.sql.Connection, java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 꽃 이름(name) 또는 원산지(origin) 기준 LIKE 검색.
     target 파라미터는 selectLike()에서 WHERE 절 컬럼명으로 사용됨. --%>
<%
    String target  = request.getParameter("target");
    String keyword = request.getParameter("keyword");
    boolean searched = (target != null && keyword != null && !keyword.trim().isEmpty());

    if (searched) {
        // target은 "name" 또는 "origin" 고정값만 허용 (SQL 컬럼명 직접 삽입 방어)
        if (!target.equals("name") && !target.equals("origin")) {
            searched = false;
        }
    }

    if (searched) {
        Connection conn = ConnectionProvider.getConnection();
        FlowerDao flowerDao = new FlowerDao();
        List flowerList = flowerDao.selectLike(conn, target, keyword.trim());
        request.setAttribute("flowerList", flowerList);
        request.setAttribute("searched", true);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꽃 검색</title>
</head>
<body>
    <h3>꽃 검색</h3>

    <form action="search.jsp" method="get">
        <select name="target">
            <option value="name"   <%= "name".equals(target)   ? "selected" : "" %>>꽃이름</option>
            <option value="origin" <%= "origin".equals(target) ? "selected" : "" %>>원산지</option>
        </select>
        <input type="text" name="keyword" value="<%= keyword != null ? keyword : "" %>" placeholder="검색어 입력" />
        <input type="submit" value="검색" />
    </form>

    <c:if test="${searched}">
        <p>검색 결과: <strong>${flowerList.size()}</strong>건</p>
    </c:if>

    <c:if test="${not empty flowerList}">
        <table border="1">
            <tr>
                <th>꽃번호</th>
                <th>꽃이름</th>
                <th>원산지</th>
                <th>가격</th>
                <th>등록일</th>
                <th>이미지</th>
            </tr>
            <c:forEach var="flower" items="${flowerList}">
                <tr>
                    <td>${flower.flowerId}</td>
                    <td>${flower.name}</td>
                    <td>${flower.origin}</td>
                    <td>${flower.price}</td>
                    <td><fmt:formatDate value="${flower.registerDate}" pattern="yyyy-MM-dd" /></td>
                    <td>
                        <a href="../detail/detail.jsp?flowerId=${flower.flowerId}">
                            <img src="../images/${flower.image}" width="70" height="100" />
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${searched and empty flowerList}">
        <p>검색 결과가 없습니다.</p>
    </c:if>

    <br>
    <a href="../print_list/list.jsp">전체 목록</a>
    &nbsp;|&nbsp;
    <a href="../flowerInsert/input.jsp">꽃 등록</a>
</body>
</html>
