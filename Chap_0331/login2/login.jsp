<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>

    사용자 로그인: <br><hr><br>

    <form action="process.jsp" method="post">
        아이디:<input type="text" name="userID" size="10">
        비밀번호:<input type="password" name="password" size="10">
        사용자명:<input type="text" name="userName" size="10">
        주소:<input type="text" name="address" size="10">
        <input type="submit" value="로그인">
    </form>

</body>
</html>