package com.moressette.bookmanage.entity;

public class User {
	private int id;
	private String username;
	private String pwd;
	private int role;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public User(int id, String username, String pwd, int role) {
		super();
		this.id = id;
		this.username = username;
		this.pwd = pwd;
		this.role = role;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String username, String pwd) {
		super();
		this.username = username;
		this.pwd = pwd;
	}
	

}
