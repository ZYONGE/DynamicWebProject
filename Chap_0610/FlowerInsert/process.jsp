<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*,java.util.*,my.model.*,my.dao.*,my.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String origin = request.getParameter("origin");
	int price = Integer.parseInt(request.getParameter("price"));
	String image = request.getParameter("image");
	Flower flower = new Flower(0, name, origin, price, new java.util.Date(), image);
 	Connection conn=ConnectionProvider.getConnection();
 	try{
 		FlowerDao dao=new FlowerDao();
 		dao.insert(conn,flower);
 	}catch(SQLException e){
 		e.printStackTrace();
 	}finally{
 		JdbcUtil.close(conn);
 	}
 
 
 %>
 <%= name %>꽃을 등록하셨습니다. <br>
</body>
</html>