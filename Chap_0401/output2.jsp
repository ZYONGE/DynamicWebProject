<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>process.jsp</title>
</head>

<body>
    <jsp:useBean id="stud" class="my.info.Student" scope="session"></jsp:useBean>
    학생이름: <%= stud.getStudName() %><br><br>
    학생ID: <%= stud.getStudId() %><br><br>
    학생나이: <%= stud.getAge() %><br><br>
    학과: <%= stud.getDepart() %><br><br>
    취미: 
    <%
        for(String hobby : stud.getHobby()) {
            out.print(hobby + ":");
        }
    %><br><br>
    주소: <%= stud.getAddress() %><br><br>
    
</body>

</html>