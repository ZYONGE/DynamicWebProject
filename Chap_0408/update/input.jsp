<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 검색</title>
</head>
    <body>
        사용자 정보 수정:<br><hr><br>
        <form action= "update.jsp" method="post">
            아이디:<input type ="text" name="memberId" size="10">
            패스워드:<input type ="text" name="password" size="10">
            이름:<input type ="text" name="name" size="10">
            이메일:<input type ="text" name="email" size="10">
            <input type="submit" value="수정">
        </form>
    </body>
</html>