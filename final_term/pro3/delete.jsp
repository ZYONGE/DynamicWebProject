<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.dao.*,my.util.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String idParam = request.getParameter("id");
    if (idParam != null) {
        int id = Integer.parseInt(idParam);
        Connection conn = ConnectionProvider.getConnection();
        try {
            InstrumentDao dao = new InstrumentDao();
            dao.deleteById(conn, id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn);
        }
    }
%>
<jsp:forward page="list.jsp"/>
