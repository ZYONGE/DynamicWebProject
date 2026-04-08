<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 조회</title>
</head>
<body>
<%
// 1. JDBC 드라이버 로딩
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = null; Statement stmt = null; ResultSet rs = null; //(resultSet 들어나르는 애)
try {
    request.setCharacterEncoding("UTF-8");
    // 2. 데이터베이스 커넥션 생성
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web", "root", "12345");

    // 3. Statement 생성
    stmt = conn.createStatement();
    // 4. 쿼리 실행
    //rs = stmt.executeQuery("select * from MEMBER order by MEMBERID");
    String memberId=request.getParameter("memberId");
	boolean found = false;
	rs = stmt.executeQuery("select * from MEMBER where memberId='"+ memberId+"'");
    // 5. 쿼리 실행 결과 출력
    while(rs.next()) {
         found = true;
         String Id = rs.getString(1);
         String password = rs.getString(2);
         String name = rs.getString(3);
         String email = rs.getString(4);
         out.println(Id+":"+password + ":" + name+":"+ email+ "<br>");
    }

    if(!found) {
         out.println("조회된 회원 정보가 없습니다.");
    }
} catch(SQLException ex) {
    ex.printStackTrace();
} finally {
    // 6. 사용한 Statement 종료
    if (rs != null) try { rs.close(); } catch(SQLException ex) {}
    if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
    // 7. 커넥션 종료
    if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}

%>
</body>
</html>