<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 입력</title>
</head>
<body>

    <!-- ...existing code... -->
    <form action="./main.jsp" method="post">
        아이디:<br><hr><br>
        <input type="text" name="userID" value="userIDValue" /> <br><hr><br>
        이름:<br><hr><br>
        <input type="text" name="userName" value="userNameValue" /> <br><hr><br>
        <input type="submit" value="입력" />
    </form>
    <!-- ...existing code... -->

</body>
</html>