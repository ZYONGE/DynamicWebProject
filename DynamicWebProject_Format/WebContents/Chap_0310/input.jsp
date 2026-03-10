<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%-- [페이지 지시어] JSP 소스와 HTTP 응답 인코딩을 UTF-8로 지정한다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Input</title>
</head>
<body>
<%-- [정적 안내] 브라우저에서 사용자 입력을 받기 위한 화면임을 안내한다. --%>
사용자 정보를 입력하세요. <br>
<hr>
<%-- [폼 전송] 사용자가 입력한 값을 POST 요청으로 process.jsp에 전달한다. --%>
<form action="process.jsp" method="post" accept-charset="UTF-8">
	<%-- [입력 필드] name=userName 값은 서버에서 request.getParameter("userName")로 조회한다. --%>
	이름: <input type="text" name="userName" size="10"><br>
	<%-- [입력 필드] name=address 값은 서버에서 request.getParameter("address")로 조회한다. --%>
	주소: <input type="text" name="address" size="10"><br>
	<%-- [입력 필드] 나이는 숫자 입력으로 제한하고 서버에서 request.getParameter("userAge")로 읽는다. --%>
	나이: <input type="number" name="userAge" min="0" size="10"><br>
	<%-- [라디오 옵션] 전공은 하나만 선택하도록 type="radio"로 구성하며 서버에서 request.getParameter("major")로 읽는다. --%>
	전공:
	<input type="radio" name="major" value="경영">경영
	<input type="radio" name="major" value="컴공">컴공
	<input type="radio" name="major" value="메카">메카
	<input type="radio" name="major" value="기계">기계
	<br>
	<%-- [선택 옵션] 같은 name(hobby) 체크박스는 다중 선택되며 서버에서 request.getParameterValues("hobby")로 배열 수신한다. --%>
	취미:
	<input type="checkbox" name="hobby" value="등산">등산
	<input type="checkbox" name="hobby" value="수영">수영
	<input type="checkbox" name="hobby" value="독서">독서
	<input type="checkbox" name="hobby" value="영화 감상">영화 감상
	<br>
	<%-- [제출 버튼] 클릭 시 위 5개 입력값을 HTTP 요청 본문에 담아 서버로 보낸다. --%>
	<input type="submit" value="입력">
</form>
</body>
</html>