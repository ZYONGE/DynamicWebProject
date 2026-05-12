<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.User, my.dao.UserDao, my.util.ConnectionProvider, my.util.JdbcUtil, java.sql.Connection" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userId   = request.getParameter("userId");
    String password = request.getParameter("password");

    if (userId == null || userId.trim().isEmpty() || password == null || password.trim().isEmpty()) {
        response.sendRedirect("login.jsp?error=1");
        return;
    }

    Connection conn = ConnectionProvider.getConnection();
    UserDao userDao = new UserDao();
    User user = null;
    try {
        user = userDao.login(conn, userId.trim(), password.trim());
        if (user != null) {
            userDao.incrementLogintime(conn, user.getUserId());
        }
    } finally {
        JdbcUtil.close(conn);
    }

    if (user == null) {
        response.sendRedirect("login.jsp?error=1");
        return;
    }

    session.setAttribute("loginUser", user);
    session.setAttribute("isAdmin", user.isAdmin());

    response.sendRedirect("../print_list/list.jsp");
%>
