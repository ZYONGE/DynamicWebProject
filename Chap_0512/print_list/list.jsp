<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.User, my.dao.FlowerDao, my.util.ConnectionProvider, java.sql.Connection, java.util.List" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    User loginUser = (User) session.getAttribute("loginUser");
    if (loginUser == null) {
        response.sendRedirect("../login/login.jsp");
        return;
    }
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");

    Connection conn = ConnectionProvider.getConnection();
    FlowerDao flowerDao = new FlowerDao();
    List flowerList = flowerDao.selectList(conn);
    request.setAttribute("flowerList", flowerList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꽃 목록</title>
</head>
<body>
    <p>
        <strong>${sessionScope.loginUser.name}</strong>님
        (<c:choose>
            <c:when test="${sessionScope.isAdmin}">관리자</c:when>
            <c:otherwise>사용자</c:otherwise>
        </c:choose>)
        | <a href="../logout/logout.jsp">로그아웃</a>
        <c:if test="${not sessionScope.isAdmin}">
            | <a href="../purchase/myPurchase.jsp">내 구매 내역</a>
        </c:if>
    </p>

    <c:if test="${sessionScope.isAdmin}">
        <p><a href="../flowerInsert/input.jsp">꽃 등록</a></p>
    </c:if>

    <table border="1">
        <tr>
            <th>꽃번호</th>
            <th>꽃이름</th>
            <th>원산지</th>
            <th>가격</th>
            <th>등록일</th>
            <th>이미지</th>
            <c:choose>
                <c:when test="${sessionScope.isAdmin}">
                    <th>수정</th>
                    <th>삭제</th>
                </c:when>
                <c:otherwise>
                    <th>구매</th>
                </c:otherwise>
            </c:choose>
        </tr>
        <c:forEach var="flower" items="${flowerList}">
            <tr>
                <td>${flower.flowerId}</td>
                <td>${flower.name}</td>
                <td>${flower.origin}</td>
                <td><fmt:formatNumber value="${flower.price}" type="number" />원</td>
                <td><fmt:formatDate value="${flower.registerDate}" pattern="yyyy-MM-dd" /></td>
                <td>
                    <a href="../detail/detail.jsp?flowerId=${flower.flowerId}">
                        <img src="../images/${flower.image}" width="70" height="100" />
                    </a>
                </td>
                <c:choose>
                    <c:when test="${sessionScope.isAdmin}">
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
                    </c:when>
                    <c:otherwise>
                        <td>
                            <form action="../purchase/purchaseForm.jsp" method="get">
                                <input type="hidden" name="flowerId" value="${flower.flowerId}" />
                                <input type="submit" value="구매" />
                            </form>
                        </td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
