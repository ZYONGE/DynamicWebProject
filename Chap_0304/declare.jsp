<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%-- [페이지 지시어] 이 JSP를 Java 기반으로 실행하고, 응답/페이지 인코딩을 UTF-8로 맞춘다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>math</title>
</head>
<body>
<%-- [선언부] 아래 메서드들은 JSP가 서블릿 클래스로 변환될 때 멤버 메서드로 포함된다. --%>
<%!
    public int sum(int a, int b) {
        return a + b;
    }
    public int sub(int a, int b) {
        return a - b;
    }
    public int mul(int a, int b) {
        return a * b;
    }
    public int div(int a, int b) {
        return a / b;
    }
%>

<%-- [표현식] 서버에서 sum(10, 15)를 계산한 결과를 문자열로 변환해 HTML 본문에 삽입한다. --%>
10+15 = <%= sum(10, 15) %><br>
<%-- [표현식] 서버에서 sub(10, 15) 결과를 계산해 응답 HTML에 삽입한다. --%>
10-15 = <%= sub(10, 15) %><br>
<%-- [표현식] 서버에서 mul(10, 15) 결과를 계산해 응답 HTML에 삽입한다. --%>
10*15 = <%= mul(10, 15) %><br>
<%-- [표현식] 서버에서 div(10, 15) 결과를 계산해 응답 HTML에 삽입한다. --%>
10/15 = <%= div(10, 15) %><br>
  
</body>
</html>
