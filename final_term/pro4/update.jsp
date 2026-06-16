<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String idParam = request.getParameter("id");
    if (idParam != null) {
        Instrument inst = new Instrument();
        inst.setId(Integer.parseInt(idParam));
        inst.setName(request.getParameter("name"));
        inst.setPrice(Double.parseDouble(request.getParameter("price")));
        inst.setDesc(request.getParameter("desc"));
        inst.setImage(request.getParameter("image"));

        Connection conn = ConnectionProvider.getConnection();
        try {
            InstrumentDao dao = new InstrumentDao();
            dao.update(conn, inst);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn);
        }
    }
%>
<jsp:forward page="../pro3/list.jsp"/>
