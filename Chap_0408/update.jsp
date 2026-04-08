<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 수정</title>
</head>
<body>
    <%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = null; Statement stmt = null;

    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web", "root", "12345");
        stmt = conn.createStatement();
        request.setCharacterEncoding("UTF-8");

        String memberId=request.getParameter("memberId");
        String password=request.getParameter("password");
        String name=request.getParameter("name");
        String email=request.getParameter("email");

        int result = stmt.executeUpdate(
            "update member set password='"+password+"',name='"+name+"',email='"+email+"' where memberId='"+memberId+"'");

        if(result == 1) {
            out.println(memberId + " 수정 완료!");
        } else {
            out.println("해당 ID가 없어 수정되지 않았습니다.");
        }

    } catch(SQLException ex) {
        ex.printStackTrace();

    } finally {
        if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
    %>
</body>
</html>