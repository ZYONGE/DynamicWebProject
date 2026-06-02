<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.dao.LoginDao, my.model.Login"%>
<%
request.setCharacterEncoding("UTF-8");

String id     = request.getParameter("id");
String pw     = request.getParameter("pw");
String name   = request.getParameter("name");
String email  = request.getParameter("email");
String birth  = request.getParameter("birth");
String gender = request.getParameter("gender");

Login login = new Login();
login.setId(id);
login.setPw(pw);
login.setName(name);
login.setEmail(email);
login.setBirth(birth);
login.setGender(gender);

LoginDao dao = new LoginDao();
int result = dao.insert(login);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과</title>
</head>
<body>
<% if (result == 1) { %>
    <h2>회원가입이 완료되었습니다.</h2>
    <p>아이디: <%=id%></p>
    <a href="joinForm.jsp">다시 가입하기</a>
<% } else { %>
    <h2>회원가입에 실패하였습니다.</h2>
    <a href="joinForm.jsp">다시 시도</a>
<% } %>
</body>
</html>
