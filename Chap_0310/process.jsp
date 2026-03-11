<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%-- [페이지 지시어] 응답 Content-Type과 JSP 인코딩을 UTF-8로 유지한다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력 결과</title>
</head>
<body>
<%-- [스크립틀릿] 요청 파라미터를 읽고, 나이는 문자열에서 정수로 변환하며 취미는 배열로 수신한다. --%>
<%
	request.setCharacterEncoding("UTF-8");
	String userName = request.getParameter("userName");
	String address = request.getParameter("address");
	String userAgeParam = request.getParameter("userAge");
	String major = request.getParameter("major");
	int userAge = 0;
	try {
		userAge = Integer.parseInt(userAgeParam);
	} catch (Exception e) {
		userAge = 0;
	}
	String[] hobbies = request.getParameterValues("hobby");
	if (hobbies == null) hobbies = new String[0];
%>
<%-- [표현식] 입력 폼에서 전달된 userName 값을 응답 HTML에 출력한다. --%>
이름 : <%= userName %> <br>
<%-- [표현식] 입력 폼에서 전달된 address 값을 응답 HTML에 출력한다. --%>
주소 : <%= address %> <br>
<%-- [표현식] 입력 폼에서 전달된 userAge 값을 응답 HTML에 출력한다. --%>
나이 : <%= userAge %> <br>
<%-- [표현식] 라디오 버튼으로 선택한 전공 값을 응답 HTML에 출력한다. --%>
전공 : <%= major %> <br>

<%-- [조건문] 나이 구간에 따라 분류 문구를 서버에서 판단해 출력한다. --%>
<%
	if (userAge <= 20) out.print("당신은 청년입니다.");
	else if (userAge <= 40 && userAge > 20) out.print("당신은 중년입니다.");
	else out.print("당신은 노년입니다.");
	out.print("<br><br>사용자 취미: ");
	for (int i = 0; i < hobbies.length; i++) {
		out.print(hobbies[i] + " ");
	}
%>
<
</body>
</html>
