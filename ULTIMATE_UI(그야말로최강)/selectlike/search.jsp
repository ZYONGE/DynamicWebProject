<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, my.dao.*, my.util.*, my.model.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String target  = request.getParameter("target");
    String keyword = request.getParameter("keyword");
    List<Book> list = null;
    Connection conn = null;
    try {
        conn = ConnectionProvider.getConnection();
        BookDao dao = new BookDao();
        list = dao.selectLike(conn, target, keyword);
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        JdbcUtil.close(conn);
    }
    String targetLabel = "author".equals(target) ? "저자" : "도서명";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색 결과 — BookShelf</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
  :root {
    --primary: #1A1A2E;
    --accent: #C9784B;
    --accent-hover: #b5663c;
    --bg: #F5F5F3;
    --card: #FFFFFF;
    --text: #2D2D2D;
    --muted: #6B7280;
    --border: #E5E7EB;
    --shadow: 0 1px 3px rgba(0,0,0,0.07), 0 6px 20px rgba(0,0,0,0.06);
    --radius: 14px;
  }
  * { box-sizing: border-box; margin: 0; padding: 0; }
  body {
    font-family: 'Noto Sans KR', -apple-system, sans-serif;
    background: var(--bg);
    color: var(--text);
    line-height: 1.6;
    min-height: 100vh;
  }

  .navbar {
    background: var(--primary);
    padding: 0 2rem;
    display: flex;
    align-items: center;
    height: 62px;
    gap: 2.5rem;
    position: sticky;
    top: 0;
    z-index: 100;
  }
  .navbar .brand { color: #fff; font-size: 1.15rem; font-weight: 700; text-decoration: none; }
  .navbar .brand span { color: var(--accent); }
  .navbar nav { display: flex; gap: 1.5rem; }
  .navbar nav a {
    color: rgba(255,255,255,0.7);
    text-decoration: none;
    font-size: 0.875rem;
    padding-bottom: 2px;
    border-bottom: 2px solid transparent;
    transition: all 0.2s;
  }
  .navbar nav a:hover, .navbar nav a.active { color: #fff; border-bottom-color: var(--accent); }

  .container { max-width: 1100px; margin: 2.5rem auto; padding: 0 1.5rem; }

  .page-header {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    margin-bottom: 1.5rem;
    flex-wrap: wrap;
    gap: 1rem;
  }
  .page-header h1 { font-size: 1.6rem; font-weight: 700; color: var(--primary); }
  .query-tag {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    background: #FEF3C7;
    color: #92400E;
    font-size: 0.82rem;
    font-weight: 600;
    padding: 4px 12px;
    border-radius: 20px;
    margin-top: 6px;
  }
  .result-count {
    font-size: 0.875rem;
    color: var(--muted);
    margin-top: 4px;
  }
  .result-count strong { color: var(--accent); }

  .btn {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 9px 18px;
    border-radius: 8px;
    font-size: 0.85rem;
    font-weight: 600;
    text-decoration: none;
    border: none;
    cursor: pointer;
    transition: all 0.18s;
    font-family: inherit;
    white-space: nowrap;
  }
  .btn-primary { background: var(--accent); color: #fff; }
  .btn-primary:hover { background: var(--accent-hover); }
  .btn-outline { background: transparent; color: var(--primary); border: 1.5px solid var(--border); }
  .btn-outline:hover { background: var(--bg); }
  .btn-sm { padding: 5px 12px; font-size: 0.78rem; border-radius: 6px; }
  .btn-detail { background: #F0FDF4; color: #166534; border: 1.5px solid #BBF7D0; }
  .btn-detail:hover { background: #DCFCE7; }
  .btn-edit { background: #EFF6FF; color: #2563EB; border: 1.5px solid #BFDBFE; }
  .btn-edit:hover { background: #DBEAFE; }

  .card { background: var(--card); border-radius: var(--radius); box-shadow: var(--shadow); overflow: hidden; }
  .table-wrap { overflow-x: auto; }
  table { width: 100%; border-collapse: collapse; font-size: 0.9rem; }
  thead tr { background: #F9FAFB; border-bottom: 2px solid var(--border); }
  th {
    padding: 13px 16px;
    text-align: left;
    font-size: 0.75rem;
    font-weight: 600;
    color: var(--muted);
    text-transform: uppercase;
    letter-spacing: 0.06em;
    white-space: nowrap;
  }
  td { padding: 13px 16px; border-bottom: 1px solid var(--border); vertical-align: middle; }
  tbody tr:last-child td { border-bottom: none; }
  tbody tr:hover { background: #FAFAF8; transition: background 0.15s; }

  .book-link { color: var(--primary); text-decoration: none; font-weight: 600; }
  .book-link:hover { color: var(--accent); text-decoration: underline; }
  .book-thumb { width: 52px; height: 74px; object-fit: cover; border-radius: 5px; box-shadow: 0 2px 6px rgba(0,0,0,0.15); display: block; }
  .price-badge { display: inline-block; background: #FEF3C7; color: #92400E; font-size: 0.8rem; font-weight: 600; padding: 3px 9px; border-radius: 20px; }
  .id-badge { display: inline-block; background: #F3F4F6; color: var(--muted); font-size: 0.78rem; font-weight: 600; padding: 2px 8px; border-radius: 5px; }
  .actions-cell { display: flex; gap: 6px; }

  .empty { text-align: center; padding: 4rem 2rem; color: var(--muted); }
  .empty .empty-icon { font-size: 3rem; margin-bottom: 1rem; opacity: 0.4; }
  .empty p { font-size: 0.95rem; margin-bottom: 1.5rem; }
</style>
</head>
<body>

<header class="navbar">
  <a href="../select/list.jsp" class="brand">Book<span>Shelf</span></a>
  <nav>
    <a href="../select/list.jsp">도서 목록</a>
    <a href="input.jsp" class="active">검색</a>
    <a href="../insert/input.jsp">도서 추가</a>
  </nav>
</header>

<main class="container">
  <div class="page-header">
    <div>
      <h1>검색 결과</h1>
      <div style="margin-top:6px; display:flex; align-items:center; gap:10px; flex-wrap:wrap;">
        <span class="query-tag"><%= targetLabel %> : "<%= keyword %>"</span>
        <span class="result-count">총 <strong><%= list != null ? list.size() : 0 %></strong>건</span>
      </div>
    </div>
    <div style="display:flex; gap:10px; flex-wrap:wrap;">
      <a href="input.jsp" class="btn btn-outline">다시 검색</a>
      <a href="../select/list.jsp" class="btn btn-primary">전체 목록</a>
    </div>
  </div>

  <div class="card">
    <div class="table-wrap">
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>표지</th>
            <th>도서명</th>
            <th>저자</th>
            <th>가격</th>
            <th>출판일</th>
            <th>관리</th>
          </tr>
        </thead>
        <tbody>
          <%
            if (list != null && !list.isEmpty()) {
              for (Book book : list) {
          %>
          <tr>
            <td><span class="id-badge">#<%= book.getBookId() %></span></td>
            <td>
              <a href="../select/detail.jsp?bookId=<%= book.getBookId() %>">
                <img class="book-thumb"
                     src="<%= request.getContextPath() %>/images/<%= book.getBookImage() %>"
                     alt="<%= book.getBookName() %>">
              </a>
            </td>
            <td>
              <a href="../select/detail.jsp?bookId=<%= book.getBookId() %>" class="book-link">
                <%= book.getBookName() %>
              </a>
            </td>
            <td style="color:var(--muted)"><%= book.getAuthor() %></td>
            <td><span class="price-badge"><%= book.getPrice() %>원</span></td>
            <td style="color:var(--muted); font-size:0.85rem"><%= book.getPublishDate() %></td>
            <td>
              <div class="actions-cell">
                <a href="../select/detail.jsp?bookId=<%= book.getBookId() %>" class="btn btn-sm btn-detail">상세</a>
                <a href="../update/input.jsp?bookId=<%= book.getBookId() %>" class="btn btn-sm btn-edit">수정</a>
              </div>
            </td>
          </tr>
          <%
              }
            } else {
          %>
          <tr>
            <td colspan="7">
              <div class="empty">
                <div class="empty-icon">🔍</div>
                <p>"<%= keyword %>"에 대한 검색 결과가 없습니다.</p>
                <a href="input.jsp" class="btn btn-outline">다시 검색하기</a>
              </div>
            </td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
  </div>
</main>

</body>
</html>
