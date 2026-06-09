<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ page import="java.sql.*,java.util.*,my.model.Flower,my.dao.*,my.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 및 구매</title>
</head>
<body>
<%
    String paramFlowerId = request.getParameter("flowerId");
    int flowerId = (paramFlowerId != null) ? Integer.parseInt(paramFlowerId) : 1;
    Flower flower = null;
    Connection conn = ConnectionProvider.getConnection();
    try {
        FlowerDao dao = new FlowerDao();
        flower = dao.selectById(conn, flowerId);
    } catch(SQLException e) {
        e.printStackTrace();
    } finally {
        JdbcUtil.close(conn);
    }
%>
<form method="get" action="purchaseForm.jsp">
꽃 번호: <input type="number" name="flowerId" value="<%=flowerId%>" min="1">
<input type="submit" value="조회">
</form>
<hr>
<c:set var="flower" value="<%=flower %>"/>
<c:if test="${flower != null }">
<form action="purchase.jsp" method="post">
꽃아이디: <input type ="text" name="flowerId" value="${flower.flowerId}" readonly>
가격: <input type ="text" name="price" value="${flower.price}" readonly>
수량:<select name="amount">
    <option value="1">1개</option>
    <option value="2">2개</option>
    <option value="3">3개</option>
    <option value="4">4개</option>
</select>
<input type ="submit" value="구매하기">
<!-- form 자체를 인자로 넘겨주도록 유지 -->
<input type="button" onclick="putcart(this.form)" value="카트담기">
</form> <br><hr><br>
꽃아이디: ${flower.flowerId} <br>
꽃이름: ${flower.name}<br>
원산지: ${flower.origin}<br>
가격: ${flower.price}<br>
등록일: <fmt:formatDate value="${flower.registerDate}" pattern="yyyy년 MM월 dd일"/><br><hr><br>
<img src="images/${flower.image}" width="350" height="500"><br>
</c:if>

<a href="/pro04288/user/catalog.jsp">카탈로그 보기</a>

<script>
function putcart(frm){
    var amount = frm.amount.value.trim();
    var flowerId = frm.flowerId.value.trim(); 
    
    // ⭕ 수정 완료: 오타 'id'를 'flowerId' 변수명으로 변경했습니다.
    // ⭕ 파일명을 putcart.jsp 소문자로 통일했습니다. 
    window.open("putcart.jsp?flowerId=" + flowerId + "&amount=" + amount, "장바구니담기", "width=600, height=400, scrollbars=yes");
}
</script>

</body>
</html>