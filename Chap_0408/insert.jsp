<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 입력</title>
</head>
<body>
    <%
    request.setCharacterEncoding("UTF-8");
    %>
    <jsp:useBean id="member" class="my.info.Member"/>  
    <%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = null; PreparedStatement pstmt = null;
    PreparedStatement pstmt = null;
    
    try {

        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web", "root", "12345");
        pstmt = conn.prepareStatement("insert into member (memberId, password, name, email) values (?, ?, ?, ?)");
        pstmt.setString(1, member.getMemberid());
        pstmt.setString(2, member.getPassword());
        pstmt.setString(3, member.getName());
        pstmt.setString(4, member.getEmail());
        int result = pstmt.executeUpdate();

        if(result == 1) {
            out.println(" 입력 완료!");
        } else {
            out.println("입력 문제 발생!");
        }

    } catch(SQLException ex) {
        ex.printStackTrace();

    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
    %>
</body>
</html>