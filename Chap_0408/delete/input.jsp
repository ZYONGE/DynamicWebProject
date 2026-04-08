<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 검색</title>
</head>
    <body>
        사용자 정보 삭제:<br><hr><br>
       
        <form action="delete.jsp" method="post">
        아이디: <input type="text" name="memberid" size="10"> <%--delete는 기본키만 있어도 삭제 --%>
        <input type="submit" value="삭제">
        </form>
    </body>
</html>