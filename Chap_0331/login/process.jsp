<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>process.jsp</title>
</head>
<body>
    <%
    
        String userID = request.getParameter("userID");
        String password = request.getParameter("password");
        String userName = request.getParameter("userName");
        
        if(userID.equals(password)){
            session.setAttribute("LOGIN", userID);
            session.setAttribute("USERNAME", userName);

            session.setMaxInactiveInterval(10); // 세션 유지 시간 10초

            response.sendRedirect("home.jsp");
        }else{
            %>
                <script type="text/javascript">
                    alert("아이디 패스워드가 일치하지 않습니다.");
                    history.go(-1);
                </script>
            <%
        }
    %>
</body>
</html>