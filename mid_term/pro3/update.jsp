<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.SQLException" %>
<%@ page import="my.util.ConnectionProvider" %>
<%@ page import="my.dao.MemberDao" %>
<%--
    [pro3] update.jsp  -  회원 정보 수정 처리 (UPDATE)

    흐름:
      1. 요청 인코딩 설정
      2. <jsp:setProperty>로 폼 파라미터를 Member 객체에 자동 바인딩
      3. DB 연결
      4. MemberDao.update() 호출
      5. DB 연결 종료 (finally)
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정 처리</title>
</head>
<body>

<%-- 1. 요청 인코딩 (setProperty 이전에 설정해야 한국어가 깨지지 않음) --%>
<% request.setCharacterEncoding("UTF-8"); %>

<%-- 2. 폼 파라미터 → Member 객체 자동 바인딩 (String 필드만) --%>
<jsp:useBean id="member" class="my.model.Member" scope="page" />
<jsp:setProperty name="member" property="memberId" param="memberId" />
<jsp:setProperty name="member" property="password" param="password" />
<jsp:setProperty name="member" property="name"     param="name" />

<%
    // grade: int 타입이므로 직접 파싱 (jsp:setProperty value는 String→int 변환 미지원)
    String gradeParam = request.getParameter("grade");
    member.setGrade((gradeParam != null && !gradeParam.isEmpty()) ? Integer.parseInt(gradeParam) : 0);

    // 3. DB 연결
    Connection conn = ConnectionProvider.getConnection();
    try {
        // 4. UPDATE 실행
        MemberDao dao = new MemberDao();
        dao.update(conn, member);
        out.print("회원 정보 수정이 완료되었습니다.");
    } catch (SQLException e) {
        e.printStackTrace();
        out.print("수정 중 오류가 발생했습니다.");
    } finally {
        // 5. DB 연결 종료
        conn.close();
    }
%>

</body>
</html>
