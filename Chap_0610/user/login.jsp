<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,my.model.*,my.dao.*,my.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String userId = request.getParameter("userId");
    String password = request.getParameter("password");
    Connection conn = ConnectionProvider.getConnection();
    boolean checkPassword = true;
    try {
        UserDao dao = new UserDao();                 
        checkPassword = dao.checkPassword(conn, userId, password);
    } catch(SQLException e) {}

    if(checkPassword) {
        session.setAttribute("LOGIN", userId);
        String ctx = request.getContextPath();
        if(userId.equals("adminID") || userId.equals("admin"))
            response.sendRedirect(ctx + "/Chap_0610/Flowerlist/list.jsp");
        else {
            response.sendRedirect(ctx + "/Chap_0610/Flowerlist/catalog.jsp");
        }
    } else {                                         
%>
    <script type="text/javascript">
        alert("패스워드 틀렸습니다");
        history.go(-1);
    </script>
<%
    }
%>
</body>
</html>