<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ page import="java.sql.*,java.util.*,my.model.Cart,my.model.Flower,my.dao.*,my.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
    table { width: 60%; margin: 0 auto; border-collapse: collapse; text-align: center; }
    th, td { border: 1px solid #ddd; padding: 8px; }
    th { background-color: #f2f2f2; }
</style>
</head>
<body>
<%
    // 1. 세션에서 카트 내 항목 수 안전하게 가져오기
    Integer flowerCountObj = (Integer) session.getAttribute("flowerCount");
    int flowerCount = (flowerCountObj == null) ? 0 : flowerCountObj.intValue();

    // 2. 파라미터 가져오기 및 유효성 검사 (NullPointerException 방지)
    String paramId = request.getParameter("flowerId");
    String paramAmount = request.getParameter("amount");
 
    int flowerId = 0;
    int amount = 0;

    // 장바구니 추가 버튼을 통해서 정상적으로 파라미터가 전달되었을 때만 작동
    if (paramId != null && !paramId.trim().isEmpty() && paramAmount != null && !paramAmount.trim().isEmpty()) {
        flowerId = Integer.parseInt(paramId);
        amount = Integer.parseInt(paramAmount);
    }

    // 3. 유효한 상품일 경우 세션 장바구니에 저장
    if (flowerId != 0 && amount > 0) {
        Cart cart = new Cart(flowerId, amount); 
        flowerCount++;
        session.setAttribute("flower" + flowerCount, cart);
        session.setAttribute("flowerCount", flowerCount);   
    }
%>   

<h3 style="text-align: center;">당신이 지금까지 선택한 꽃들의 목록입니다</h3>
<br><br>
<hr><br><br>

<table>
    <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>수량</th>
        <th>이미지</th>
    </tr>
<%   
    Cart sessionCart = null;
    Flower flower = null; // ⭕ 누락되었던 flower 변수 선언 추가
    Connection conn = null;

    try {
        conn = ConnectionProvider.getConnection();
        FlowerDao dao = new FlowerDao();

        for (int i = 1; i <= flowerCount; i++) {
            sessionCart = (Cart) session.getAttribute("flower" + i);
            
            if (sessionCart != null) {
                // DB에서 꽃 정보 조회
                flower = dao.selectById(conn, sessionCart.getFlowerId());
                
                if (flower != null) {
%>
    <tr>
        <td><%= sessionCart.getFlowerId() %></td>
        <td><%= flower.getName() %></td> <%-- ⭕ 누락되었던 꽃 이름 출력 추가 --%>
        <td><%= sessionCart.getAmount() %>개</td>
        <td><img src="images/<%= flower.getImage() %>" width="40" height="45" alt="<%= flower.getName() %>"></td>
    </tr>
<%
                }
            }
        }
    } catch (SQLException e) {
        out.println("<tr><td colspan='4'>장바구니 조회 중 오류가 발생했습니다.</td></tr>");
        e.printStackTrace();
    } finally {
        JdbcUtil.close(conn); // 커넥션 반환
    }
%>
</table>

<br><hr><br>
<div style="text-align: center;">
    <a href="catalog.jsp">처음으로 돌아가기</a>&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="cartdelete.jsp">카트 비우기</a>&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" value="구매하기" onclick="purchase()">
</div>
<br><br>

<script>
function purchase() {
    var input = confirm('구매하시겠습니까?');
    if (input) {
        // 이전에 수정한 cartpurchase.jsp로 이동시킵니다.
        location.href = "cartPurchase.jsp";
    }
}
</script>
</body>
</html>