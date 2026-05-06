<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.dao.FlowerDao, my.util.ConnectionProvider, java.sql.Connection, java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    // 전체 목록 조회
    Connection conn = ConnectionProvider.getConnection();
    FlowerDao flowerDao = new FlowerDao();
    List flowerList = flowerDao.selectList(conn);
    request.setAttribute("flowerList", flowerList);

    // 검색 파라미터 처리
    String target  = request.getParameter("target");
    String keyword = request.getParameter("keyword");
    boolean searched = target != null && keyword != null && !keyword.trim().isEmpty()
                       && (target.equals("name") || target.equals("origin"));

    if (searched) {
        Connection searchConn = ConnectionProvider.getConnection();
        List searchResult = flowerDao.selectLike(searchConn, target, keyword.trim());
        request.setAttribute("searchResult", searchResult);
        request.setAttribute("searched", true);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꽃 목록</title>
</head>
<body>
    <p>
        <a href="../flowerInsert/input.jsp">꽃 등록</a>
    </p>

    <%-- 전체 목록 테이블 --%>
    <table border="1">
        <tr>
            <th>꽃번호</th>
            <th>꽃이름</th>
            <th>원산지</th>
            <th>가격</th>
            <th>등록일</th>
            <th>이미지</th>
            <th>수정</th>
            <th>삭제</th>
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
                <td>
                    <form action="../edit/update.jsp" method="get">
                        <input type="hidden" name="flowerId" value="${flower.flowerId}" />
                        <input type="submit" value="수정" />
                    </form>
                </td>
                <td>
                    <form action="../delete/delete.jsp" method="get">
                        <input type="hidden" name="flowerId" value="${flower.flowerId}" />
                        <input type="submit" value="삭제" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <hr>

    <%-- 검색 폼 --%>
    <h3>꽃 검색</h3>
    <form action="list.jsp" method="get">
        타겟<select name="target">
            <option value="name"   <%= "name".equals(target)   ? "selected" : "" %>>꽃이름</option>
            <option value="origin" <%= "origin".equals(target) ? "selected" : "" %>>원산지</option>
        </select>
        키워드<input type="text" name="keyword" value="<%= keyword != null ? keyword : "" %>" placeholder="검색어 입력" />
        <input type="submit" value="검색" />
    </form>

    <%-- 검색 결과 --%>
    <c:if test="${searched}">
        <p>검색 결과: <strong>${searchResult.size()}</strong>건</p>
        <c:choose>
            <c:when test="${not empty searchResult}">
                <table border="1">
                    <tr>
                        <th>꽃번호</th>
                        <th>꽃이름</th>
                        <th>원산지</th>
                        <th>가격</th>
                        <th>등록일</th>
                        <th>이미지</th>
                    </tr>
                    <c:forEach var="flower" items="${searchResult}">
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
            </c:when>
            <c:otherwise>
                <p>검색 결과가 없습니다.</p>
            </c:otherwise>
        </c:choose>
    </c:if>

</body>
</html>
