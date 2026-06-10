<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Integer flowerCount=(Integer)session.getAttribute("flowerCount");
	if(flowerCount != null) {
		for(int i=1; i<= flowerCount;i++)
			session.removeAttribute("flower"+i);
		session.removeAttribute("flowerCount");
	}
%>
카트에 있는 내용이 삭제되었습니다<br>
<a href="catalog.jsp">카탈록로 돌아가기</a>
</body>
</html>