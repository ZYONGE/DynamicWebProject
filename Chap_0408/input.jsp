<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 처리 실습</title>
</head>
<body>
    <h3>사용자 정보 입력:</h3>
    <hr>
    <form action="insert.jsp" method="post">
        ID: <input type="text" name="memberId" size="10"><br><br>
        PASSWORD: <input type="text" name="password" size="10"><br><br>
        NAME: <input type="text" name="name" size="10"><br><br>
        EMAIL: <input type="text" name="email" size="10"><br><br>
        <input type="submit" value="입력">
    </form>

    <h3>사용자 정보 수정:</h3>
    <hr>
    <form action="update.jsp" method="post">
        ID: <input type="text" name="memberId" size="10"><br><br>
        PASSWORD: <input type="text" name="password" size="10"><br><br>
        NAME: <input type="text" name="name" size="10"><br><br>
        EMAIL: <input type="text" name="email" size="10"><br><br>
        <input type="submit" value="수정">
    </form>

    <h3>검색 아이디 입력:</h3>
    <form action="select.jsp" method="post">
        아이디: <input type="text" name="memberId" size="10"><br><br>
        <input type="submit" value="검색">
    </form>
</body>
</html>