<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Cookie</title>
</head>
<body>

<%
    // 삭제할 쿠키 이름 지정
    String cookieName = request.getParameter("cookieName");

    // 요청에 포함된 모든 쿠키 가져오기
    Cookie[] cookies = request.getCookies(); 

    // 쿠키가 존재할 경우 순회
    if (cookies != null && cookies.length > 0) {
        for (Cookie cookie : cookies) {
            // 삭제 대상 쿠키를 이름으로 찾기
            if (cookie.getName().equals(cookieName)) {
                cookie.setMaxAge(0);        // 유효 시간을 0으로 설정하여 즉시 만료
                response.addCookie(cookie); // 변경된 쿠키를 응답에 반영
            }
        }
    }
%>
<%= cookieName %> 쿠키를 삭제했습니다。 <br><br>
</body>
</html>