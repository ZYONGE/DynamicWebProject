<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="my.model.User, my.dao.UserDao, my.util.ConnectionProvider, my.util.JdbcUtil, java.sql.Connection" %>
<%
    request.setCharacterEncoding("UTF-8");

    if (session.getAttribute("loginUser") != null) {
        response.sendRedirect("../print_list/list.jsp");
        return;
    }

    String userId   = request.getParameter("userId");
    String password = request.getParameter("password");
    String name     = request.getParameter("name");
    String role     = request.getParameter("role");

    if (userId == null || userId.trim().isEmpty()
            || password == null || password.trim().isEmpty()
            || name == null || name.trim().isEmpty()) {
        response.sendRedirect("register.jsp?error=empty");
        return;
    }

    userId = userId.trim();
    password = password.trim();
    name = name.trim();
    if (!"admin".equals(role)) role = "user";

    Connection conn = ConnectionProvider.getConnection();
    try {
        UserDao userDao = new UserDao();
        if (userDao.existsById(conn, userId)) {
            response.sendRedirect("register.jsp?error=dup");
            return;
        }
        User newUser = new User();
        newUser.setUserId(userId);
        newUser.setPassword(password);
        newUser.setName(name);
        newUser.setRole(role);
        userDao.register(conn, newUser);
    } finally {
        JdbcUtil.close(conn);
    }

    response.sendRedirect("registerSuccess.jsp?name=" + java.net.URLEncoder.encode(name, "UTF-8") + "&role=" + role);
%>
