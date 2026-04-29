<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.Book, my.dao.BookDao, my.util.ConnectionProvider, java.sql.Connection, java.sql.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<%-- input.jsp에서 전달받은 데이터를 book 객체에 저장후, 완료 메세지를 출력. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String bookName    = request.getParameter("bookName");
    String author      = request.getParameter("author");
    int    price       = Integer.parseInt(request.getParameter("price"));
    String publishDateStr = request.getParameter("publishDate");
    String bookImage   = request.getParameter("bookImage");

    Book book = new Book();
    book.setBookName(bookName);
    book.setAuthor(author);
    book.setPrice(price);
    book.setPublishDate(Date.valueOf(publishDateStr));
    book.setBookImage(bookImage);

    Connection conn = ConnectionProvider.getConnection();
    BookDao bookDao = new BookDao();
    bookDao.insert(conn, book);
%>
    도서 등록이 완료되었습니다.
</body>
</html>
