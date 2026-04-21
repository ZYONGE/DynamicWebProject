<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="my.util.ConnectionProvider" %>
<%@ page import="my.dao.MemberDao" %>
<%@ page import="my.model.Member" %>
<%--
    [pro2] list.jsp  -  회원 목록 조회 (SELECT ALL)

    흐름:
      1. DB 연결
      2. MemberDao.selectList() 호출
      3. DB 연결 종료 (finally)
      4. 조회 결과를 테이블로 출력
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 목록</title>
</head>
<body>

    <h2>회원 목록</h2>

<%
    Connection conn = null;
    List<Member> list = null;
    try {
        conn = ConnectionProvider.getConnection();
        MemberDao dao = new MemberDao();
        list = dao.selectList(conn);
    } catch (SQLException e) {
        e.printStackTrace();
        out.print("<p style='color:red'>SQL 오류: " + e.getMessage() + "</p>");
    } finally {
        if (conn != null) conn.close();
    }
%>

<%-- 4. 조회 결과 출력 --%>
<% if (list != null && !list.isEmpty()) { %>
    <table border="1">
        <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>성적</th>
            <th>등록일</th>
        </tr>
        <% for (Member m : list) { %>
        <tr>
            <td><%= m.getMemberId() %></td>
            <td><%= m.getName() %></td>
            <td><%= m.getGrade() %></td>
            <td><%= m.getRegisterDate() %></td>
        </tr>
        <% } %>
    </table>
<% } else { %>
    <p>등록된 회원이 없습니다.</p>
<% } %>

</body>
</html>
