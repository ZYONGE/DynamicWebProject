<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%-- [페이지 지시어] JSP 실행 언어와 응답 인코딩을 UTF-8로 설정한다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sum</title>
</head>
<body>
<%-- [스크립틀릿] 1~100 범위를 순회하며 짝수만 누적 합산하는 서버측 계산 로직이다. --%>
<%
    int sum = 0;
    for(int i=1; i<=100; i++) {
        if(i%2 == 0) {
            sum += i;
        }
    }
%>
<%-- [표현식] 서버에서 계산한 sum 값을 HTML 제목 태그 내부에 출력한다. --%>
<h1>1부터 100까지의 짝수의 합: <%= sum %></h1>

</body>
</html>
