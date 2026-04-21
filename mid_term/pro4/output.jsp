<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="my.model.Member" %>
<%--
    [pro4] output.jsp  -  회원 단건 조회 결과 출력
    search.jsp에서 포워드되며, request scope의 "member" 속성을 출력함.
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 검색 결과</title>
</head>
<body>

    <h2>회원 검색 결과</h2>

<%
    // search.jsp에서 request.setAttribute("member", member)로 저장한 값을 꺼냄
    Member member = (Member) request.getAttribute("member");
%>

<% if (member != null) { %>
        아이디: <%= member.getMemberId() %><br>
        이름: <%= member.getName() %><br>
        성적: <%= member.getGrade() %><br>
        등록일: <%= member.getRegisterDate() %><br>
<% } else { %>
    <p>해당 아이디의 회원을 찾을 수 없습니다.</p>
<% } %>

</body>
</html>
