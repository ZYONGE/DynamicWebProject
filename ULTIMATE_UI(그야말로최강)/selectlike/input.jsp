<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도서 검색 — BookShelf</title>
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

  .container { max-width: 540px; margin: 4rem auto; padding: 0 1.5rem; }

  .search-header { text-align: center; margin-bottom: 2.5rem; }
  .search-header .icon { font-size: 2.5rem; margin-bottom: 1rem; opacity: 0.7; }
  .search-header h1 { font-size: 1.8rem; font-weight: 700; color: var(--primary); margin-bottom: 0.5rem; }
  .search-header p { font-size: 0.9rem; color: var(--muted); }

  .search-card {
    background: var(--card);
    border-radius: var(--radius);
    box-shadow: var(--shadow);
    padding: 2rem;
  }

  .form-group { margin-bottom: 1.2rem; }
  .form-group label {
    display: block;
    font-size: 0.83rem;
    font-weight: 600;
    color: var(--primary);
    margin-bottom: 7px;
  }
  .form-group select,
  .form-group input[type="text"] {
    width: 100%;
    padding: 11px 14px;
    border: 1.5px solid var(--border);
    border-radius: 8px;
    font-size: 0.9rem;
    color: var(--text);
    background: #fff;
    transition: border-color 0.18s, box-shadow 0.18s;
    outline: none;
    font-family: inherit;
    appearance: none;
    -webkit-appearance: none;
  }
  .form-group select {
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' viewBox='0 0 12 8'%3E%3Cpath d='M1 1l5 5 5-5' stroke='%236B7280' stroke-width='1.5' fill='none' stroke-linecap='round'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 14px center;
    padding-right: 36px;
  }
  .form-group select:focus,
  .form-group input[type="text"]:focus {
    border-color: var(--accent);
    box-shadow: 0 0 0 3px rgba(201,120,75,0.12);
  }
  .form-group input::placeholder { color: #B0B8C5; }

  .search-row { display: flex; gap: 10px; }
  .search-row .form-group:first-child { flex: 0 0 140px; }
  .search-row .form-group:last-child { flex: 1; }

  .btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 6px;
    padding: 11px 20px;
    border-radius: 8px;
    font-size: 0.9rem;
    font-weight: 600;
    text-decoration: none;
    border: none;
    cursor: pointer;
    transition: all 0.18s;
    font-family: inherit;
    width: 100%;
    margin-top: 0.5rem;
  }
  .btn-primary { background: var(--accent); color: #fff; }
  .btn-primary:hover { background: var(--accent-hover); transform: translateY(-1px); }
  .btn-outline { background: transparent; color: var(--primary); border: 1.5px solid var(--border); margin-top: 10px; }
  .btn-outline:hover { background: var(--bg); }
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
  <div class="search-header">
    <div class="icon">🔍</div>
    <h1>도서 검색</h1>
    <p>도서명 또는 저자로 원하는 책을 찾아보세요</p>
  </div>

  <div class="search-card">
    <form action="search.jsp" method="post">
      <div class="search-row">
        <div class="form-group">
          <label>검색 대상</label>
          <select name="target">
            <option value="bookName">도서명</option>
            <option value="author">저자</option>
          </select>
        </div>
        <div class="form-group">
          <label>검색어</label>
          <input type="text" name="keyword" placeholder="검색어를 입력하세요" autofocus>
        </div>
      </div>
      <button type="submit" class="btn btn-primary">검색하기</button>
      <a href="../select/list.jsp" class="btn btn-outline">전체 목록 보기</a>
    </form>
  </div>
</main>

</body>
</html>
