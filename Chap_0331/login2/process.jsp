<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.util.User" %>
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
        String address = request.getParameter("address");

        // User 객체 생성
        User user = new User(userID, password, userName, address); //파라미터 생성자 호출
        
        if(userID.equals(password)){
            session.setAttribute("LOGIN", user); // user 객체의 모든정보가 들어옴.

            //session.setMaxInactiveInterval(10); // 세션 유지 시간 10초

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