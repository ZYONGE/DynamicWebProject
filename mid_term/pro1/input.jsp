<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
    [pro1] input.jsp  -  회원 등록 입력 폼
    action : process.jsp (INSERT 처리)
    method : POST
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 등록</title>
</head>
<body>

    <h2>회원 등록</h2>

    <form action="process.jsp" method="post">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="memberId" /></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="text" name="password" /></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="name" /></td>
            </tr>
            <tr>
                <td>성적</td>
                <td><input type="text" name="grade" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="등록" />
                </td>
            </tr>
        </table>
    </form>

</body>
</html>
