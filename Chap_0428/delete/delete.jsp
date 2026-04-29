<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.Book, my.dao.BookDao, my.util.ConnectionProvider, my.util.JdbcUtil, java.sql.Connection" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- list.jsp에서 삭제 버튼을 클릭하면 delete.jsp로 이동한다.
     bookId로 책 정보를 조회한 후 책 정보를 출력한 후 삭제한다. --%>
<%
    if ("POST".equals(request.getMethod())) {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        Connection conn = ConnectionProvider.getConnection();
        BookDao bookDao = new BookDao();
        bookDao.deleteById(conn, bookId);
        request.setAttribute("deleted", true);
    } else {
        // GET: 삭제 대상 책 정보 조회
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        Connection conn = ConnectionProvider.getConnection();
        try {
            BookDao bookDao = new BookDao();
            Book book = bookDao.selectById(conn, bookId);
            request.setAttribute("book", book);
        } finally {
            JdbcUtil.close(conn);
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <c:choose>
        <c:when test="${deleted}">
            삭제가 완료되었습니다.
        </c:when>
        <c:otherwise>
            아이디: ${book.bookId}<br>
            도서명: ${book.bookName}<br>
            저자: ${book.author}<br>
            가격: ${book.price}<br>
            출판일: <fmt:formatDate value="${book.publishDate}" pattern="yyyy-MM-dd" /><br>
            <img src="../images/${book.bookImage}" width="100" height="140" /><br>
            <form action="delete.jsp" method="post">
                <input type="hidden" name="bookId" value="${book.bookId}" />
                <input type="submit" value="삭제" />
            </form>
        </c:otherwise>
    </c:choose>
</body>
</html>
