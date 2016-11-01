package com.moressette.bookmanage.dao;

import com.moressette.bookmanage.entity.User;

public interface UserDao {
	public User login(User user);
	public User findUsers();
	public boolean modifyUser(String username,String pwd);
}
