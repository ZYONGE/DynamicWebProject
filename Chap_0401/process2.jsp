<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>process.jsp</title>
</head>

<body>
    <%
        request.setCharacterEncoding("UTF-8");
    %>

    <jsp:useBean id="stud" class="my.info.Student" scope="request"></jsp:useBean>
    <jsp:setProperty name="stud" property="*"></jsp:setProperty>
    <jsp:forward page="output.jsp"></jsp:forward>
    
</body>

</html>