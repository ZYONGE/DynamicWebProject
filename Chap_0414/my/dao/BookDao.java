package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Book;
import my.util.JdbcUtil;

public class BookDao {

	// ───────────────────────────────────────────────
	// INSERT
	// ───────────────────────────────────────────────
	public void insert(Connection conn, Book book)
			throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
				"insert into book (bookName, author, price, publishDate, bookImage)"
				+ " values(?, ?, ?, ?, ?)");
			pstmt.setString(1, book.getBookName());
			pstmt.setString(2, book.getAuthor());
			pstmt.setInt(3, book.getPrice());
			pstmt.setTimestamp(4, new Timestamp(book.getPublishDate().getTime()));
			pstmt.setString(5, book.getBookImage());
			pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	// ───────────────────────────────────────────────
	// SELECT BY ID
	// ───────────────────────────────────────────────
	public Book selectById(Connection conn, int bookId)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Book book = null;
		try {
			pstmt = conn.prepareStatement(
				"select * from book where bookId = ?");
			pstmt.setInt(1, bookId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				book = new Book();
				book.setBookId(rs.getInt("bookId"));
				book.setBookName(rs.getString("bookName"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getInt("price"));
				book.setPublishDate(rs.getTimestamp("publishDate"));
				book.setBookImage(rs.getString("bookImage"));
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return book;
	}

	// ───────────────────────────────────────────────
	// SELECT LIKE (검색)
	// ───────────────────────────────────────────────
	public List<Book> selectLike(Connection conn, String target, String keyword)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Book> books = new ArrayList<Book>();
		try {
			pstmt = conn.prepareStatement(
				"select * from book where " + target + " like ?");
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Book book = new Book();
				book.setBookId(rs.getInt("bookId"));
				book.setBookName(rs.getString("bookName"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getInt("price"));
				book.setPublishDate(rs.getTimestamp("publishDate"));
				book.setBookImage(rs.getString("bookImage"));
				books.add(book);
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return books;
	}

	// ───────────────────────────────────────────────
	// UPDATE
	// ───────────────────────────────────────────────
	public void update(Connection conn, Book book)
			throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
				"update book set bookName=?, author=?, price=?, "
				+ "publishDate=?, bookImage=? where bookId=?");
			pstmt.setString(1, book.getBookName());
			pstmt.setString(2, book.getAuthor());
			pstmt.setInt(3, book.getPrice());
			pstmt.setTimestamp(4, new Timestamp(book.getPublishDate().getTime()));
			pstmt.setString(5, book.getBookImage());
			pstmt.setInt(6, book.getBookId());
			pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	// ───────────────────────────────────────────────
	// DELETE BY ID
	// ───────────────────────────────────────────────
	public void deleteById(Connection conn, int bookId)
			throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
				"delete from book where bookId = ?");
			pstmt.setInt(1, bookId);
			pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	// ───────────────────────────────────────────────
	// SELECT COUNT
	// ───────────────────────────────────────────────
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from book");
			rs.next();
			return rs.getInt(1);
		} finally {
			// 오류 수정 1: conn은 호출자가 닫음
			JdbcUtil.close(stmt);
			JdbcUtil.close(rs);
		}
	}

	// ───────────────────────────────────────────────
	// SELECT ALL LIST
	// ───────────────────────────────────────────────
	public List<Book> selectList(Connection conn)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Book> bookList = new ArrayList<Book>();
		try {
			pstmt = conn.prepareStatement("select * from book");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Book book = new Book();
				book.setBookId(rs.getInt("bookId"));
				book.setBookName(rs.getString("bookName"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getInt("price"));
				book.setPublishDate(rs.getTimestamp("publishDate"));
				book.setBookImage(rs.getString("bookImage"));
				bookList.add(book);
			}
		} finally {
			// conn은 호출자가 닫음
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return bookList;
	}
}



















