<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    page 학생이름: <%= pageContext.getAttribute("name") %><br>
    page 점수: <%= pageContext.getAttribute("score") %><br>
    page 학과: <%= pageContext.getAttribute("department") %><br>

    request 학생이름: <%= request.getAttribute("name") %><br>
    request 점수: <%= request.getAttribute("score") %><br>
    request 학과: <%= request.getAttribute("department") %><br>

    session 학생이름: <%= session.getAttribute("name") %><br>
    session 점수: <%= session.getAttribute("score") %><br>
    session 학과: <%= session.getAttribute("department") %><br>
    
    application 학생이름: <%= application.getAttribute("name") %><br>
    application 점수: <%= application.getAttribute("score") %><br>
    application 학과: <%= application.getAttribute("department") %><br>

</body>
</html>