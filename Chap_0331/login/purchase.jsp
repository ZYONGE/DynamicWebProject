<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>purchase.jsp</title>
</head>
<body>
    <%

        String userID = (String) session.getAttribute("LOGIN");
        String userName = (String) session.getAttribute("USERNAME");

        if(userID == null){
            out.print("상품을 구매하기 위해 먼저 로그인하세요");
        }else{
    %>
            <%= userName %>님, 상품을 구매하시면 됩니다.
    <%
        }
    %>

</body>
</html>