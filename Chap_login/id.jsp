<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
</head>
<body>
<form name="form">
ID : <input type="text" size="10" maxlength="15" name="id">
   &nbsp;<img src="image/idchk.png" onclick="idcheck()" align="middle">
   <br><br>
</form>
<script>
function idcheck(){
 var id = document.form.id.value;
 if(id.length < 1 || id == null){
  alert("중복체크할 아이디를 입력하십시오");
  return false;
 }
 var url = "id_check.jsp?id=" + id;
 window.open(url, "get", "height=180, width=300");
}
</script>
</body>
</html>
