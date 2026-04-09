<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>input.jsp</title>
</head>

<body>

    학생정보 입력: <br><br><hr>

    <form action="process3.jsp" method="post">
        학생이름: <input type="text" name="studName"><br><br>
        학생ID: <input type="text" name="studId"><br><br>
        학생나이: <input type="number" name="age"><br><br>

        학과: 
        <input type="radio" name="depart" value="경영학과">경영학과
        <input type="radio" name="depart" value="기계공학과">기계공학과
        <input type="radio" name="depart" value="컴퓨터공학과">컴퓨터공학과
        <input type="radio" name="depart" value="게임공학과">게임공학과
        <br><br>

        취미: 
        <input type="checkbox" name="hobby" value="운동">운동
        <input type="checkbox" name="hobby" value="독서">독서
        <input type="checkbox" name="hobby" value="영화">영화
        <input type="checkbox" name="hobby" value="게임">게임
        <input type="submit" value="입력">
        <br><br>

        주소: <input type="text" name="address"><br><br>
    </form>

</body>

</html>

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

    <jsp:useBean id="stud" class="my.info.Student" scope="session"/>
    <jsp:setProperty name="stud" property="*"/>
    <jsp:forward page="output2.jsp"/>   
</body>

</html>