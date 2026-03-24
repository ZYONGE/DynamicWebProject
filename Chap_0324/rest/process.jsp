<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>process</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String food = request.getParameter("food");
        String restPage = null;

        int price = Integer.parseInt(request.getParameter("price"));
        String quality = "";
        if(price >= 100000){
            quality = "고급";
        } else if(price >= 50000 && price < 100000){
            quality = "중급";
        } else if(price >= 10000 && price < 50000){
            quality = "하급";
        } else {
            quality = "기본급";
        }
        request.setAttribute("QUAL", quality);

        int tasty = Integer.parseInt(request.getParameter("tasty"));
        String grade = "";

        if(tasty == 4 || tasty == 5){
            grade = "진한 맛";
        } else if(tasty == 1 || tasty == 2){
            grade = "순한 맛";
        } else{
            grade = "중간 맛";
        }
        request.setAttribute("TASTY", grade);

    
        if(food.equals("탕수육")){
            restPage = "../kind/tang.jsp";
        } else if(food.equals("짜장면")){
            restPage = "../kind/zza.jsp";
        } else if(food.equals("짬뽕")){
            restPage = "../kind/bbong.jsp";
        } else if(food.equals("우동")){
            restPage = "../kind/udong.jsp";
        } else {
            out.println("메뉴에 없는 것을 주문했습니다.");
        }
    %>

    <!--
    forward는 지정된 페이지로 요청을 전달하는 역할.
    메뉴의 선택에 따라 해당 페이지로 이동하여 결과를 보여줌.
    process.jsp의 개요:
    1. 사용자가 메뉴에서 음식을 선택하여 폼을 제출.
    2. process.jsp에서 선택된 음식에 따라 restPage 변수를 설정.
    3. jsp:forward 태그를 사용하여 restPage로 요청을 전달.
    4. restPage에 해당하는 JSP 페이지가 실행되어 결과를 사용자에게 보여줌.

    +
    restPage란 사용자가 선택한 음식에 따라 이동할 JSP 페이지의 경로를 저장하는 변수.
    예를 들어, 사용자가 "탕수육"을 선택하면 restPage는 "../kind/tang.jsp"로 설정.
    이후 jsp:forward 태그를 통해 해당 페이지로 요청이 전달되어 결과가 사용자에게 보여줌.
    -->
    
    <jsp:forward page="<%=restPage%>" />
</body>
</html>