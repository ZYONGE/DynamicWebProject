<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
    [pro3] updateForm.jsp  -  회원 정보 수정 폼
    진입 방법 : ?memberId=xxx 쿼리스트링으로 아이디를 전달받음
    action    : update.jsp (UPDATE 처리)
    method    : POST
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
</head>
<body>

    <h2>회원 정보 수정</h2>

    <form action="update.jsp" method="post">
        <table>
            <tr>
                <td>아이디</td>
                <%-- memberId는 WHERE 조건 키이므로 수정 불가 (readonly) --%>
                <%
                    String memberIdParam = request.getParameter("memberId");
                    String safeId = (memberIdParam == null) ? "" :
                        memberIdParam.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;")
                                     .replace("\"","&quot;").replace("'","&#x27;");
                %>
                <td><input type="text" name="memberId"
                           value="<%= safeId %>" /></td>
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
                    <input type="submit" value="수정" />
                </td>
            </tr>
        </table>
    </form>

</body>
</html>
