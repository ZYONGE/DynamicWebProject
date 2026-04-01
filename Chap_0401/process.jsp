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

    <jsp:useBean id="stud" class="my.info.Student" scope="page"></jsp:useBean>

    <jsp:setProperty name="stud" property="studName" param="studName"></jsp:setProperty>
    <jsp:setProperty name="stud" property="studId" param="studId"></jsp:setProperty>
    <jsp:setProperty name="stud" property="age" param="age"></jsp:setProperty>

    학생이름: <jsp:getProperty property="studName" name="stud"></jsp:getProperty><br><br>
    학생ID: <jsp:getProperty property="studId" name="stud"></jsp:getProperty><br><br>
    학생나이: <jsp:getProperty property="age" name="stud"></jsp:getProperty><br><br>
    
</body>

</html>