<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, my.dao.*, my.util.*, my.model.*" %>
<%
  Connection conn = null;
  Book book = null;
  try {
    int bookId = Integer.parseInt(request.getParameter("bookId"));
    conn = ConnectionProvider.getConnection();
    BookDao dao = new BookDao();
    book = dao.selectById(conn, bookId);
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    JdbcUtil.close(conn);
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%= book != null ? book.getBookName() : "도서 상세" %> — BookShelf</title>
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
  .navbar nav a:hover { color: #fff; border-bottom-color: var(--accent); }

  .container { max-width: 820px; margin: 2.5rem auto; padding: 0 1.5rem; }

  .breadcrumb {
    display: flex;
    align-items: center;
    gap: 6px;
    font-size: 0.82rem;
    color: var(--muted);
    margin-bottom: 1.5rem;
  }
  .breadcrumb a { color: var(--muted); text-decoration: none; }
  .breadcrumb a:hover { color: var(--accent); }
  .breadcrumb .sep { opacity: 0.5; }

  .detail-card {
    background: var(--card);
    border-radius: var(--radius);
    box-shadow: var(--shadow);
    overflow: hidden;
    display: flex;
    gap: 0;
  }

  .book-cover-wrap {
    flex-shrink: 0;
    width: 220px;
    background: linear-gradient(135deg, #1A1A2E 0%, #2d2d4e 100%);
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 2rem 1.5rem;
  }
  .book-cover {
    width: 150px;
    height: 215px;
    object-fit: cover;
    border-radius: 6px;
    box-shadow: 6px 6px 24px rgba(0,0,0,0.5);
  }

  .book-info {
    flex: 1;
    padding: 2.5rem 2rem;
  }
  .book-info h1 {
    font-size: 1.65rem;
    font-weight: 700;
    color: var(--primary);
    line-height: 1.3;
    margin-bottom: 0.4rem;
  }
  .book-info .author {
    font-size: 1rem;
    color: var(--muted);
    margin-bottom: 1.5rem;
  }

  .divider { height: 1px; background: var(--border); margin: 1.5rem 0; }

  .meta-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1rem;
  }
  .meta-item .label {
    font-size: 0.72rem;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    color: var(--muted);
    margin-bottom: 4px;
  }
  .meta-item .value {
    font-size: 0.95rem;
    font-weight: 600;
    color: var(--primary);
  }
  .price-value {
    font-size: 1.2rem;
    font-weight: 700;
    color: var(--accent);
  }

  .actions {
    display: flex;
    gap: 10px;
    margin-top: 2rem;
    flex-wrap: wrap;
  }
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
  }
  .btn-primary { background: var(--accent); color: #fff; }
  .btn-primary:hover { background: var(--accent-hover); }
  .btn-outline { background: transparent; color: var(--primary); border: 1.5px solid var(--border); }
  .btn-outline:hover { background: var(--bg); }

  /* Not found */
  .not-found {
    text-align: center;
    padding: 5rem 2rem;
    background: var(--card);
    border-radius: var(--radius);
    box-shadow: var(--shadow);
  }
  .not-found .icon { font-size: 3rem; margin-bottom: 1rem; opacity: 0.4; }
  .not-found h2 { color: var(--primary); margin-bottom: 0.5rem; }
  .not-found p { color: var(--muted); font-size: 0.9rem; margin-bottom: 1.5rem; }

  @media (max-width: 600px) {
    .detail-card { flex-direction: column; }
    .book-cover-wrap { width: 100%; height: 200px; }
    .meta-grid { grid-template-columns: 1fr; }
  }
</style>
</head>
<body>

<header class="navbar">
  <a href="list.jsp" class="brand">Book<span>Shelf</span></a>
  <nav>
    <a href="list.jsp">도서 목록</a>
    <a href="../selectlike/input.jsp">검색</a>
    <a href="../insert/input.jsp">도서 추가</a>
  </nav>
</header>

<main class="container">
  <div class="breadcrumb">
    <a href="list.jsp">도서 목록</a>
    <span class="sep">›</span>
    <span><%= book != null ? book.getBookName() : "상세 정보" %></span>
  </div>

  <% if (book != null) { %>
  <div class="detail-card">
    <div class="book-cover-wrap">
      <img class="book-cover"
           src="<%= request.getContextPath() %>/images/<%= book.getBookImage() %>"
           alt="<%= book.getBookName() %>">
    </div>
    <div class="book-info">
      <h1><%= book.getBookName() %></h1>
      <p class="author"><%= book.getAuthor() %> 지음</p>

      <div class="divider"></div>

      <div class="meta-grid">
        <div class="meta-item">
          <div class="label">도서 ID</div>
          <div class="value">#<%= book.getBookId() %></div>
        </div>
        <div class="meta-item">
          <div class="label">출판일</div>
          <div class="value"><%= book.getPublishDate() %></div>
        </div>
        <div class="meta-item">
          <div class="label">가격</div>
          <div class="price-value"><%= String.format("%,d", book.getPrice()) %>원</div>
        </div>
      </div>

      <div class="actions">
        <a href="../update/input.jsp?bookId=<%= book.getBookId() %>" class="btn btn-primary">수정하기</a>
        <a href="list.jsp" class="btn btn-outline">목록으로</a>
      </div>
    </div>
  </div>
  <% } else { %>
  <div class="not-found">
    <div class="icon">📖</div>
    <h2>도서를 찾을 수 없습니다</h2>
    <p>요청하신 도서 정보를 불러올 수 없습니다.</p>
    <a href="list.jsp" class="btn btn-outline">목록으로 돌아가기</a>
  </div>
  <% } %>
</main>

</body>
</html>
