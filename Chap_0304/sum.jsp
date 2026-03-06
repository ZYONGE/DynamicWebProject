<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sum</title>
</head>
<body>
<%
    int sum = 0;
    for(int i=1; i<=100; i++) {
        if(i%2 == 0) {
            sum += i;
        }
    }
%>
<h1>1부터 100까지의 짝수의 합: <%= sum %></h1>

</body>
</html>
