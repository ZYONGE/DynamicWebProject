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
    Integer flowerCount=(Integer)session.getAttribute("flowerCount");
    if(flowerCount==null) {
        flowerCount = new Integer(0);
    }
    int flowerId = Integer.parseInt(request.getParameter("flowerId"));
    int amount = Integer.parseInt(request.getParameter("amount"));

    if(flowerId != 0) {
        Cart cart = new Cart(flowerId, amount);
        flowerCount = new Integer(flowerCount.intValue() + 1);
        session.setAttribute("flower"+flowerCount, cart);
        session.setAttribute("flowerCount", flowerCount);
    }
%>
<b><center>당신이 지금까지 선택한 꽃들의 목록입니다</center></b>
<br><br>
<hr><br><br>
<table border="1" width="300">
<tr><th>아이디</th><th>이름</th><th>수량</th><th>이미지</th></tr>

<%
    Cart cart = null;
    Connection conn = ConnectionProvider.getConnection();
    try {
        FlowerDao dao = new FlowerDao();
        Flower flower = null;

        for(int i=1; i <= flowerCount.intValue(); i++) {
            cart = (Cart)session.getAttribute("flower" + i);
            if(cart == null) continue;  // null 체크 추가
            flower = dao.selectById(conn, cart.getFlowerId());
            if(flower == null) continue;  // null 체크 추가
%>
<tr>
    <td><%= cart.getFlowerId() %></td>
    <td><%= flower.getName() %></td>
    <td><%= cart.getAmount() %></td>
    <td><img src="<%=request.getContextPath()%>/Chap_0610/images/<%= flower.getImage() %>" width="20" height="25"></td>
</tr>
<%
        }
    } catch(SQLException e) {
        e.printStackTrace();
    } finally {
        JdbcUtil.close(conn);
    }
    // removeAttribute 삭제 (cartdelete.jsp에서 처리)
%>
</table>
<hr>
<a href="catalog.jsp">카탈로그 돌아가기</a>&nbsp;
<a href="cartdelete.jsp">카트 비우기</a>
<input type="button" value="구매하기" onclick="purchase()">
<br><br>
<script>
function purchase() {
    var input = confirm('구매하시겠습니까?');
    if(input) {
        window.open("cartpurchase.jsp", "구매");
    }
}
</script>
</body>
</html>