<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꽃 정보 입력</title>
</head>
<body>

    <%-- 사용자에게 꽃의 정보를 입력받아 process.jsp로 전달. --%>
    <form action="process.jsp" method="post">
        꽃이름: <input type="text"   name="name"         /><br>
        원산지: <input type="text"   name="origin"       /><br>
        가격:   <input type="number" name="price"        /><br>
        등록일: <input type="date"   name="registerDate" /><br>
        이미지: <input type="text"   name="image"        /><br>
        <input type="submit" value="전송" />
    </form>

</body>
</html>
