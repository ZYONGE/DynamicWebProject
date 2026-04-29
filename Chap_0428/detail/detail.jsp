<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.Book, my.dao.BookDao, my.util.ConnectionProvider, my.util.JdbcUtil, java.sql.Connection" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- list.jsp에서 이미지를 클릭하면 세부정보를 표시하는 detail.jsp로 이동한다.
     list.jsp에서 전달받은 bookId로 책 정보를 조회한 후 EL로 출력한다. --%>
<%
    int bookId = Integer.parseInt(request.getParameter("bookId"));
    Connection conn = ConnectionProvider.getConnection();
    try {
        BookDao bookDao = new BookDao();
        Book book = bookDao.selectById(conn, bookId);
        request.setAttribute("book", book);
    } finally {
        JdbcUtil.close(conn);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    아이디: ${book.bookId}<br>
    도서명: ${book.bookName}<br>
    저자: ${book.author}<br>
    가격: ${book.price}<br>
    출판일: <fmt:formatDate value="${book.publishDate}" pattern="yyyy-MM-dd" /><br>
    <img src="../images/${book.bookImage}" width="350" height="500" />
</body>
</html>
