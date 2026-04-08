<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.info.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="my.info.Member" />
<jsp:setProperty property="*" name="member"/>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = null;
PreparedStatement pstmt = null;

try {
    conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/web", "root", ""
    );



    pstmt = conn.prepareStatement("UPDATE member SET password=?, name=?, email=? where memberid=?");

    pstmt.setString(1, member.getPassword());
    pstmt.setString(2, member.getName());
    pstmt.setString(3, member.getEmail());
    pstmt.setString(4, member.getMemberid());

    int result = pstmt.executeUpdate();

    if(result == 1)
        out.print(member.getMemberid() + " 수정 완료~");
    else
        out.print(member.getMemberid() + " 수정 문제!");

} catch(SQLException ex) {
    ex.printStackTrace();
} finally {
    if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
    if(conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>

</body>
</html>