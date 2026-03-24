<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 주문</title>
</head>
<body>

메뉴를 선택하세요. <br><hr><br>

<form action="process.jsp" method="post">
    고객이름: <input type="text" name="customer" size="10"><br><br>

    <input type="radio" name="food" value="탕수육">탕수육<br>
    <input type="radio" name="food" value="짜장면">짜장면<br>
    <input type="radio" name="food" value="짬뽕">짬뽕<br>
    <input type="radio" name="food" value="우동">우동<br>
    <br>
    
    지출 예상 가격:<input type="text" name="price" value="30000">원<br><br>

    <select name="amount">
        <option value="1">1그릇
        <option value="2">2그릇
        <option value="3">3그릇
        <option value="4">4그릇
        <option value="5">5그릇
    </select><br><br>

    <select name="tasty">
        <option value="1">순하게
        <option value="2">조금 순하게
        <option value="3">중간
        <option value="4">진하게
        <option value="5">매우 진하게
    </select><br><br>

    <input type="submit" value="주문">
</form>

</body>
</html>