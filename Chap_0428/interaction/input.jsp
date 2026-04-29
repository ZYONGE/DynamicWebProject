<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <%-- 사용자에게 책의 정보를 입력받아 process.jsp로 전달. --%>
    <form action="process.jsp" method="post">
        도서명: <input type="text" name="bookName" /><br>
        저자: <input type="text" name="author" /><br>
        가격: <input type="number" name="price" /><br>
        출판일: <input type="date" name="publishDate" /><br>
        이미지: <input type="text" name="bookImage" /><br>
        <input type="submit" value="전송" />
    </form>

</body>
</html>
