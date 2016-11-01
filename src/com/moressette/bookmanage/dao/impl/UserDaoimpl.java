package com.moressette.bookmanage.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.moressette.bookmanage.DataSource.ConnectionManager;
import com.moressette.bookmanage.DataSource.SQLManager;
import com.moressette.bookmanage.dao.UserDao;
import com.moressette.bookmanage.entity.User;
import com.mysql.jdbc.Connection;

public class UserDaoimpl implements UserDao {
	ConnectionManager connectionManager = new ConnectionManager();
	Connection connection = (Connection) connectionManager.openConnection();
	SQLManager sqlManager = new SQLManager();

	public User login(User user) {
		String username = user.getUsername();
		String pwd = user.getPwd();
		String strSQL = "select * from users where username=? AND pwd=?";
		Object[] params = { username, pwd };
		ResultSet rs = sqlManager.execQuery(connection, strSQL, params);
		User u = new User();
		try {
			if(rs.next()){
				u.setId(rs.getInt("id"));
				u.setUsername("username");
				u.setPwd("pwd");
				u.setRole(rs.getInt("role"));
				return u;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public User findUsers(){
		String strSQL = "select * from users";
		Object[] params = {};
		ResultSet rs = sqlManager.execQuery(connection, strSQL, params);
		User u = new User();
		try {
			if(rs.next()){
				u.setId(rs.getInt("id"));
				u.setUsername("username");
				u.setPwd("pwd");
				u.setRole(rs.getInt("role"));
				return u;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean modifyUser(String username,String pwd){
		String strSQL = "update users set username=?,pwd=? where id=1";
		Object[] params = {username,pwd};
		if (sqlManager.execUpdate(connection, strSQL, params) > 0) {
			return true;
		}
		return false;
	}
	
}
