<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
    [pro4] input.jsp  -  회원 검색 입력 폼
    action : search.jsp (SELECT by ID 처리 후 output.jsp로 포워드)
    method : POST
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 검색</title>
</head>
<body>

    <h2>회원 검색</h2>

    <form action="search.jsp" method="post">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="memberId" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="검색" />
                </td>
            </tr>
        </table>
    </form>

</body>
</html>
