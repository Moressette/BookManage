package com.moressette.bookmanage.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.moressette.bookmanage.DataSource.ConnectionManager;
import com.moressette.bookmanage.DataSource.SQLManager;
import com.moressette.bookmanage.dao.BookDao;
import com.moressette.bookmanage.entity.Book;
import com.moressette.bookmanage.util.Log;
import com.mysql.jdbc.Connection;

public class BookDaoimpl implements BookDao {
	ConnectionManager connectionManager = new ConnectionManager();
	Connection connection = (Connection) connectionManager.openConnection();
	SQLManager sqlManager = new SQLManager();
	@Override
	public List<Book> findAllBook() {
		List<Book> list = new ArrayList<Book>();
		String strSQL = "select * from books ORDER BY id";
		Object[] params = {};
		ResultSet rs = sqlManager.execQuery(connection, strSQL, params);
		try {
			while(rs.next()){
				Book book = new Book();
				book.setId(rs.getInt("id"));
				book.setIsbn(rs.getString("isbn"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setPress(rs.getString("press"));
				book.setPrice(rs.getDouble("price"));
				list.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteBook(int id){
		String strSQL = "delete from books where id=?";
		Object[] params={ id };
		if (sqlManager.execUpdate(connection, strSQL, params) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean addBooks(Book book){
		String strSQL= "insert into books(isbn,bookname,author,press,price) values (?,?,?,?,?)";
		Object[] params = { book.getIsbn(),book.getBookname(),book.getAuthor(),book.getPress(),book.getPrice() };
		if (sqlManager.execUpdate(connection, strSQL, params) > 0) {
			return true;
		}
		return false;
	}
	
	public Book findByISBN(String isbn){
		String strSQL = "select * from books where isbn=?";
		Object[] params = { isbn };
		ResultSet rs = sqlManager.execQuery(connection, strSQL, params);
		Book book = new Book();
		try {
			while(rs.next()){
				book.setId(rs.getInt("id"));
				book.setIsbn(rs.getString("isbn"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setPress(rs.getString("press"));
				book.setPrice(rs.getDouble("price"));
				return book;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Book> findByBookname(String bookname){
		List<Book> searchList = new ArrayList<Book>();
		System.out.println(bookname);
		String strSQL = "select * from books where bookname like ?";
		Object[] params = { "%"+bookname+"%" };
		Log.out(strSQL, params);
		ResultSet rs = sqlManager.execQuery(connection, strSQL, params);
		try {
			while(rs.next()){
					Book book = new Book();
					book.setId(rs.getInt("id"));
					book.setIsbn(rs.getString("isbn"));
					book.setBookname(rs.getString("bookname"));
					book.setAuthor(rs.getString("author"));
					book.setPress(rs.getString("press"));
					book.setPrice(rs.getDouble("price"));
					searchList.add(book);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return searchList;
	}
	
	public Book findByID(int id){
		String strSQL = "select * from books where id=?";
		Object[] params = { id };
		ResultSet rs = sqlManager.execQuery(connection, strSQL, params);
		Book book = new Book();
		try {
			while(rs.next()){
				book.setId(rs.getInt("id"));
				book.setIsbn(rs.getString("isbn"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setPress(rs.getString("press"));
				book.setPrice(rs.getDouble("price"));
				return book;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean modifyBook(Book book){
		String strSQL = "update books set isbn=?,bookname=?,author=?,press=?,price=? where id=?";
		Object[] params = { book.getIsbn(),book.getBookname(),book.getAuthor(),book.getPress(),book.getPrice(),book.getId()};
		if (sqlManager.execUpdate(connection, strSQL, params) > 0) {
			return true;
		}
		return false;
	}
	
}
