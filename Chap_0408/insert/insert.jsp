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
    request.setCharacterEncoding("utf-8");
    // 4. 쿼리 실행 (쿼리=질문)
    //rs = stmt.executeQuery("select * from MEMBER order by MEMBERID");
    String memberid=request.getParameter("memberid");
    String password=request.getParameter("password");
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    
	
    int result = stmt.executeUpdate(
    	    "INSERT INTO member (memberid, password, name, email) VALUES ('"
    	    + memberid + "', '"
    	    + password + "', '"
    	    + name + "', '"
    	    + email + "')"
    	);
    if (result==1)out.print(memberid+"입력 완료~");
    else 
    	out.print(memberid+"입력 문제!");
    
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