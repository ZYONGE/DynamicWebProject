<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>math</title>
</head>
<body>
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

10+15 = <%= sum(10, 15) %><br>
10-15 = <%= sub(10, 15) %><br>
10*15 = <%= mul(10, 15) %><br>
10/15 = <%= div(10, 15) %><br>
  
</body>
</html>
