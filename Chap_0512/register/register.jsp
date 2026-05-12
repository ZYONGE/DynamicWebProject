<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("loginUser") != null) {
        response.sendRedirect("../print_list/list.jsp");
        return;
    }
    String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
    <h2>회원가입</h2>

    <% if ("dup".equals(error)) { %>
        <p style="color:red;">이미 사용 중인 아이디입니다.</p>
    <% } else if ("empty".equals(error)) { %>
        <p style="color:red;">모든 항목을 입력해주세요.</p>
    <% } %>

    <form action="registerProcess.jsp" method="post">
        아이디: <input type="text" name="userId" maxlength="50" required /><br>
        비밀번호: <input type="password" name="password" maxlength="100" required /><br>
        이름: <input type="text" name="name" maxlength="50" required /><br>
        계정 유형:
        <select name="role">
            <option value="user">사용자</option>
            <option value="admin">관리자</option>
        </select><br>
        <input type="submit" value="가입하기" />
    </form>

    <br>
    <a href="../login/login.jsp">로그인 화면으로</a>
</body>
</html>
