<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Input Cookie</title>
</head>
<body>
주소입력: <br><br>
    <form action="makeCookie.jsp" method="post">
        쿠키명: <input type="text" name="cookieName" size="10"><br><br>
        쿠키값: <input type="text" name="cookieValue" size="10"><br><br>
        쿠키경로: <input type="text" name="Path" size="10"><br><br>
        <input type="submit" value="쿠키생성"><br><br>
    </form>

</body>
</html>