<%--input cookie --%>>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Input Cookie</title>
</head>
<body>
주소입력: <br><br>
    <form action="makeCookie.jsp" method="post">
        쿠키명: <input type="text" name="cookieName" size="10"><br><br>
        쿠키값: <input type="text" name="cookieValue" size="10"><br><br>
        쿠키경로: <input type="text" name="Path" size="10"><br><br>
        <input type="submit" value="쿠키생성"><br><br>
    </form>

</body>
</html>

<%--make cookie --%>>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Make Cookie</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
    String cookieName = request.getParameter("cookieName");
    String cookieValue = request.getParameter("cookieValue");
    String path = request.getParameter("Path");

    Cookie cookie = new Cookie(cookieName, cookieValue);
    cookie.setPath(path);

    response.addCookie(cookie);
%>

쿠키를 만들고, 쿠키 저장소에 저장했습니다. <br><br>
<%= cookie.getName() %> : <%= cookie.getValue() %> <br>

</body>
</html>


<%--view cookie --%>>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Cookie</title>
</head>
<body>

<%
    Cookie[] cookies = request.getCookies(); //Client sends cookies to the server, and the server retrieves them using request

    if (cookies != null && cookies.length > 0) {
        for (Cookie cookie : cookies) {
            out.println(cookie.getName() + " : " + cookie.getValue() + "<br>");
        }
    } else {
        out.println("저장된 쿠키가 없습니다.");
    }

    //Session is, in a way, a special cookie that is automatically created and managed by the server.
    //It is used to maintain state and store user-specific information across multiple requests.
    //The session ID is stored in a cookie on the client side, and the server uses this ID to associate the client's
    //requests with their session data.
%>
<br><br>
<br>
</body>
</html>

<%--delete cookie --%>>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Cookie</title>
</head>
<body>

<%
    // 삭제할 쿠키 이름 지정
    String cookieName = request.getParameter("cookieName");

    // 요청에 포함된 모든 쿠키 가져오기
    Cookie[] cookies = request.getCookies(); 

    // 쿠키가 존재할 경우 순회
    if (cookies != null && cookies.length > 0) {
        for (Cookie cookie : cookies) {
            // 삭제 대상 쿠키를 이름으로 찾기
            if (cookie.getName().equals(cookieName)) {
                cookie.setMaxAge(0);        // 유효 시간을 0으로 설정하여 즉시 만료
                response.addCookie(cookie); // 변경된 쿠키를 응답에 반영
            }
        }
    }
%>
<%= cookieName %> 쿠키를 삭제했습니다。 <br><br>
</body>
</html>

<%--input delete cookie --%>>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Input Delete Cookie</title>
</head>
<body>
    쿠키 삭제하기
    <form action="deleteCookie.jsp" method="post">
        삭제할 쿠키명: <input type="text" name="cookieName" size = "10"><br><br>
        <input type="submit" value="삭제"><br><br>
    </form>

</body>
</html>

<%--home session --%>>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.util.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
</head>
<body>  
    <%
        User user = (User) session.getAttribute("LOGIN");
    %>

    <%= user.getUserName() %> 고객님 반갑습니다. <br><hr><br>
    여기서 필요한 물건을 구매하시면 됩니다. <br><br>

    <a href="purchase.jsp">구매하러 가기> </a>
    <br><br>
    <a href="logout.jsp">로그아웃하기> </a>

</body>
</html>

<%--process session --%>>
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

<%--purchase session --%>>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.util.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>purchase.jsp</title>
</head>
<body>
    <%
        User user = (User) session.getAttribute("LOGIN");
        String userID = user.getUserID();

        if(userID == null){
            out.print("상품을 구매하기 위해 먼저 로그인하세요");
        }else{
            String userName = user.getUserName();
    %>
            <%= userName %>님, 상품을 구매하시면 됩니다. <br>
            상품은 <%= user.getAddress() %>로 배송하겠습니다. <br>
    <%
        }
    %>

</body>
</html>

<%--logout session --%>>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout.jsp</title>
</head>
<body>

    <%
        session.removeAttribute("LOGIN");
        session.removeAttribute("USERNAME");
    %>

    로그아웃 하셨습니다. <br><br>

    <a href="login.jsp"> 로그인하기 </a>

</body>
</html>