<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.SQLException" %>
<%@ page import="my.util.ConnectionProvider" %>
<%@ page import="my.dao.MemberDao" %>
<%@ page import="my.model.Member" %>
<%--
    [pro4] search.jsp  -  회원 단건 조회 처리 (SELECT by ID)
    진입 방법 : ?memberId=xxx 쿼리스트링으로 아이디를 전달받음

    흐름:
      1. 요청 파라미터 수신
      2. DB 연결
      3. MemberDao.selectById() 호출
      4. DB 연결 종료 (finally)
      5. 조회 결과를 request scope에 저장 후 output.jsp로 포워드
--%>
<%
    // 1. 요청 인코딩 및 파라미터 수신
    request.setCharacterEncoding("UTF-8");
    String memberId = request.getParameter("memberId");

    // 2. DB 연결
    Connection conn = ConnectionProvider.getConnection();
    Member member = null;
    try {
        // 3. SELECT by ID 실행
        MemberDao dao = new MemberDao();
        member = dao.selectById(conn, memberId);
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // 4. DB 연결 종료
        conn.close();
    }

    // 5. 조회 결과를 request scope에 저장 (output.jsp에서 꺼내 씀)
    request.setAttribute("member", member);
%>
<%-- output.jsp로 포워드 --%>
<jsp:forward page="output.jsp" />
