package com.moressette.bookmanage.dao;

import java.util.List;

import com.moressette.bookmanage.entity.Book;


public interface BookDao {
	public List<Book> findAllBook();
	public boolean deleteBook(int id);
	public boolean addBooks(Book book);
	public Book findByISBN(String isbn);
	public List<Book> findByBookname(String bookname);
	public Book findByID(int id);
	public boolean modifyBook(Book book);
}
