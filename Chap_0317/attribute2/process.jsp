<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");    
    int score = Integer.parseInt(request.getParameter("score"));
    String department = request.getParameter("department");

    // request 객체에 저장된 name과 score를 pageContext 객체에 저장
    pageContext.setAttribute("name", name);
    pageContext.setAttribute("score", score);
    pageContext.setAttribute("department", department);

    // request 객체에도 name과 score를 저장
    request.setAttribute("name", name);
    request.setAttribute("score", score);
    request.setAttribute("department", department);

    // session 객체에도 name과 score를 저장
    session.setAttribute("name", name);
    session.setAttribute("score", score);
    session.setAttribute("department", department);

    // application 객체에도 name과 score를 저장
    application.setAttribute("name", name);
    application.setAttribute("score", score);
    application.setAttribute("department", department);

    // response.sendRedirect("output.jsp");
    %>

    <!-- 
    output.jsp 페이지로 요청을 포워드. 포워드는 같은 서버 내에서 요청을 전달하며, 클라이언트는 URL 변화를 인지하지 못함.
    output.jsp 페이지에서는 pageContext, request, session, application 객체에 저장된 name과 score 값을 출력할 수 있다.
    url을 타고 넘어가지 않으므로, 별도의 캐릭터 인코딩 설정이 필요하지 않음.
    -->
    <jsp:forward page="output.jsp" />
</body>
</html>