<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.Purchase, my.model.User, my.dao.PurchaseDao, my.util.ConnectionProvider, my.util.JdbcUtil, java.sql.Connection, java.sql.Date" %>
<%
    request.setCharacterEncoding("UTF-8");

    User loginUser = (User) session.getAttribute("loginUser");
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (loginUser == null) {
        response.sendRedirect("../login/login.jsp");
        return;
    }
    if (Boolean.TRUE.equals(isAdmin)) {
        response.sendRedirect("../print_list/list.jsp");
        return;
    }

    String flowerIdStr = request.getParameter("flowerId");
    String amountStr   = request.getParameter("amount");
    String paymentStr  = request.getParameter("payment");

    if (flowerIdStr == null || amountStr == null || paymentStr == null || paymentStr.isEmpty()) {
        response.sendRedirect("../print_list/list.jsp");
        return;
    }

    Purchase purchase = new Purchase();
    purchase.setUserId(loginUser.getUserId());
    purchase.setFlowerId(Integer.parseInt(flowerIdStr));
    purchase.setAmount(Integer.parseInt(amountStr));
    purchase.setPayment(Date.valueOf(paymentStr));
    purchase.setPurchaseDate(new Date(System.currentTimeMillis()));

    Connection conn = ConnectionProvider.getConnection();
    try {
        PurchaseDao purchaseDao = new PurchaseDao();
        purchaseDao.insert(conn, purchase);
    } finally {
        JdbcUtil.close(conn);
    }

    response.sendRedirect("myPurchase.jsp?success=1");
%>
