<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
도서명 입력: <br><br>

<form action="output.jsp" method="post">
	도서명: <input type="text" name="book"><br><br>
	저자: <input type="text" name="author"><br><br>
	가격: <input type="number" name="price"><br><br>
	<input type="submit" value="입력">
</form>
</body>
</html>
