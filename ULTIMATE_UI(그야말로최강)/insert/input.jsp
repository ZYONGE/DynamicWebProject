<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도서 추가 — BookShelf</title>
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

  .container { max-width: 580px; margin: 2.5rem auto; padding: 0 1.5rem; }

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

  .page-header { margin-bottom: 1.5rem; }
  .page-header h1 { font-size: 1.6rem; font-weight: 700; color: var(--primary); }
  .page-header p { font-size: 0.875rem; color: var(--muted); margin-top: 4px; }

  .form-card {
    background: var(--card);
    border-radius: var(--radius);
    box-shadow: var(--shadow);
    padding: 2rem;
  }

  .form-group { margin-bottom: 1.3rem; }
  .form-group label {
    display: block;
    font-size: 0.83rem;
    font-weight: 600;
    color: var(--primary);
    margin-bottom: 7px;
  }
  .form-group label .required { color: var(--accent); margin-left: 2px; }
  .form-group input {
    width: 100%;
    padding: 10px 14px;
    border: 1.5px solid var(--border);
    border-radius: 8px;
    font-size: 0.9rem;
    color: var(--text);
    background: #fff;
    transition: border-color 0.18s, box-shadow 0.18s;
    outline: none;
    font-family: inherit;
  }
  .form-group input:focus {
    border-color: var(--accent);
    box-shadow: 0 0 0 3px rgba(201,120,75,0.12);
  }
  .form-group input::placeholder { color: #B0B8C5; }
  .form-hint { font-size: 0.78rem; color: var(--muted); margin-top: 5px; }

  .divider { height: 1px; background: var(--border); margin: 1.5rem 0; }

  .form-actions { display: flex; gap: 10px; }
  .btn {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 10px 20px;
    border-radius: 8px;
    font-size: 0.88rem;
    font-weight: 600;
    text-decoration: none;
    border: none;
    cursor: pointer;
    transition: all 0.18s;
    font-family: inherit;
  }
  .btn-primary { background: var(--accent); color: #fff; }
  .btn-primary:hover { background: var(--accent-hover); transform: translateY(-1px); }
  .btn-outline { background: transparent; color: var(--primary); border: 1.5px solid var(--border); }
  .btn-outline:hover { background: var(--bg); }
</style>
</head>
<body>

<header class="navbar">
  <a href="../select/list.jsp" class="brand">Book<span>Shelf</span></a>
  <nav>
    <a href="../select/list.jsp">도서 목록</a>
    <a href="../selectlike/input.jsp">검색</a>
    <a href="input.jsp" class="active" style="color:#fff; border-bottom-color:var(--accent)">도서 추가</a>
  </nav>
</header>

<main class="container">
  <div class="breadcrumb">
    <a href="../select/list.jsp">도서 목록</a>
    <span class="sep">›</span>
    <span>도서 추가</span>
  </div>

  <div class="page-header">
    <h1>새 도서 추가</h1>
    <p>도서 정보를 입력하고 저장하세요</p>
  </div>

  <div class="form-card">
    <form action="process.jsp" method="post">
      <div class="form-group">
        <label>도서명 <span class="required">*</span></label>
        <input type="text" name="bookName" placeholder="도서명을 입력하세요" required>
      </div>
      <div class="form-group">
        <label>저자 <span class="required">*</span></label>
        <input type="text" name="author" placeholder="저자명을 입력하세요" required>
      </div>
      <div class="form-group">
        <label>가격 <span class="required">*</span></label>
        <input type="number" name="price" placeholder="0" min="0" required>
      </div>
      <div class="form-group">
        <label>표지 이미지 파일명</label>
        <input type="text" name="bookImage" placeholder="예: book1.jpg">
        <p class="form-hint">/images/ 폴더에 있는 파일명을 입력하세요</p>
      </div>

      <div class="divider"></div>

      <div class="form-actions">
        <button type="submit" class="btn btn-primary">저장하기</button>
        <a href="../select/list.jsp" class="btn btn-outline">취소</a>
      </div>
    </form>
  </div>
</main>

</body>
</html>
