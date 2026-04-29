<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.Book, my.dao.BookDao, my.util.ConnectionProvider, my.util.JdbcUtil, java.sql.Connection, java.sql.Date" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<%-- list.jsp에서 수정 버튼을 클릭하면 update.jsp로 이동한다.
     bookId로 책 정보를 조회한 후 폼을 출력하고, 수정 버튼을 클릭하면 수정한다. --%>
<%
    if ("POST".equals(request.getMethod())) {
        int    bookId        = Integer.parseInt(request.getParameter("bookId"));
        String bookName      = request.getParameter("bookName");
        String author        = request.getParameter("author");
        int    price         = Integer.parseInt(request.getParameter("price"));
        String publishDateStr= request.getParameter("publishDate");
        String bookImage     = request.getParameter("bookImage");

        Book book = new Book();
        book.setBookId(bookId);
        book.setBookName(bookName);
        book.setAuthor(author);
        book.setPrice(price);
        book.setPublishDate(Date.valueOf(publishDateStr));
        book.setBookImage(bookImage);

        Connection conn = ConnectionProvider.getConnection();
        BookDao bookDao = new BookDao();
        bookDao.update(conn, book);

        response.sendRedirect("../print_list/list.jsp");
        return;
    }

    // GET: 현재 책 정보 조회
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
    <form action="update.jsp" method="post">
        <input type="hidden" name="bookId" value="${book.bookId}" />
        아이디: ${book.bookId}<br>
        도서명: <input type="text"   name="bookName"    value="${book.bookName}" /><br>
        저자:   <input type="text"   name="author"      value="${book.author}" /><br>
        가격:   <input type="number" name="price"       value="${book.price}" /><br>
        출판일: <input type="date"   name="publishDate" value="<fmt:formatDate value='${book.publishDate}' pattern='yyyy-MM-dd' />" /><br>
        이미지: <input type="text"   name="bookImage"   value="${book.bookImage}" /><br>
        <input type="submit" value="수정" />
    </form>
</body>
</html>
