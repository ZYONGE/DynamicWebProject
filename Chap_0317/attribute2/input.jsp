<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름과 성적 입력:<br><hr><br>

<form action="process.jsp" method="post">
    이름: <input type="text" name="name" size="10"><br>
    성적: <input type="text" name="score" size="10"><br>
    학과: <input type="text" name="department" size="10"><br>
    <input type="submit" value="입력">
</form>
</body>
</html>