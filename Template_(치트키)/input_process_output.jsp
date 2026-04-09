<%-- input.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
사용자 정보를 입력하세요. <br><hr>
<form action="process.jsp" method="post" accept-charset="UTF-8">
	도서명: <input type="text" name="bookName" size="10" value="boyhood"><br>
    저자: <input type="text" name="author" size="10" value="JohnGreen"><br>
	<input type="submit" value="입력">
</form>
</body>
</html>

<%-- process.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import = "java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String bookName = request.getParameter("bookName");
    String author = request.getParameter("author");
    String urlBookName = URLEncoder.encode(bookName, "UTF-8");
    String urlAuthor = URLEncoder.encode(author, "UTF-8");
    response.sendRedirect("output.jsp?bookName=" + urlBookName + "&author=" + urlAuthor);
%>
도서명: <%= bookName %><br>
저자: <%= author %><br>
</body>
</html>

<%-- output.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String book = request.getParameter("bookName");
    String author = request.getParameter("author");
%>
output.jsp에서 출력...<br><br>
도서명: <%= book %><br>
저자: <%= author %><br>
</body>
</html>