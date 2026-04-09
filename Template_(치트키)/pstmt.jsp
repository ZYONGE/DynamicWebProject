<%-- input.jsp--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 검색</title>
</head>
    <body>
        사용자 정보 수정:<br><hr><br>
        <form action= "update.jsp" method="post">
            아이디:<input type ="text" name="memberid" size="10">
            패스워드:<input type ="text" name="password" size="10">
            이름:<input type ="text" name="name" size="10">
            이메일:<input type ="text" name="email" size="10">
            <input type="submit" value="수정">
        </form>
    </body>
</html>

<%-- psupdate.jsp --%>
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

<%--insert.jsp --%>
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

<%-- delete.jsp --%>>
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
    String memberId=request.getParameter("memberId");
    
	
    int result = stmt.executeUpdate("delete from member where memberId='"+memberId+"'");
    if (result==1)out.print(memberId+"삭제 완료~");
    else 
    	out.print(memberId+"삭제 문제!");
    
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