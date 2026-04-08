<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, my.info.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="my.info.Member" />
<jsp:setProperty property="*" name="member"/>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
PreparedStatement pstmt = null;
Connection conn = null;

try {
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web", "root", "");

    pstmt = conn.prepareStatement("insert into member values(?,?,?,?)");
    pstmt.setString(1, member.getMemberid());
    pstmt.setString(2, member.getPassword());
    pstmt.setString(3, member.getName());
    pstmt.setString(4, member.getEmail());

    int result = pstmt.executeUpdate();

    if (result == 1)
        out.print(member.getMemberid() + " 입력 완료~");
    else
        out.print(member.getMemberid() + " 입력 문제!");

} catch(SQLException ex) {
    ex.printStackTrace();
} finally {
    if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
    if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
</body>
</html>