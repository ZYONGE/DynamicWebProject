<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 입력</title>
<style>
  body { font-family: Arial, sans-serif; margin: 30px; background: #f5f5f5; }
  .card { background: #fff; padding: 30px; max-width: 420px;
          border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.12); }
  h2 { margin-top: 0; color: #333; }
  table { width: 100%; border-collapse: collapse; }
  td { padding: 8px 4px; }
  td:first-child { color: #666; width: 90px; white-space: nowrap; }
  input[type=text] { width: 100%; box-sizing: border-box; padding: 6px 8px;
                     border: 1px solid #ccc; border-radius: 4px; }
  .btn-row { margin-top: 18px; display: flex; gap: 10px; }
  input[type=submit] { padding: 8px 22px; background: #4a90d9; color: #fff;
                       border: none; border-radius: 4px; cursor: pointer; }
  input[type=submit]:hover { background: #357abd; }
  .back-btn { display: inline-block; padding: 8px 18px; background: #aaa;
              color: #fff; text-decoration: none; border-radius: 4px; }
  .back-btn:hover { background: #888; }
</style>
</head>
<body>
<div class="card">
  <h2>도서 정보 입력</h2>
  <form action="process.jsp" method="post">
    <table>
      <tr>
        <td>도서명</td>
        <td><input type="text" name="bookName"></td>
      </tr>
      <tr>
        <td>저자</td>
        <td><input type="text" name="author"></td>
      </tr>
      <tr>
        <td>가격</td>
        <td><input type="text" name="price"></td>
      </tr>
      <tr>
        <td>책 이미지</td>
        <td><input type="text" name="bookImage" placeholder="파일명 (예: book1.jpg)"></td>
      </tr>
    </table>
    <div class="btn-row">
      <input type="submit" value="저장">
      <a href="../select/list.jsp" class="back-btn">목록 보기</a>
    </div>
  </form>
</div>
</body>
</html>
