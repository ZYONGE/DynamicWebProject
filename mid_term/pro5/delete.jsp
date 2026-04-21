<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.SQLException" %>
<%@ page import="my.util.ConnectionProvider" %>
<%@ page import="my.dao.MemberDao" %>
<%--
    [pro5] delete.jsp  -  회원 삭제 처리 (DELETE)

    흐름:
      1. 요청 인코딩 설정
      2. memberId 파라미터 수신
      3. DB 연결
      4. MemberDao.deleteById() 호출
      5. DB 연결 종료 (finally)
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 삭제 처리</title>
</head>
<body>

<%-- 1. 요청 인코딩 (한국어 깨짐 방지) --%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
    // 2. 파라미터 수신
    String memberId = request.getParameter("memberId");

    if (memberId == null || memberId.trim().isEmpty()) {
        out.print("아이디를 입력해 주세요.");
    } else {
        // 3. DB 연결
        Connection conn = ConnectionProvider.getConnection();
        try {
            // 4. DELETE 실행
            MemberDao dao = new MemberDao();
            dao.deleteById(conn, memberId.trim());
            out.print("회원 삭제가 완료되었습니다.");
        } catch (SQLException e) {
            e.printStackTrace();
            out.print("삭제 중 오류가 발생했습니다.");
        } finally {
            // 5. DB 연결 종료
            conn.close();
        }
    }
%>

</body>
</html>
