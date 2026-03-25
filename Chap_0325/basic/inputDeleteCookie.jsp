<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Input Delete Cookie</title>
</head>
<body>
    쿠키 삭제하기
    <form action="deleteCookie.jsp" method="post">
        삭제할 쿠키명: <input type="text" name="cookieName" size = "10"><br><br>
        <input type="submit" value="삭제"><br><br>
    </form>

</body>
</html>