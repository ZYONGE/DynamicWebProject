<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>도서 정보 수정</title>
</head>
<body>
<h2>도서 정보 수정</h2>
<form action="update.jsp" method="post">
    <table border="1">
        <tr>
            <td>도서 ID</td>
            <td><input type="text" name="bookId"></td>
        </tr>
        <tr>
            <td>도서명</td>
            <td><input type="text" name="bookName"></td>
        </tr>
        <tr>
            <td>저자</td>
            <td><input type="text" name="author"></td>
        </tr>
        <tr>
            <td>책 이미지</td>
            <td><input type="text" name="bookImage" placeholder="파일명 (예: book1.jpg)"></td>
        </tr>
    </table>
    <br>
    <input type="submit" value="수정">
    <a href="../select/list.jsp">목록 보기</a>
</form>
</body>
</html>
