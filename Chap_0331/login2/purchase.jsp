<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.util.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>purchase.jsp</title>
</head>
<body>
    <%
        User user = (User) session.getAttribute("LOGIN");
        String userID = user.getUserID();

        if(userID == null){
            out.print("상품을 구매하기 위해 먼저 로그인하세요");
        }else{
            String userName = user.getUserName();
    %>
            <%= userName %>님, 상품을 구매하시면 됩니다. <br>
            상품은 <%= user.getAddress() %>로 배송하겠습니다. <br>
    <%
        }
    %>

</body>
</html>