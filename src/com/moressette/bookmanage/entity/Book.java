package com.moressette.bookmanage.entity;

public class Book {
	private int id;
	private String isbn;
	private String bookname;
	private String author;
	private String press;
	private Double price;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Book(int id, String isbn, String bookname, String author, String press, Double price) {
		super();
		this.id = id;
		this.isbn = isbn;
		this.bookname = bookname;
		this.author = author;
		this.press = press;
		this.price = price;
	}
	
}
