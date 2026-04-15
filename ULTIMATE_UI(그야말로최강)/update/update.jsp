<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, my.util.*" %>
<%
    request.setCharacterEncoding("utf-8");
    int bookId = Integer.parseInt(request.getParameter("bookId"));
    String bookName  = request.getParameter("bookName");
    String author    = request.getParameter("author");
    String bookImage = request.getParameter("bookImage");

    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        conn = ConnectionProvider.getConnection();
        pstmt = conn.prepareStatement(
            "update book set bookName=?, author=?, bookImage=? where bookId=?");
        pstmt.setString(1, bookName);
        pstmt.setString(2, author);
        pstmt.setString(3, bookImage);
        pstmt.setInt(4, bookId);
        pstmt.executeUpdate();
        response.sendRedirect("../select/list.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>오류 발생 — BookShelf</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
  :root { --primary:#1A1A2E; --accent:#C9784B; --bg:#F5F5F3; --card:#fff; --muted:#6B7280; --border:#E5E7EB; --shadow:0 1px 3px rgba(0,0,0,0.07),0 6px 20px rgba(0,0,0,0.06); --radius:14px; }
  * { box-sizing:border-box; margin:0; padding:0; }
  body { font-family:'Noto Sans KR',-apple-system,sans-serif; background:var(--bg); color:#2D2D2D; min-height:100vh; display:flex; flex-direction:column; }
  .navbar { background:var(--primary); padding:0 2rem; display:flex; align-items:center; height:62px; gap:2.5rem; }
  .navbar .brand { color:#fff; font-size:1.15rem; font-weight:700; text-decoration:none; }
  .navbar .brand span { color:var(--accent); }
  .center { flex:1; display:flex; align-items:center; justify-content:center; padding:2rem; }
  .error-card { background:var(--card); border-radius:var(--radius); box-shadow:var(--shadow); padding:2.5rem; max-width:500px; width:100%; text-align:center; }
  .error-icon { font-size:2.5rem; margin-bottom:1rem; }
  .error-card h2 { font-size:1.3rem; font-weight:700; color:var(--primary); margin-bottom:.5rem; }
  .error-card p { font-size:.875rem; color:var(--muted); margin-bottom:1.5rem; }
  .error-msg { background:#FEF2F2; border:1px solid #FECACA; border-radius:8px; padding:12px 16px; font-size:.82rem; color:#991B1B; text-align:left; margin-bottom:1.5rem; font-family:monospace; word-break:break-all; }
  .btn { display:inline-flex; align-items:center; gap:6px; padding:9px 18px; border-radius:8px; font-size:.85rem; font-weight:600; text-decoration:none; border:1.5px solid var(--border); background:transparent; color:var(--primary); cursor:pointer; font-family:inherit; transition:all .18s; }
  .btn:hover { background:var(--bg); }
</style>
</head>
<body>
<header class="navbar">
  <a href="../select/list.jsp" class="brand">Book<span>Shelf</span></a>
</header>
<div class="center">
  <div class="error-card">
    <div class="error-icon">⚠️</div>
    <h2>도서 수정에 실패했습니다</h2>
    <p>데이터베이스 처리 중 오류가 발생했습니다.</p>
    <div class="error-msg"><%= e.getMessage() %></div>
    <a href="input.jsp?bookId=<%= bookId %>" class="btn">다시 시도</a>
  </div>
</div>
</body>
</html>
<%
    } finally {
        JdbcUtil.close(pstmt);
        JdbcUtil.close(conn);
    }
%>
