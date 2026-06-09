<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ page import="java.sql.*,java.util.*,my.model.Cart,my.model.Flower,my.model.Purchase,my.dao.*,my.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
</head>
<body>
<%
    // 1. 세션에서 로그인 아이디 확인
    String userId = (String) session.getAttribute("LOGIN");
    if (userId == null) {
        userId = "guest"; // 로그인이 필수가 아니라면 임시 아이디 부여
    }

    // 2. 세션에서 카트 개수 가져오기 (Null 체크)
    Integer sFlowerCount = (Integer) session.getAttribute("flowerCount");
    int flowerCount = (sFlowerCount != null) ? sFlowerCount.intValue() : 0;

    // 사용할 변수들을 상단에 선언 (중복 선언 에러 방지)
    Cart cart = null;
    int flowerId = 0;
    int amount = 0;
    int price = 0;
    int totalInsertedCount = 0; // 몇 종류의 상품을 성공적으로 구매했는지 체크

    Connection conn = null;
    PurchaseDao dao = new PurchaseDao();
    FlowerDao fdao = new FlowerDao();
    Purchase purchase = null;

    try {
        conn = ConnectionProvider.getConnection();
        
        // 트랜잭션 수동 모드 시작 (하나라도 실패하면 전체 취소)
        conn.setAutoCommit(false); 

        // 3. 카트 루프 돌면서 DB에 주문 내역 저장
        for (int i = 1; i <= flowerCount; i++) {
            cart = (Cart) session.getAttribute("flower" + i);
            
            if (cart != null) {
                flowerId = cart.getFlowerId();
                amount = cart.getAmount();
                
                // ⭕ 수정된 부분: fdao에서 Flower 객체를 반환하므로 Flower 타입으로 받음
                Flower flowerObj = fdao.selectById(conn, flowerId); 
                
                if (flowerObj != null) {
                    // Flower 객체에서 정상적으로 가격을 꺼내옴
                    price = flowerObj.getPrice(); 
                    
                    // 구매 데이터 객체 생성 (사용자ID, 꽃ID, 수량, 단가, 총액, 구매일)
                    purchase = new Purchase(userId, flowerId, amount, price, amount * price, new java.util.Date());
                    
                    // 주문 테이블에 삽입
                    dao.insert(conn, purchase);
                    
                    totalInsertedCount++; // 성공 카운트 증가
                } else {
                    System.out.println("경고: " + flowerId + "번 꽃 정보가 데이터베이스에 없습니다.");
                }
            }
        }
        
        // 모든 상품이 정상적으로 insert 되었다면 최종 반영(커밋)
        conn.commit();
        
        // 4. 구매 완료 후 세션에 남아있는 장바구니 품목 비우기
        session.removeAttribute("flowerCount");
        for (int i = 1; i <= flowerCount; i++) {
            session.removeAttribute("flower" + i);
        }

    } catch (SQLException e) {
        // 처리 중 에러 발생 시 여태까지 들어간 주문 전부 롤백(취소)
        if (conn != null) {
            try { conn.rollback(); } catch (SQLException ex) {}
        }
        out.println("<h3 style='color:red;'>주문 처리 중 오류가 발생했습니다.</h3>");
        out.println("<p>에러 원인: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        // 커넥션은 오직 여기서만 딱 한 번 닫습니다. (fdao 내부에선 닫으면 안 됨)
        JdbcUtil.close(conn);
    }
%>

<h2>주문이 성공적으로 완료되었습니다!</h2>
<p>장바구니에 있던 총 <b><%= totalInsertedCount %></b>종류의 꽃 상품 구매를 마쳤습니다.</p>
<br>
<a href="/pro04288/user/catalog.jsp">리스트 보기</a>
</body>
</html>