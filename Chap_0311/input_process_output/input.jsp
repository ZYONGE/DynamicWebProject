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
