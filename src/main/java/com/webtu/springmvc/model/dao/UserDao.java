package com.webtu.springmvc.model.dao;

import java.util.List;

import com.webtu.springmvc.model.User;

public interface UserDao {
	
	User getUser(Integer id);
	
	List<User> getUsers();

	User saveUser(User user);

	User getUser(String username);

}
