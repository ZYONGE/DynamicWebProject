<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 1. JDBC 드라이버 로딩
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = null; Statement stmt = null; ResultSet rs = null; //(resultSet 들어나르는 애)
try {
    // 2. 데이터베이스 커넥션 생성
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web", "root", "");

    // 3. Statement 생성
    stmt = conn.createStatement();
    // 4. 쿼리 실행
    //rs = stmt.executeQuery("select * from MEMBER order by MEMBERID");
    String memberid = request.getParameter("memberid");
    rs = stmt.executeQuery("select * from MEMBER where memberid='" + memberid + "'");
    // 5. 쿼리 실행 결과 출력
    while(rs.next()) {
         String memberid = rs.getString(1);
         String password = rs.getString(2);
         String name = rs.getString(3);
         String email = rs.getString(4);
         out.println(memberid+":"+password + ":" + name+":"+ email+ "<br>");
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