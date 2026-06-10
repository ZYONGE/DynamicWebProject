<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꽃 등록</title>
</head>
<body>
꽃 정보를 입력하세요.<br><hr><br>
<form action="process.jsp" method="post">
꽃이름:<input type="text" name="name" size="10"><br>
원산지:<input type="text" name="origin" size="10"><br>
가격:<input type="text" name="price" size="10"><br>
꽃이미지:<input type="text" name="image" size="20"><br>
<input type="submit" value="저장">
</form>
</body>
</html>