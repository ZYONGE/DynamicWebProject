<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.dao.LoginDao"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("userid");
LoginDao dao = new LoginDao();
int result = dao.idCheck(id);
out.print(result);
%>
