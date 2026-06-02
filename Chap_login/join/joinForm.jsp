<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<article>
<h1>Join Us</h1>
<form action="joinPro.jsp" method="post" id="join" name="fr" onsubmit="return check();">
<!-- 필수입력사항 -->
<fieldset>
<legend>필수입력사항</legend>
	<label>아이디</label>
	<input type="text" name="id" class="id">
	<input type="button" value="중복확인" class="dup" onclick="winopen()"><br>
	<label>비밀번호</label>
	<input type="password" name="pw" placeholder="영문숫자조합 4자리이상" required><br>
	<label>비밀번호확인</label>
	<input type="password" name="pass2" required><br>
	<label>이름</label>
	<input type="text" name="name" required><br>
	<label>이메일</label>
	<input type="email" name="email" placeholder="예시 : funweb@funweb.com (@포함기입)" required><br>
	<label>생년월일</label>
	<input type="text" name="birth"  placeholder="예시 : 801231 (6자리)" maxlength="6" required><br>
	<label>성별</label>
	<input type="radio" name="gender" value="f">여	
	<input type="radio" name="gender" value="m">남<br>
</fieldset>

<!-- 선택입력사항 -->

<div class="clear"></div>
<div id="buttons">
<input type="submit" value="회원가입" class="submit">
<input type="reset" value="초기화" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>


<!-- 유효성체크 : 데이터 빈공백체크(id와 성별) -->
<script type="text/javascript">
function check(){ 
	//아이디가 입력이 안되어있을 경우 아이디입력하라는 메세지 출력
	if(document.fr.id.value == "" || document.fr.id.value.length < 0){ 
		alert("아이디를 입력해주세요")
		history.back()
		document.fr.id.focus();
		return false;
	}
	
	if(document.fr.gender[0].checked == false && document.fr.gender[1].checked == false){
		alert("성별을 확인해주세요")
		history.back()
		document.fr.id.focus();
		return false;
	}
}

function winopen(){
	var id = document.fr.id.value;
	if(id == "" || id.length < 1){
		alert("아이디를 먼저 입력해주세요");
		document.fr.id.focus();
		return;
	}
	fetch("joinidCheck.jsp?userid=" + encodeURIComponent(id))
		.then(function(res){ return res.text(); })
		.then(function(result){
			if(result.trim() == "0"){
				alert("사용 가능한 아이디입니다.");
				document.fr.id.readOnly = true;
			} else {
				alert("중복된 아이디입니다. 다른 아이디를 입력하세요.");
				document.fr.id.value = "";
				document.fr.id.readOnly = false;
				document.fr.id.focus();
			}
		});
}
</script>
</body>
</html>