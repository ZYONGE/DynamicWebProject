<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.dao.BookDao, my.util.ConnectionProvider, java.sql.Connection, java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- EL을 이용하여 책의 정보를 출력한다. --%>
<%
    Connection conn = ConnectionProvider.getConnection();
    BookDao bookDao = new BookDao();
    List bookList = bookDao.selectList(conn);
    request.setAttribute("bookList", bookList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <table border="1">
        <tr>
            <th>책번호</th>
            <th>책이름</th>
            <th>저자</th>
            <th>가격</th>
            <th>출판일</th>
            <th>이미지</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
        <c:forEach var="book" items="${bookList}">
            <tr>
                <td>${book.bookId}</td>
                <td>${book.bookName}</td>
                <td>${book.author}</td>
                <td>${book.price}</td>
                <td><fmt:formatDate value="${book.publishDate}" pattern="yyyy-MM-dd" /></td>
                <td>
                    <a href="../detail/detail.jsp?bookId=${book.bookId}"><img src="../images/${book.bookImage}" width="70" height="100" /></a>
                </td>
                <td><a href="../edit/update.jsp?bookId=${book.bookId}">수정</a></td>
                <td><a href="../delete/delete.jsp?bookId=${book.bookId}">삭제</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
