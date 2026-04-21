<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
    [pro5] input.jsp  -  회원 삭제 입력 폼
    action : delete.jsp (DELETE 처리)
    method : POST
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 삭제</title>
</head>
<body>

    <h2>회원 삭제</h2>

    <form action="delete.jsp" method="post">
            삭제할 아이디: <input type="text" name="memberId" />
            <input type="submit" value="삭제" />
    </form>

</body>
</html>
